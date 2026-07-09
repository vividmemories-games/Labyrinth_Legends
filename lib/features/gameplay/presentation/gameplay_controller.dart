import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/features/gameplay/level_navigator.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_feedback.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_exception.dart';

/// Mediates draft path input and execution orchestration for [GameplaySession].
class GameplayController extends StateNotifier<GameplayShellState> {
  GameplayController(LevelDefinition level)
      : super(
          GameplayShellState(
            session: GameplaySession(level: level),
            phase: GameplayShellPhase.settling,
          ),
        ) {
    _initializeShell();
  }

  Timer? _executionTimer;
  var _disposed = false;

  GameplaySession get session => state.session;

  void close() {
    _disposed = true;
    _executionTimer?.cancel();
  }

  void _initializeShell() {
    state = state.copyWith(phase: GameplayShellPhase.observation);
  }

  void _publishSession() {
    state = state.copyWith(
      session: state.session,
      clearInvalidInputMessage: true,
      clearInvalidTarget: true,
      clearPrimaryStatusMessage: true,
      phase: state.session.draftPath.isEmpty
          ? GameplayShellPhase.observation
          : GameplayShellPhase.planning,
    );
  }

  void handleTileInteraction(GridPosition position) {
    if (state.isInteractionLocked) return;
    if (state.phase == GameplayShellPhase.paused) return;

    final session = state.session;
    if (!session.canUpdateDraftPath) return;

    final grid = session.grid;
    if (!grid.isInBounds(position)) {
      _rejectInput('Outside the chamber bounds', position);
      return;
    }

    final cell = grid.cellAt(position);
    if (!cell.isWalkable) {
      _rejectInput('That tile is blocked', position);
      return;
    }

    if (state.isLockBlockedAt(position)) {
      _rejectInput('This gate is locked — collect the key first', position);
      return;
    }

    final path = session.draftPath;
    final start = grid.findStart();

    if (path.isEmpty) {
      if (start != null && position == start) {
        _appendPosition(position);
        return;
      }
      _rejectInput('Begin on the explorer tile', position);
      return;
    }

    final last = path.last;
    if (position == last) {
      state = state.copyWith(selectedTile: position);
      return;
    }

    if (path.length >= 2 && position == path[path.length - 2]) {
      session.undoDraftPath();
      _publishSession();
      return;
    }

    if (!position.isAdjacentTo(last)) {
      _rejectInput('Move one tile at a time', position);
      return;
    }

    if (!grid.canTraverse(last, position)) {
      _rejectInput('That path is blocked', position);
      return;
    }

    _appendPosition(position);
  }

  void _appendPosition(GridPosition position) {
    try {
      state.session.appendDraftPosition(position);
      _publishSession();
    } on GameplaySessionException {
      _rejectInput('Cannot update path right now', position);
    }
  }

  void _rejectInput(String message, GridPosition position) {
    state = state.copyWith(
      invalidInputMessage: message,
      invalidTarget: position,
      selectedTile: position,
      clearPrimaryStatusMessage: true,
    );
  }

  void clearDraftPath() {
    if (!state.session.canUpdateDraftPath) return;
    state.session.resetDraftPath();
    state = state.copyWith(
      session: state.session,
      phase: GameplayShellPhase.observation,
      clearInvalidInputMessage: true,
      clearInvalidTarget: true,
      clearSelectedTile: true,
      primaryStatusMessage: 'Path cleared — plan a new route',
    );
  }

  void undoDraftPath() {
    if (!state.session.canUpdateDraftPath) return;
    state.session.undoDraftPath();
    _publishSession();
  }

  /// Confirms the draft path and drives tile-by-tile engine execution.
  void onPrimaryAction() {
    if (!state.canConfirmDraft) return;

    try {
      state.session.confirmPath();
    } on GameplaySessionException catch (error) {
      state = state.copyWith(
        primaryStatusMessage: error.message,
        clearInvalidInputMessage: true,
        clearInvalidTarget: true,
      );
      return;
    }

    state = state.copyWith(
      session: state.session,
      phase: GameplayShellPhase.executing,
      clearInvalidInputMessage: true,
      clearInvalidTarget: true,
      clearPrimaryStatusMessage: true,
    );
    _scheduleNextExecutionStep();
  }

  void _scheduleNextExecutionStep() {
    _executionTimer?.cancel();
    _executionTimer = Timer(GameConstants.pathStepDuration, _executeStep);
  }

