import 'package:labyrinth_legends/game_engine/discovery/discovery_engine.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';

/// Immutable snapshot of one level attempt per [Engine_Architecture.md] EA-004.
class GameplaySessionState {
  GameplaySessionState({
    required this.level,
    required this.phase,
    required List<GridPosition> draftPath,
    List<GridPosition>? confirmedPath,
    GameplayAttemptContext? attemptContext,
    this.lifecycleMessage,
    this.executionPathIndex = 0,
    this.runtimeGrid,
    this.executionComplete = false,
    this.rewardResult,
  })  : draftPath = List<GridPosition>.unmodifiable(draftPath),
        confirmedPath = confirmedPath == null
            ? null
            : List<GridPosition>.unmodifiable(confirmedPath),
        attemptContext = attemptContext ?? GameplayAttemptContext();

  factory GameplaySessionState.initial(
    LevelDefinition level, {
    DiscoveryEngine? discoveryEngine,
  }) {
    final engine =
        discoveryEngine ?? DiscoveryEngine(discoveryMode: level.discoveryMode);
    final runtimeGrid = _initialRuntimeGrid(level, engine);

    return GameplaySessionState(
      level: level,
      phase: GameplayPhase.drawing,
      draftPath: const [],
      runtimeGrid: runtimeGrid,
    );
  }

  static MazeGrid? _initialRuntimeGrid(
    LevelDefinition level,
    DiscoveryEngine engine,
  ) {
    if (level.discoveryMode == DiscoveryMode.full) {
      return null;
    }
    return engine.applyInitialVisibility(level.grid);
  }

  final LevelDefinition level;
  final GameplayPhase phase;
  final List<GridPosition> draftPath;
  final List<GridPosition>? confirmedPath;
  final GameplayAttemptContext attemptContext;
  final String? lifecycleMessage;
  final int executionPathIndex;
  final MazeGrid? runtimeGrid;
  final bool executionComplete;
  final RewardResult? rewardResult;

  /// Runtime grid during execution; static level grid otherwise.
  MazeGrid get grid => runtimeGrid ?? level.grid;

  bool get isDrawing => phase == GameplayPhase.drawing;
  bool get isExecuting => phase == GameplayPhase.executing;
  bool get isTerminal => phase == GameplayPhase.won || phase == GameplayPhase.lost;

  /// Path shown to UI: confirmed path after commit, otherwise draft.
  List<GridPosition> get displayPath =>
      confirmedPath ?? List<GridPosition>.unmodifiable(draftPath);

  bool get hasConfirmedPath => confirmedPath != null;

  GridPosition? get currentExecutionPosition {
    final path = confirmedPath;
    if (path == null || path.isEmpty) {
      return null;
    }
    return path[executionPathIndex];
  }

  GameplaySessionState copyWith({
    LevelDefinition? level,
    GameplayPhase? phase,
    List<GridPosition>? draftPath,
    List<GridPosition>? confirmedPath,
    bool clearConfirmedPath = false,
    GameplayAttemptContext? attemptContext,
    String? lifecycleMessage,
    bool clearLifecycleMessage = false,
    int? executionPathIndex,
    MazeGrid? runtimeGrid,
    bool clearRuntimeGrid = false,
    bool? executionComplete,
    RewardResult? rewardResult,
    bool clearRewardResult = false,
  }) {
    return GameplaySessionState(
      level: level ?? this.level,
      phase: phase ?? this.phase,
      draftPath: draftPath ?? this.draftPath,
      confirmedPath:
          clearConfirmedPath ? null : (confirmedPath ?? this.confirmedPath),
      attemptContext: attemptContext ?? this.attemptContext,
      lifecycleMessage: clearLifecycleMessage
          ? null
          : (lifecycleMessage ?? this.lifecycleMessage),
      executionPathIndex: executionPathIndex ?? this.executionPathIndex,
      runtimeGrid: clearRuntimeGrid ? null : (runtimeGrid ?? this.runtimeGrid),
      executionComplete: executionComplete ?? this.executionComplete,
      rewardResult: clearRewardResult ? null : (rewardResult ?? this.rewardResult),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GameplaySessionState &&
        other.level == level &&
        other.phase == phase &&
        _listEquals(other.draftPath, draftPath) &&
        _listEquals(other.confirmedPath, confirmedPath) &&
        other.attemptContext == attemptContext &&
        other.lifecycleMessage == lifecycleMessage &&
        other.executionPathIndex == executionPathIndex &&
        other.runtimeGrid == runtimeGrid &&
        other.executionComplete == executionComplete &&
        other.rewardResult == rewardResult;
  }

  @override
  int get hashCode => Object.hash(
        level,
        phase,
        Object.hashAll(draftPath),
        confirmedPath == null ? null : Object.hashAll(confirmedPath!),
        attemptContext,
        lifecycleMessage,
        executionPathIndex,
        runtimeGrid,
        executionComplete,
        rewardResult,
      );
}

bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (identical(a, b)) return true;
  if (a == null || b == null) return a == b;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
