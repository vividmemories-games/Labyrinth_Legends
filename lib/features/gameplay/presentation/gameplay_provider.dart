import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/game_engine/hints/hint_solver.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_calculator.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

enum GameplayUiPhase { drawing, executing, paused, won, lost }

class GameplayUiState {
  const GameplayUiState({
    required this.session,
    this.uiPhase = GameplayUiPhase.drawing,
    this.executionIndex = 0,
    this.lastReward,
  });

  final GameplaySession session;
  final GameplayUiPhase uiPhase;
  final int executionIndex;
  final RewardCalculationResult? lastReward;

  LevelDefinition get level => session.level;
  List<GridPosition> get path => session.path;
  String? get message => session.statusMessage;

  GridPosition? get characterPosition {
    if (uiPhase == GameplayUiPhase.executing && path.isNotEmpty) {
      final index = executionIndex.clamp(0, path.length - 1);
      return path[index];
    }
    if (path.isNotEmpty) return path.last;
    return session.grid.findStart();
  }

  GameplayUiState copyWith({
    GameplaySession? session,
    GameplayUiPhase? uiPhase,
    int? executionIndex,
    RewardCalculationResult? lastReward,
  }) {
    return GameplayUiState(
      session: session ?? this.session,
      uiPhase: uiPhase ?? this.uiPhase,
      executionIndex: executionIndex ?? this.executionIndex,
      lastReward: lastReward ?? this.lastReward,
    );
  }
}

class GameplayController extends StateNotifier<GameplayUiState> {
  GameplayController(this._ref, LevelDefinition level)
      : super(
          GameplayUiState(session: GameplaySession(level: level)),
        );

  final Ref _ref;
  Timer? _stepTimer;
  final _hintSolver = HintSolver();
  final _rewardCalculator = const RewardCalculator();

  @override
  void dispose() {
    _stepTimer?.cancel();
    super.dispose();
  }

  void addPathPoint(GridPosition position) {
    if (state.uiPhase != GameplayUiPhase.drawing) return;
    final session = state.session;
    session.tryAddToPath(position);
    state = state.copyWith(session: session);
  }

  void undo() {
    if (state.uiPhase != GameplayUiPhase.drawing) return;
    final session = state.session;
    session.undo();
    state = state.copyWith(session: session);
  }

  void erase() {
    if (state.uiPhase != GameplayUiPhase.drawing) return;
    final session = state.session;
    session.erase();
    state = state.copyWith(session: session);
  }

  Future<void> useHint() async {
    if (state.uiPhase != GameplayUiPhase.drawing) return;

    final session = state.session;
    final solution = _hintSolver.findShortestPath(grid: session.grid);
    if (solution == null || solution.length < 2) return;

    final currentIndex = session.path.isEmpty
        ? 0
        : solution.indexWhere((p) => p == session.path.last);
    final nextIndex = currentIndex + 1;
    if (nextIndex < 0 || nextIndex >= solution.length) return;

    final used = await _ref.read(playerProgressProvider.notifier).useHint();
    if (!used) return;

    session.tryAddToPath(solution[nextIndex]);
    state = state.copyWith(session: session);
  }

  void go() {
    if (state.uiPhase != GameplayUiPhase.drawing) return;

    final session = state.session;
    final validation = session.validatePath(requireExit: true);
    if (!validation.isValid) {
      state = state.copyWith(session: session);
      return;
    }

    state = state.copyWith(
      uiPhase: GameplayUiPhase.executing,
      executionIndex: 0,
      session: session,
    );
    _runExecutionStep();
  }

  void _runExecutionStep() {
    _stepTimer?.cancel();
    if (state.executionIndex >= state.path.length) {
      _finishExecution();
      return;
    }

    _stepTimer = Timer(GameConstants.pathStepDuration, () {
      final nextIndex = state.executionIndex + 1;
      state = state.copyWith(executionIndex: nextIndex);
      if (nextIndex >= state.path.length) {
        _finishExecution();
      } else {
        _runExecutionStep();
      }
    });
  }

  void _finishExecution() {
    final session = state.session;
    final won = session.go();
    final reward = won
        ? _rewardCalculator.calculate(
            level: session.level,
            pathLength: session.path.length,
            gemsCollected: session.context.gemsCollected,
            totalGems: session.level.grid.countGems(),
          )
        : null;

    state = state.copyWith(
      session: session,
      uiPhase: won ? GameplayUiPhase.won : GameplayUiPhase.lost,
      lastReward: reward,
    );
  }

  void pause() {
    if (state.uiPhase == GameplayUiPhase.drawing ||
        state.uiPhase == GameplayUiPhase.executing) {
      _stepTimer?.cancel();
      state = state.copyWith(uiPhase: GameplayUiPhase.paused);
    }
  }

  void resume() {
    if (state.uiPhase != GameplayUiPhase.paused) return;
    if (state.executionIndex > 0 && state.executionIndex < state.path.length) {
      state = state.copyWith(uiPhase: GameplayUiPhase.executing);
      _runExecutionStep();
    } else {
      state = state.copyWith(uiPhase: GameplayUiPhase.drawing);
    }
  }

  void reset() {
    _stepTimer?.cancel();
    state = GameplayUiState(session: GameplaySession(level: state.level));
  }

  RewardCalculationResult? get lastReward => state.lastReward;
}

final gameplayControllerProvider = StateNotifierProvider.autoDispose
    .family<GameplayController, GameplayUiState, LevelDefinition>(
  (ref, level) => GameplayController(ref, level),
);
