import 'package:labyrinth_legends/game_engine/discovery/discovery_engine.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/objectives/objective_evaluator.dart';
import 'package:labyrinth_legends/game_engine/objectives/objective_outcome.dart';
import 'package:labyrinth_legends/game_engine/path/path_executor.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_result.dart';
import 'package:labyrinth_legends/game_engine/path/path_validator.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_calculator.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_exception.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_state.dart';
import 'package:labyrinth_legends/game_engine/session/step_result.dart';

/// Single public gameplay engine API for one level attempt per EA-001.
class GameplaySession {
  GameplaySession({
    required LevelDefinition level,
    PathValidator? pathValidator,
    PathExecutor? pathExecutor,
    ObjectiveEvaluator? objectiveEvaluator,
    RewardCalculator? rewardCalculator,
    DiscoveryEngine? discoveryEngine,
  })  : _pathValidator = pathValidator ?? const PathValidator(),
        _pathExecutor = pathExecutor ?? const PathExecutor(),
        _objectiveEvaluator = objectiveEvaluator ?? const ObjectiveEvaluator(),
        _rewardCalculator = rewardCalculator ?? const RewardCalculator(),
        _discoveryEngine =
            discoveryEngine ?? DiscoveryEngine(discoveryMode: level.discoveryMode),
        _state = GameplaySessionState.initial(
          level,
          discoveryEngine: discoveryEngine ??
              DiscoveryEngine(discoveryMode: level.discoveryMode),
        );

  final PathValidator _pathValidator;
  final PathExecutor _pathExecutor;
  final ObjectiveEvaluator _objectiveEvaluator;
  final RewardCalculator _rewardCalculator;
  final DiscoveryEngine _discoveryEngine;
  GameplaySessionState _state;

  /// Current immutable session snapshot.
  GameplaySessionState get state => _state;

  LevelDefinition get level => _state.level;
  MazeGrid get grid => _state.grid;
  GameplayPhase get phase => _state.phase;
  List<GridPosition> get draftPath => _state.draftPath;
  List<GridPosition>? get confirmedPath => _state.confirmedPath;
  List<GridPosition> get path => _state.displayPath;
  GameplayAttemptContext get context => _state.attemptContext;
  String? get statusMessage => _state.lifecycleMessage;
  int get executionPathIndex => _state.executionPathIndex;
  bool get executionComplete => _state.executionComplete;
  GridPosition? get currentPosition => _state.currentExecutionPosition;
  RewardResult? get reward => _state.rewardResult;

  bool get canUpdateDraftPath => _state.isDrawing;

  /// True when a non-empty draft exists in drawing phase.
  ///
  /// Does not imply the draft passes [validateDraftPath] — use that for Go-button
  /// readiness or GP6 live feedback.
  bool get canConfirmPath =>
      _state.isDrawing && _state.draftPath.isNotEmpty && !_state.hasConfirmedPath;

  /// Validates the current draft path without changing phase.
  PathValidationResult validateDraftPath() {
    return _pathValidator.validate(
      grid: _state.grid,
      path: _state.draftPath,
      requireExit: _state.level.objectives.reachExit,
    );
  }

  /// Replaces the entire draft path. Only valid in [GameplayPhase.drawing].
  void updateDraftPath(List<GridPosition> path) {
    _assertDrawing(GameplaySessionExceptionCode.updateDraftPath);
    _state = _state.copyWith(
      draftPath: List<GridPosition>.of(path),
      runtimeGrid: _discoveryGridForDraft(path),
      clearLifecycleMessage: true,
    );
  }

  /// Clears the draft path. Only valid in [GameplayPhase.drawing].
  void resetDraftPath() {
    _assertDrawing(GameplaySessionExceptionCode.resetDraftPath);
    _state = _state.copyWith(
      draftPath: const [],
      runtimeGrid: _discoveryGridForDraft(const []),
      clearLifecycleMessage: true,
    );
  }

  /// Appends one position to the draft path without path validation.
  void appendDraftPosition(GridPosition position) {
    _assertDrawing(GameplaySessionExceptionCode.appendDraftPath);
    final path = [..._state.draftPath, position];
    _state = _state.copyWith(
      draftPath: path,
      runtimeGrid: _discoveryGridForDraft(path),
      clearLifecycleMessage: true,
    );
  }

  /// Removes the last draft position. No-op when draft is empty.
  void undoDraftPath() {
    _assertDrawing(GameplaySessionExceptionCode.undoDraftPath);
    if (_state.draftPath.isEmpty) {
      return;
    }
    final path = _state.draftPath.sublist(0, _state.draftPath.length - 1);
    _state = _state.copyWith(
      draftPath: path,
      runtimeGrid: _discoveryGridForDraft(path),
      clearLifecycleMessage: true,
    );
  }

  /// Validates via [PathValidator] then commits the draft path.
  ///
  /// On validation failure: remains in [GameplayPhase.drawing], sets
  /// [GameplaySessionState.lifecycleMessage], and throws [GameplaySessionException].
  void confirmPath() {
    _assertDrawing(GameplaySessionExceptionCode.confirmPath);

    final validation = validateDraftPath();
    if (!validation.isValid) {
      final message = validation.message ?? 'Path validation failed';
      _state = _state.copyWith(lifecycleMessage: message);
      throw GameplaySessionException(
        message,
        code: GameplaySessionExceptionCode.confirmPath,
      );
    }

    final committed = List<GridPosition>.of(_state.draftPath);
    _state = _state.copyWith(
      phase: GameplayPhase.executing,
      confirmedPath: committed,
      draftPath: const [],
      clearLifecycleMessage: true,
      executionPathIndex: 0,
      runtimeGrid: _applyDiscovery(
        _state.level.grid,
        path: committed,
      ),
      executionComplete: false,
    );
  }

