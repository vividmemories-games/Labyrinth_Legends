import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/objective_card.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/pause_button.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/primary_action_bar.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/resource_display.dart';
import 'package:labyrinth_legends/design_system/components/ll_button.dart';
import 'package:labyrinth_legends/design_system/components/overlays/modal_container.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_board_container.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Gameplay screen spatial scaffold — MVP master mockup layout.
class GameplayLayout extends StatelessWidget {
  const GameplayLayout({
    super.key,
    required this.levelName,
    required this.objectiveTitle,
    required this.objectiveProgress,
    required this.showResourceDisplay,
    required this.resourceValue,
    required this.grid,
    required this.visualPath,
    required this.shellPhase,
    required this.canConfirmDraft,
    required this.onTileInteraction,
    required this.onClearDraft,
    required this.onPrimaryAction,
    required this.onPause,
    required this.onResume,
    required this.isPausedOverlayVisible,
    required this.showDebugGrid,
    this.hasNextLevel = false,
    this.onTryAgain,
    this.onNextLevel,
    this.explorerPosition,
    this.selectedTile,
    this.planningExtensionHints = const {},
    this.traversedPathPositions = const {},
    this.isExecuting = false,
    this.objectiveCardState = ObjectiveCardState.idle,
    this.resourceDisplayState = ResourceDisplayState.idle,
    this.completionStatusCue,
    this.invalidTarget,
    this.feedbackMessage,
    this.primaryStatusMessage,
    this.inputEnabled = true,
    this.isInteractionLocked = false,
    this.effectiveKeyIds = const {},
    this.draftPathValidationMessage,
    this.draftPathValidationIcon,
    this.showKeyDisplay = false,
    this.keyResourceValue,
  });

  final String levelName;
  final String objectiveTitle;
  final String? objectiveProgress;
  final bool showResourceDisplay;
  final String resourceValue;
  final MazeGrid grid;
  final List<GridPosition> visualPath;
  final GameplayShellPhase shellPhase;
  final bool canConfirmDraft;
  final ValueChanged<GridPosition> onTileInteraction;
  final VoidCallback onClearDraft;
  final VoidCallback onPrimaryAction;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final bool isPausedOverlayVisible;
  final bool showDebugGrid;
  final bool hasNextLevel;
  final VoidCallback? onTryAgain;
  final VoidCallback? onNextLevel;
  final GridPosition? explorerPosition;
  final GridPosition? selectedTile;
  final Set<GridPosition> planningExtensionHints;
  final Set<GridPosition> traversedPathPositions;
  final bool isExecuting;
  final ObjectiveCardState objectiveCardState;
  final ResourceDisplayState resourceDisplayState;
  final String? completionStatusCue;
  final GridPosition? invalidTarget;
  final String? feedbackMessage;
  final String? primaryStatusMessage;
  final bool inputEnabled;
  final bool isInteractionLocked;
  final Set<String> effectiveKeyIds;
  final String? draftPathValidationMessage;
  final GameplayHudIconKind? draftPathValidationIcon;
  final bool showKeyDisplay;
  final String? keyResourceValue;

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
        : isTerminalWon
            ? (hasNextLevel ? 'Next Level' : 'Complete')
            : canConfirmDraft
                ? 'Confirm'
                : 'Draw Path';
    final primaryState = isExecuting
        ? PrimaryActionBarState.executingHidden
        : isTerminal
            ? PrimaryActionBarState.resultReady
            : isEvaluating
                ? PrimaryActionBarState.disabled
                : canConfirmDraft
                    ? PrimaryActionBarState.confirmReady
                    : visualPath.isEmpty
                        ? PrimaryActionBarState.idle
                        : PrimaryActionBarState.planning;

    final VoidCallback? primaryHandler = isTerminalLost
        ? onTryAgain
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

