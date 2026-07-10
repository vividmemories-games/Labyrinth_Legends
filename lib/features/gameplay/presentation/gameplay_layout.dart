import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/components.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_board_container.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Gameplay screen spatial scaffold — MVP master mockup panel 3.
class GameplayLayout extends StatelessWidget {
  const GameplayLayout({
    super.key,
    required this.levelLabel,
    required this.starCount,
    required this.grid,
    required this.visualPath,
    required this.shellPhase,
    required this.canConfirmDraft,
    required this.onTileInteraction,
    required this.onUndo,
    required this.onErase,
    required this.onHint,
    required this.onPrimaryAction,
    this.onBack,
    required this.onPause,
    required this.onResume,
    required this.isPausedOverlayVisible,
    required this.showDebugGrid,
    this.hasNextLevel = false,
    this.onTryAgain,
    this.onNextLevel,
    this.onRetryCompletionSync,
    this.explorerPosition,
    this.selectedTile,
    this.traversedPathPositions = const {},
    this.isExecuting = false,
    this.completionStatusCue,
    this.invalidTarget,
    this.feedbackMessage,
    this.primaryStatusMessage,
    this.inputEnabled = true,
    this.isInteractionLocked = false,
    this.effectiveKeyIds = const {},
    this.draftPathValidationMessage,
    this.draftPathValidationIcon,
    this.showGems = false,
    this.gemsValue,
    this.showKeys = false,
    this.keysValue,
    this.hintBadge,
    this.backgroundAsset,
    this.floorLayoutSeed = 0,
  });

  final String levelLabel;
  final int starCount;
  final MazeGrid grid;
  final List<GridPosition> visualPath;
  final GameplayShellPhase shellPhase;
  final bool canConfirmDraft;
  final ValueChanged<GridPosition> onTileInteraction;
  final VoidCallback onUndo;
  final VoidCallback onErase;
  final VoidCallback onHint;
  final VoidCallback onPrimaryAction;
  final VoidCallback? onBack;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final bool isPausedOverlayVisible;
  final bool showDebugGrid;
  final bool hasNextLevel;
  final VoidCallback? onTryAgain;
  final VoidCallback? onNextLevel;
  final VoidCallback? onRetryCompletionSync;
  final GridPosition? explorerPosition;
  final GridPosition? selectedTile;
  final Set<GridPosition> traversedPathPositions;
  final bool isExecuting;
  final String? completionStatusCue;
  final GridPosition? invalidTarget;
  final String? feedbackMessage;
  final String? primaryStatusMessage;
  final bool inputEnabled;
  final bool isInteractionLocked;
  final Set<String> effectiveKeyIds;
  final String? draftPathValidationMessage;
  final GameplayHudIconKind? draftPathValidationIcon;
  final bool showGems;
  final String? gemsValue;
  final bool showKeys;
  final String? keysValue;
  final String? hintBadge;
  final String? backgroundAsset;
  final int floorLayoutSeed;

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;

    final isExecuting = shellPhase == GameplayShellPhase.executing;
    final isEvaluating = shellPhase == GameplayShellPhase.executionComplete;
    final isTerminalWon = shellPhase == GameplayShellPhase.terminalWon;
    final isTerminalLost = shellPhase == GameplayShellPhase.terminalLost;
    final isTerminal = isTerminalWon || isTerminalLost;

    final primaryLabel = isTerminalLost
        ? 'Try Again'
        : isTerminalWon && onRetryCompletionSync != null
            ? 'Retry Save'
            : isTerminalWon
                ? 'Victory…'
                : canConfirmDraft
                    ? 'GO'
                    : 'Draw Path';

    final controlState = isExecuting
        ? GameplayControlBarState.executingHidden
        : isTerminal
            ? GameplayControlBarState.resultReady
            : isEvaluating
                ? GameplayControlBarState.disabled
                : canConfirmDraft
                    ? GameplayControlBarState.confirmReady
                    : visualPath.isEmpty
                        ? GameplayControlBarState.idle
                        : GameplayControlBarState.planning;

    final VoidCallback? primaryHandler = isTerminalLost
        ? onTryAgain
        : isTerminalWon && onRetryCompletionSync != null
            ? onRetryCompletionSync
            : isTerminalWon && hasNextLevel
                ? onNextLevel
                : canConfirmDraft && !isInteractionLocked
                    ? onPrimaryAction
                    : null;

    final statusCue = _resolveStatusCue(
      theme: theme,
      isTerminalWon: isTerminalWon,
      isTerminalLost: isTerminalLost,
      isExecuting: isExecuting,
      isEvaluating: isEvaluating,
      isTerminal: isTerminal,
      canConfirmDraft: canConfirmDraft,
      visualPathEmpty: visualPath.isEmpty,
      completionStatusCue: completionStatusCue,
      primaryStatusMessage: primaryStatusMessage,
      feedbackMessage: feedbackMessage,
      draftPathValidationMessage: draftPathValidationMessage,
      draftPathValidationIcon: draftPathValidationIcon,
    );

    final movesValue = visualPath.isEmpty
        ? '0'
        : '${visualPath.length > 1 ? visualPath.length - 1 : 0}';

    final pauseEnabled = shellPhase != GameplayShellPhase.paused &&
        shellPhase != GameplayShellPhase.executing &&
        shellPhase != GameplayShellPhase.executionComplete &&
        shellPhase != GameplayShellPhase.terminalWon &&
        shellPhase != GameplayShellPhase.terminalLost;

