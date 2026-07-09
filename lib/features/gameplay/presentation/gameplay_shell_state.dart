import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

/// Shell lifecycle phases for gameplay presentation.
enum GameplayShellPhase {
  settling,
  observation,
  planning,
  executing,
  executionComplete,
  terminalWon,
  terminalLost,
  paused,
}

/// UI shell state bound to [GameplaySession].
class GameplayShellState {
  const GameplayShellState({
    required this.session,
    this.phase = GameplayShellPhase.settling,
    this.isPausedOverlayVisible = false,
    this.invalidInputMessage,
    this.invalidTarget,
    this.selectedTile,
    this.primaryStatusMessage,
    this.retryCount = 0,
  });

  final GameplaySession session;
  final GameplayShellPhase phase;
  final bool isPausedOverlayVisible;
  final String? invalidInputMessage;
  final GridPosition? invalidTarget;
  final GridPosition? selectedTile;
  final String? primaryStatusMessage;
  final int retryCount;

  LevelDefinition get level => session.level;

  List<GridPosition> get draftPath => session.draftPath;

  bool get canConfirmDraft =>
      session.canUpdateDraftPath && session.validateDraftPath().isValid;

  bool get hasDraftPath => session.draftPath.isNotEmpty;

  bool get isExecutionLocked =>
      phase == GameplayShellPhase.executing ||
      phase == GameplayShellPhase.executionComplete;

  bool get isTerminal =>
      phase == GameplayShellPhase.terminalWon ||
      phase == GameplayShellPhase.terminalLost;

  bool get isInteractionLocked => isExecutionLocked || isTerminal;

  int get initialGemCount => level.grid.countGems();

  int get initialKeyCount => level.grid.countKeys();

  int get remainingGemCount => session.grid.countGems();

  int get collectedGemCount => session.context.gemsCollected;

  Set<String> get collectedKeyIds => session.context.collectedKeys;

  /// Live objective progress derived from engine session state.
  String? get objectiveProgressLabel {
    final objectives = level.objectives;
    final context = session.context;

    switch (session.phase) {
      case GameplayPhase.won:
        return 'Objectives complete';
      case GameplayPhase.lost:
        return session.statusMessage ?? 'Objective not met';
      case GameplayPhase.drawing:
      case GameplayPhase.executing:
        break;
    }

    final parts = <String>[];
    if (objectives.reachExit) {
      parts.add(context.reachedExit ? 'Exit reached' : 'Exit pending');
    }
    if (objectives.collectAllGems) {
      parts.add(
        '$collectedGemCount collected · $remainingGemCount remaining',
      );
    } else if (objectives.minGems > 0) {
      parts.add('$collectedGemCount / ${objectives.minGems} gems');
    }

    if (parts.isEmpty) {
      return isExecutionLocked ? 'In progress' : null;
    }
    return parts.join(' · ');
  }

  /// Lightweight completion feedback for the primary action bar.
  String? completionStatusCue({required bool hasNextLevel}) {
    return switch (phase) {
      GameplayShellPhase.executing => 'Explorer advancing along your route…',
      GameplayShellPhase.executionComplete =>
        'Execution complete — objectives evaluated',
      GameplayShellPhase.terminalWon => hasNextLevel
          ? 'Objectives complete — continue when ready'
          : 'Final chamber cleared — no further levels',
      GameplayShellPhase.terminalLost =>
        '${session.statusMessage ?? 'Objective not met'} — try again when ready',
      _ => null,
    };
  }

  /// Path linework for the board — draft while planning, remaining route while executing.
  List<GridPosition> get visualPath {
    final confirmed = session.confirmedPath;
    if (confirmed != null && confirmed.isNotEmpty) {
      final index = session.executionPathIndex.clamp(0, confirmed.length - 1);
      return confirmed.sublist(index);
    }
    return session.draftPath;
  }

  /// Explorer tile from engine state during execution; start tile while planning.
  GridPosition? get explorerPosition {
    if (session.confirmedPath != null) {
      return session.currentPosition;
    }
    return session.grid.findStart();
  }

  int get remainingExecutionSteps {
    final confirmed = session.confirmedPath;
    if (confirmed == null || confirmed.isEmpty) {
      return 0;
    }
    return confirmed.length - 1 - session.executionPathIndex;
  }

  GameplayShellState copyWith({
    GameplaySession? session,
    GameplayShellPhase? phase,
    bool? isPausedOverlayVisible,
    String? invalidInputMessage,
    GridPosition? invalidTarget,
    GridPosition? selectedTile,
    String? primaryStatusMessage,
    int? retryCount,
    bool clearInvalidInputMessage = false,
    bool clearInvalidTarget = false,
    bool clearSelectedTile = false,
    bool clearPrimaryStatusMessage = false,
  }) {
    return GameplayShellState(
      session: session ?? this.session,
      phase: phase ?? this.phase,
      isPausedOverlayVisible:
          isPausedOverlayVisible ?? this.isPausedOverlayVisible,
      invalidInputMessage: clearInvalidInputMessage
          ? null
          : (invalidInputMessage ?? this.invalidInputMessage),
      invalidTarget:
          clearInvalidTarget ? null : (invalidTarget ?? this.invalidTarget),
      selectedTile:
          clearSelectedTile ? null : (selectedTile ?? this.selectedTile),
      primaryStatusMessage: clearPrimaryStatusMessage
          ? null
          : (primaryStatusMessage ?? this.primaryStatusMessage),
      retryCount: retryCount ?? this.retryCount,
    );
  }
}

String objectiveLabelForLevel(LevelDefinition level) {
  final parts = <String>[];
  if (level.objectives.reachExit) {
    parts.add('Reach the exit');
  }
  if (level.objectives.collectAllGems) {
    parts.add('Collect all gems');
  } else if (level.objectives.minGems > 0) {
    parts.add('Collect at least ${level.objectives.minGems} gems');
  }
  return parts.isEmpty ? 'Complete the chamber' : parts.join(' · ');
}