    return ColoredBox(
      color: theme.surfaceBase,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TopContextZone(
                  levelName: levelName,
                  objectiveTitle: objectiveTitle,
                  objectiveProgress: objectiveProgress,
                  objectiveCardState: objectiveCardState,
                  showResourceDisplay: showResourceDisplay,
                  resourceValue: resourceValue,
                  resourceDisplayState: resourceDisplayState,
                  showKeyDisplay: showKeyDisplay,
                  keyResourceValue: keyResourceValue,
                  onPause: onPause,
                  shellPhase: shellPhase,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: theme.spacingZoneGap,
                      bottom: theme.spacingZoneGap,
                    ),
                    child: GameplayBoardContainer(
                      grid: grid,
                      visualPath: visualPath,
                      explorerPosition: explorerPosition,
                      selectedTile: selectedTile,
                      onTileInteraction: onTileInteraction,
                      invalidTarget: invalidTarget,
                      planningExtensionHints: planningExtensionHints,
                      traversedPathPositions: traversedPathPositions,
                      isExecuting: isExecuting,
                      showDebugGrid: showDebugGrid,
                      inputEnabled: inputEnabled && !isInteractionLocked,
                      effectiveKeyIds: effectiveKeyIds,
                    ),
                  ),
                ),
                PrimaryActionBar(
                  primaryLabel: primaryLabel,
                  secondaryLabel: isInteractionLocked || visualPath.isEmpty
                      ? null
                      : 'Clear',
                  state: primaryState,
                  statusCue: isExecuting ? null : statusCue?.message,
                  statusHudIconKind: isExecuting ? null : statusCue?.iconKind,
                  statusIconColor: statusCue?.iconColor,
                  onPrimaryPressed: primaryHandler,
                  onSecondaryPressed: isInteractionLocked || visualPath.isEmpty
                      ? null
                      : onClearDraft,
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

class _TopContextZone extends StatelessWidget {
  const _TopContextZone({
    required this.levelName,
    required this.objectiveTitle,
    required this.objectiveProgress,
    required this.objectiveCardState,
    required this.showResourceDisplay,
    required this.resourceValue,
    required this.resourceDisplayState,
    required this.showKeyDisplay,
    this.keyResourceValue,
    required this.onPause,
    required this.shellPhase,
  });

  final String levelName;
  final String objectiveTitle;
  final String? objectiveProgress;
  final ObjectiveCardState objectiveCardState;
  final bool showResourceDisplay;
  final String resourceValue;
  final ResourceDisplayState resourceDisplayState;
  final bool showKeyDisplay;
  final String? keyResourceValue;
  final VoidCallback onPause;
  final GameplayShellPhase shellPhase;

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        theme.spacingScreenPadding,
        theme.spacingHudInset,
        theme.spacingHudInset,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  levelName,
                  style: LLTextStyle.h2.copyWith(color: theme.actionPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              PauseButton(
                onPressed: shellPhase == GameplayShellPhase.paused ||
                        shellPhase == GameplayShellPhase.executing ||
                        shellPhase == GameplayShellPhase.executionComplete ||
                        shellPhase == GameplayShellPhase.terminalWon ||
                        shellPhase == GameplayShellPhase.terminalLost
                    ? null
                    : onPause,
                state: shellPhase == GameplayShellPhase.paused
                    ? PauseButtonState.disabled
                    : PauseButtonState.idle,
              ),
            ],
          ),
          SizedBox(height: theme.spacingHudInset),
          ObjectiveCard(
            title: objectiveTitle,
            progressLabel: objectiveProgress,
            state: objectiveCardState,
          ),
          if (showResourceDisplay || showKeyDisplay) ...[
            SizedBox(height: theme.spacingHudInset),
            Wrap(
              spacing: theme.spacingHudInset,
              runSpacing: theme.spacingHudInset,
              children: [
                if (showResourceDisplay)
                  ResourceDisplay(
                    iconKind: GameplayHudIconKind.gem,
                    value: resourceValue,
                    label: 'gems',
                    state: resourceDisplayState,
                  ),
                if (showKeyDisplay && keyResourceValue != null)
                  ResourceDisplay(
                    iconKind: GameplayHudIconKind.key,
                    value: keyResourceValue!,
                    label: 'keys',
                    state: resourceDisplayState,
                  ),
              ],
            ),
          ],
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
              ? 'Path is valid — confirm to execute'
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
