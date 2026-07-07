import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/objective_card.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/resource_display.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_error.dart';

/// Presentation-only interaction mode for debug and HUD cues (M2.6).
enum GameplayInteractionMode {
  observation,
  planning,
  executing,
  terminal,
  paused,
  locked,
}

/// Presentation-only feedback state derived from shell + session (M2.6).
enum GameplayFeedbackState {
  idle,
  planning,
  invalidInput,
  pathReady,
  executing,
  objectiveUpdate,
  terminalWon,
  terminalLost,
  pathCleared,
}

/// Draft validation failures that should interrupt planning with corrective feedback.
///
/// Incomplete drafts (for example not yet at exit) are intentionally excluded.
const _actionableDraftValidationCodes = {
  PathValidationErrorCode.outOfBounds,
  PathValidationErrorCode.notWalkable,
  PathValidationErrorCode.hiddenCell,
  PathValidationErrorCode.notAdjacent,
  PathValidationErrorCode.lockedWithoutKey,
  PathValidationErrorCode.notAtStart,
};

/// Maps [GameplayShellState] to feedback presentation — no gameplay rules.
extension GameplayShellFeedback on GameplayShellState {
  GameplayInteractionMode get interactionMode {
    if (phase == GameplayShellPhase.paused) {
      return GameplayInteractionMode.paused;
    }
    if (isTerminal) {
      return GameplayInteractionMode.terminal;
    }
    if (isExecutionLocked) {
      return GameplayInteractionMode.executing;
    }
    if (phase == GameplayShellPhase.planning || hasDraftPath) {
      return GameplayInteractionMode.planning;
    }
    if (!session.canUpdateDraftPath) {
      return GameplayInteractionMode.locked;
    }
    return GameplayInteractionMode.observation;
  }

  GameplayFeedbackState get feedbackState {
    if (invalidInputMessage != null) {
      return GameplayFeedbackState.invalidInput;
    }
    if (primaryStatusMessage != null &&
        primaryStatusMessage!.startsWith('Path cleared')) {
      return GameplayFeedbackState.pathCleared;
    }
    return switch (phase) {
      GameplayShellPhase.executing => GameplayFeedbackState.executing,
      GameplayShellPhase.executionComplete =>
        GameplayFeedbackState.objectiveUpdate,
      GameplayShellPhase.terminalWon => GameplayFeedbackState.terminalWon,
      GameplayShellPhase.terminalLost => GameplayFeedbackState.terminalLost,
      GameplayShellPhase.planning when canConfirmDraft =>
        GameplayFeedbackState.pathReady,
      GameplayShellPhase.planning ||
      GameplayShellPhase.observation when hasDraftPath =>
        GameplayFeedbackState.planning,
      _ => GameplayFeedbackState.idle,
    };
  }

  String get activeObjectiveSummary =>
      objectiveProgressLabel ?? objectiveLabelForLevel(level);

  bool get isBoardInputEnabled =>
      phase != GameplayShellPhase.paused && !isInteractionLocked;

  /// Keys collected along the current draft path (planning) plus session inventory.
  Set<String> get effectiveKeyIds {
    final keys = <String>{...session.context.collectedKeys};
    for (final position in session.draftPath) {
      final keyId = session.grid.cellAt(position).keyId;
      if (keyId != null) {
        keys.add(keyId);
      }
    }
    return keys;
  }

  /// Actionable validation code for the current draft, if any.
  PathValidationErrorCode? get draftPathActionableValidationCode {
    if (!hasDraftPath || canConfirmDraft) {
      return null;
    }
    final code = session.validateDraftPath().errorCode;
    if (code == null || !_actionableDraftValidationCodes.contains(code)) {
      return null;
    }
    return code;
  }

  /// Human-readable reason the draft cannot be confirmed — actionable errors only.
  String? get draftPathValidationMessage {
    if (draftPathActionableValidationCode == null) {
      return null;
    }
    return session.validateDraftPath().message;
  }

  /// Status icon for actionable draft validation, when [draftPathValidationMessage] is set.
  GameplayHudIconKind? get draftPathValidationIcon {
    return switch (draftPathActionableValidationCode) {
      PathValidationErrorCode.lockedWithoutKey =>
        GameplayHudIconKind.statusLock,
      null => null,
      _ => GameplayHudIconKind.statusBlock,
    };
  }

  bool isLockBlockedAt(GridPosition position) {
    final cell = session.grid.cellAtOrNull(position);
    if (cell == null || cell.lockId == null) {
      return false;
    }
    return !effectiveKeyIds.contains(cell.lockId);
  }

  /// Walkable orthogonal neighbors eligible for planning extension hints.
  Set<GridPosition> get planningExtensionHints {
    if (isInteractionLocked || !session.canUpdateDraftPath) {
      return const {};
    }

    final grid = session.grid;
    final path = session.draftPath;
    if (path.isEmpty) {
      final start = grid.findStart();
      return start != null ? {start} : const {};
    }

    final hints = <GridPosition>{};
    for (final neighbor in path.last.orthogonalNeighbors()) {
      if (!grid.isInBounds(neighbor)) continue;
      if (!grid.cellAt(neighbor).isWalkable) continue;
      if (!grid.canTraverse(path.last, neighbor)) continue;
      if (isLockBlockedAt(neighbor)) continue;
      hints.add(neighbor);
    }
    return hints;
  }

  /// Confirmed path tiles already traversed during execution.
  Set<GridPosition> get traversedPathPositions {
    if (phase != GameplayShellPhase.executing &&
        phase != GameplayShellPhase.executionComplete) {
      return const {};
    }

    final confirmed = session.confirmedPath;
    if (confirmed == null || confirmed.isEmpty) {
      return const {};
    }

    final index = session.executionPathIndex;
    if (index <= 0) {
      return const {};
    }
    return confirmed.sublist(0, index).toSet();
  }

  ObjectiveCardState get objectiveCardState {
    return switch (phase) {
      GameplayShellPhase.terminalWon => ObjectiveCardState.completed,
      GameplayShellPhase.terminalLost => ObjectiveCardState.failed,
      GameplayShellPhase.executing ||
      GameplayShellPhase.executionComplete =>
        ObjectiveCardState.updating,
      GameplayShellPhase.planning ||
      GameplayShellPhase.observation when hasDraftPath =>
        ObjectiveCardState.focused,
      _ => ObjectiveCardState.idle,
    };
  }

  ResourceDisplayState get resourceDisplayState {
    if (phase == GameplayShellPhase.executing && collectedGemCount > 0) {
      return ResourceDisplayState.updating;
    }
    if (isTerminal && collectedGemCount > 0) {
      return ResourceDisplayState.emphasized;
    }
    return ResourceDisplayState.idle;
  }
}