  void _executeStep() {
    if (_disposed || state.phase != GameplayShellPhase.executing) {
      return;
    }

    final session = state.session;
    if (session.phase != GameplayPhase.executing) {
      _finishExecution();
      return;
    }

    session.executeNextStep();
    state = state.copyWith(session: session);

    if (session.phase == GameplayPhase.executing &&
        !session.executionComplete) {
      _scheduleNextExecutionStep();
      return;
    }

    _finishExecution();
  }

  void _finishExecution() {
    _executionTimer?.cancel();

    final session = state.session;
    final shellPhase = switch (session.phase) {
      GameplayPhase.won => GameplayShellPhase.terminalWon,
      GameplayPhase.lost => GameplayShellPhase.terminalLost,
      GameplayPhase.executing => GameplayShellPhase.executionComplete,
      GameplayPhase.drawing => GameplayShellPhase.executionComplete,
    };

    state = state.copyWith(
      session: session,
      phase: shellPhase,
      clearPrimaryStatusMessage: true,
    );
  }

  /// Restarts the current level attempt in-place — terminal lost only (M2.5).
  void tryAgain() {
    if (state.phase != GameplayShellPhase.terminalLost) return;

    state.session.restart();
    state = state.copyWith(
      session: state.session,
      phase: GameplayShellPhase.observation,
      retryCount: state.retryCount + 1,
      clearInvalidInputMessage: true,
      clearInvalidTarget: true,
      clearPrimaryStatusMessage: true,
      clearSelectedTile: true,
    );
  }

  String? get nextLevelId => LevelNavigator.nextLevelIdAfter(state.level.id);

  bool get hasNextLevel => nextLevelId != null;

  void pause() {
    if (state.isInteractionLocked) return;

    if (state.phase == GameplayShellPhase.observation ||
        state.phase == GameplayShellPhase.planning) {
      state = state.copyWith(
        phase: GameplayShellPhase.paused,
        isPausedOverlayVisible: true,
      );
    }
  }

  void resume() {
    if (state.phase == GameplayShellPhase.paused) {
      state = state.copyWith(
        phase: state.session.draftPath.isEmpty
            ? GameplayShellPhase.observation
            : GameplayShellPhase.planning,
        isPausedOverlayVisible: false,
      );
    }
  }

  String get engineStatusLabel {
    final sessionPhase = state.session.phase.name;
    return switch (state.phase) {
      GameplayShellPhase.settling => 'Settling',
      GameplayShellPhase.observation => 'Ready · $sessionPhase',
      GameplayShellPhase.planning => 'Planning · $sessionPhase',
      GameplayShellPhase.executing => 'Executing · $sessionPhase',
      GameplayShellPhase.executionComplete => 'Evaluating · $sessionPhase',
      GameplayShellPhase.terminalWon => 'Won · $sessionPhase',
      GameplayShellPhase.terminalLost => 'Lost · $sessionPhase',
      GameplayShellPhase.paused => 'Paused · $sessionPhase',
    };
  }

  String get debugDetailsLabel {
    final session = state.session;
    final explorer = state.explorerPosition;
    final explorerLabel =
        explorer == null ? '--' : '${explorer.row},${explorer.col}';
    final nextId = nextLevelId ?? 'none';
    final terminal = switch (state.phase) {
      GameplayShellPhase.terminalWon => 'won',
      GameplayShellPhase.terminalLost => 'lost',
      _ => 'none',
    };

    return 'Level: ${state.level.id} | '
        'Next: $nextId | '
        'Terminal: $terminal | '
        'Retries: ${state.retryCount} | '
        'Shell: ${state.phase.name} | '
        'Mode: ${state.interactionMode.name} | '
        'Feedback: ${state.feedbackState.name} | '
        'Objective: ${state.activeObjectiveSummary} | '
        'Input: ${state.isBoardInputEnabled ? 'on' : 'off'} | '
        'Phase: ${session.phase.name} | '
        'Gems: ${state.collectedGemCount}/${state.initialGemCount} | '
        'Explorer: $explorerLabel';
  }
}

final gameplayControllerProvider = StateNotifierProvider.autoDispose
    .family<GameplayController, GameplayShellState, LevelDefinition>(
  (ref, level) {
    final controller = GameplayController(level);
    ref.onDispose(controller.close);
    return controller;
  },
);
