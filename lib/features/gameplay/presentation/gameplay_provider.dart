import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/game_engine/hints/hint_solver.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_exception.dart';

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
  final RewardResult? lastReward;

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
    RewardResult? lastReward,
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

  @override
  void dispose() {
    _stepTimer?.cancel();
    super.dispose();
  }

  void addPathPoint(GridPosition position) {
    if (state.uiPhase != GameplayUiPhase.drawing) return;
    final session = state.session;
    try {
      session.appendDraftPosition(position);
      state = state.copyWith(session: session);
    } on GameplaySessionException {
      // Path validation deferred to M1.3+; lifecycle errors are ignored in prototype UI.
    }
  }

  void undo() {
    if (state.uiPhase != GameplayUiPhase.drawing) return;
    final session = state.session;
    try {
      session.undoDraftPath();
      state = state.copyWith(session: session);
    } on GameplaySessionException {
      // Invalid phase — no-op.
    }
  }

  void erase() {
    if (state.uiPhase != GameplayUiPhase.drawing) return;
    final session = state.session;
    try {
      session.resetDraftPath();
      state = state.copyWith(session: session);
    } on GameplaySessionException {
      // Invalid phase — no-op.
    }
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

    session.appendDraftPosition(solution[nextIndex]);
    state = state.copyWith(session: session);
  }

  void go() {
    if (state.uiPhase != GameplayUiPhase.drawing) return;

    final session = state.session;
    try {
      session.confirmPath();
    } on GameplaySessionException {
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
    // M1.2: engine execution not implemented — UI animation completes without outcome.
    state = state.copyWith(uiPhase: GameplayUiPhase.drawing);
    state.session.restart();
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

  RewardResult? get lastReward => state.lastReward;
}

final gameplayControllerProvider = StateNotifierProvider.autoDispose
    .family<GameplayController, GameplayUiState, LevelDefinition>(
  (ref, level) => GameplayController(ref, level),
);