    final screenHeight = MediaQuery.sizeOf(context).height;
    final maxBoardHeight = screenHeight * 0.52;

    return LLScreenBackground(
      heroImageAsset: backgroundAsset,
      heroAlignment: const Alignment(0, -0.15),
      heroScale: 1.08,
      veilStrength: backgroundAsset == null ? 0.72 : 0.55,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: LLSpacing.sm),
                  child: GameplayTopBar(
                    levelLabel: levelLabel,
                    starCount: starCount,
                    onBack: onBack,
                    onSettings: onPause,
                    settingsEnabled: pauseEnabled,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: theme.spacingZoneGap,
                      bottom: theme.spacingHudInset,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: maxBoardHeight,
                        ),
                        child: GameplayBoardContainer(
                          grid: grid,
                          visualPath: visualPath,
                          explorerPosition: explorerPosition,
                          selectedTile: selectedTile,
                          onTileInteraction: onTileInteraction,
                          invalidTarget: invalidTarget,
                          traversedPathPositions: traversedPathPositions,
                          isExecuting: isExecuting,
                          showDebugGrid: showDebugGrid,
                          inputEnabled: inputEnabled && !isInteractionLocked,
                          effectiveKeyIds: effectiveKeyIds,
                          floorLayoutSeed: floorLayoutSeed,
                        ),
                      ),
                    ),
                  ),
                ),
                GameplayControlBar(
                  primaryLabel: primaryLabel,
                  state: controlState,
                  statusCue: isExecuting ? null : statusCue?.message,
                  statusHudIconKind: isExecuting ? null : statusCue?.iconKind,
                  statusIconColor: statusCue?.iconColor,
                  onPrimaryPressed: primaryHandler,
                  onUndoPressed: onUndo,
                  onErasePressed: onErase,
                  onHintPressed: onHint,
                  movesValue: movesValue,
                  showGems: showGems,
                  gemsValue: gemsValue,
                  showKeys: showKeys,
                  keysValue: keysValue,
                  hintBadge: hintBadge,
                  actionsEnabled: !isInteractionLocked,
                ),
              ],
            ),
          ),
          if (isPausedOverlayVisible)
            ModalContainer(
              title: 'Paused',
              actions: LLButton(label: 'Resume', onPressed: onResume),
              child: const SizedBox.shrink(),
            ),
        ],
      ),
    );
  }
}

class _StatusCuePresentation {
  const _StatusCuePresentation({
    required this.message,
    this.iconKind,
    this.iconColor,
  });

  final String message;
  final GameplayHudIconKind? iconKind;
  final Color? iconColor;
}

_StatusCuePresentation? _resolveStatusCue({
  required LLThemeExtension theme,
  required bool isTerminalWon,
  required bool isTerminalLost,
  required bool isExecuting,
  required bool isEvaluating,
  required bool isTerminal,
  required bool canConfirmDraft,
  required bool visualPathEmpty,
  required String? completionStatusCue,
  required String? primaryStatusMessage,
  required String? feedbackMessage,
  required String? draftPathValidationMessage,
  required GameplayHudIconKind? draftPathValidationIcon,
}) {
  if (isExecuting) return null;

  if (isTerminalWon) {
    return _StatusCuePresentation(
      message: completionStatusCue ?? 'Chamber cleared',
      iconKind: GameplayHudIconKind.objectiveComplete,
      iconColor: theme.feedbackSuccess,
    );
  }

  if (isTerminalLost) {
    return _StatusCuePresentation(
      message: completionStatusCue ?? 'Adjust your route and try again',
      iconKind: GameplayHudIconKind.statusRefresh,
      iconColor: theme.feedbackDanger,
    );
  }

  final message = completionStatusCue ??
      primaryStatusMessage ??
      feedbackMessage ??
      draftPathValidationMessage ??
      (isEvaluating
          ? 'Execution complete — objectives evaluated'
          : canConfirmDraft
              ? 'Path is valid — tap GO to execute'
              : visualPathEmpty
                  ? 'Tap or drag from the explorer to plan your route'
                  : 'Continue drawing or backtrack to adjust');

  final iconKind = feedbackMessage != null
      ? GameplayHudIconKind.statusBlock
      : draftPathValidationMessage != null
          ? (draftPathValidationIcon ?? GameplayHudIconKind.statusBlock)
          : primaryStatusMessage != null &&
                  primaryStatusMessage.startsWith('Path cleared')
              ? GameplayHudIconKind.statusClear
              : canConfirmDraft
                  ? GameplayHudIconKind.statusCheck
                  : null;

  final iconColor = feedbackMessage != null
      ? theme.feedbackDanger
      : draftPathValidationMessage != null
          ? theme.feedbackDanger
          : canConfirmDraft
              ? theme.feedbackSuccess
              : theme.textSecondary;

  return _StatusCuePresentation(
    message: message,
    iconKind: iconKind,
    iconColor: iconColor,
  );
}

/// Formats a level id like `level_021` into mockup-style `LEVEL 21`.
String formatGameplayLevelLabel(String levelId) {
  final match = RegExp(r'(\d+)').firstMatch(levelId);
  if (match == null) {
    return levelId.toUpperCase();
  }
  return 'LEVEL ${int.parse(match.group(1)!)}';
}