  /// Advances execution by exactly one tile along the confirmed path.
  ///
  /// Returns factual [StepResult]. Invokes [ObjectiveEvaluator] after each step
  /// per GP5/GP7; [GameplaySession] applies won/lost lifecycle transitions.
  StepResult executeNextStep() {
    if (_state.phase != GameplayPhase.executing) {
      throw GameplaySessionException.invalidPhase(
        operation: GameplaySessionExceptionCode.executeNextStep,
        currentPhase: _state.phase.name,
      );
    }

    final path = _state.confirmedPath!;
    final context = _state.attemptContext;

    if (_state.executionComplete) {
      return _finalizeExecution(
        pathIndex: _state.executionPathIndex,
        position: path[_state.executionPathIndex],
        attemptContext: context,
      );
    }

    final step = _pathExecutor.executeStep(
      grid: _state.grid,
      path: path,
      currentPathIndex: _state.executionPathIndex,
      attemptContext: context,
    );

    if (step.pathComplete) {
      _state = _state.copyWith(executionComplete: true);
      return _finalizeExecution(
        pathIndex: step.pathIndex,
        position: step.position,
        attemptContext: context,
      );
    }

    final resolution = step.resolution!;
    final atPathEnd = step.pathIndex == path.length - 1;
    final discoveredGrid = _applyDiscovery(
      resolution.grid,
      path: path,
      playerPosition: step.position,
      collectedRelics: resolution.attemptContext.collectedRelics,
    );
    _state = _state.copyWith(
      executionPathIndex: step.pathIndex,
      attemptContext: resolution.attemptContext,
      runtimeGrid: discoveredGrid,
      executionComplete: atPathEnd,
    );

    _applyObjectiveEvaluation();

    if (_state.phase != GameplayPhase.executing) {
      return StepResult.moved(
        from: step.from!,
        to: step.position,
        pathIndex: step.pathIndex,
        attemptContext: _state.attemptContext,
        pathComplete: atPathEnd,
      );
    }

    return StepResult.moved(
      from: step.from!,
      to: step.position,
      pathIndex: step.pathIndex,
      attemptContext: resolution.attemptContext,
      pathComplete: atPathEnd,
    );
  }

  StepResult _finalizeExecution({
    required int pathIndex,
    required GridPosition position,
    required GameplayAttemptContext attemptContext,
  }) {
    _applyObjectiveEvaluation();
    return StepResult.pathComplete(
      pathIndex: pathIndex,
      position: position,
      attemptContext: _state.attemptContext,
    );
  }

  void _applyObjectiveEvaluation() {
    final evaluation = _objectiveEvaluator.evaluate(
      level: _state.level,
      attemptContext: _state.attemptContext,
      executionComplete: _state.executionComplete,
    );

    switch (evaluation.outcome) {
      case ObjectiveOutcome.continueExecution:
        return;
      case ObjectiveOutcome.won:
        final wonState = _state.copyWith(phase: GameplayPhase.won);
        final reward = _rewardCalculator.calculateFromTerminalSession(wonState);
        _state = wonState.copyWith(rewardResult: reward);
      case ObjectiveOutcome.lost:
        _state = _state.copyWith(
          phase: GameplayPhase.lost,
          lifecycleMessage: evaluation.reason,
        );
    }
  }

  /// Starts a new attempt for the same level.
  void restart() {
    _state = GameplaySessionState.initial(
      _state.level,
      discoveryEngine: _discoveryEngine,
    );
  }

  MazeGrid? _discoveryGridForDraft(List<GridPosition> path) {
    if (_state.level.discoveryMode == DiscoveryMode.full) {
      return null;
    }
    return _applyDiscovery(_state.level.grid, path: path);
  }

  MazeGrid _applyDiscovery(
    MazeGrid mechanicsGrid, {
    List<GridPosition>? path,
    GridPosition? playerPosition,
    Set<String>? collectedRelics,
  }) {
    switch (_discoveryEngine.discoveryMode) {
      case DiscoveryMode.full:
        return mechanicsGrid;
      case DiscoveryMode.fog:
        final revealCenters = <GridPosition>[
          if (path != null) ...path,
          if (playerPosition != null &&
              (path == null || !path.contains(playerPosition)))
            playerPosition,
        ];
        return _discoveryEngine.revealFromPath(mechanicsGrid, revealCenters);
      case DiscoveryMode.relicGated:
        final relics = collectedRelics ??
            (path == null ? _state.attemptContext.collectedRelics : _relicsAlongPath(path));
        return _discoveryEngine.revealAfterRelicCollection(
          mechanicsGrid,
          relics,
        );
    }
  }

  Set<String> _relicsAlongPath(List<GridPosition> path) {
    final relics = <String>{};
    final grid = _state.level.grid;
    for (final position in path) {
      final cell = grid.cellAt(position);
      if (cell.hasRelic) {
        relics.add(cell.relicId ?? 'relic_${position.row}_${position.col}');
      }
    }
    return relics;
  }

  void _assertDrawing(GameplaySessionExceptionCode operation) {
    if (!_state.isDrawing) {
      throw GameplaySessionException.invalidPhase(
        operation: operation,
        currentPhase: _state.phase.name,
      );
    }
  }
}
