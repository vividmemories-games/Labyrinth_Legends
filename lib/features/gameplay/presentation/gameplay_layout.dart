import 'package:flutter/material.dart';
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

/// Gameplay screen spatial scaffold — UI_02 zone model applied to UI_03.
class GameplayLayout extends StatelessWidget {
  const GameplayLayout({
    super.key,
    required this.levelName,
    required this.objectiveTitle,
    required this.objectiveProgress,
    required this.showResourceDisplay,
    required this.resourceValue,
    required this.primaryActionLabel,
    required this.shellPhase,
    required this.onPause,
    required this.onResume,
    required this.isPausedOverlayVisible,
    required this.showDebugGrid,
  });

  final String levelName;
  final String objectiveTitle;
  final String? objectiveProgress;
  final bool showResourceDisplay;
  final String resourceValue;
  final String primaryActionLabel;
  final GameplayShellPhase shellPhase;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final bool isPausedOverlayVisible;
  final bool showDebugGrid;

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;

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
                  showResourceDisplay: showResourceDisplay,
                  resourceValue: resourceValue,
                  onPause: onPause,
                  shellPhase: shellPhase,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: theme.spacingZoneGap,
                      bottom: theme.spacingZoneGap,
                    ),
                    child: GameplayBoardContainer(showDebugGrid: showDebugGrid),
                  ),
                ),
                PrimaryActionBar(
                  primaryLabel: primaryActionLabel,
                  state: PrimaryActionBarState.disabled,
                  statusCue: 'Path drawing arrives in M2.2',
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
    required this.showResourceDisplay,
    required this.resourceValue,
    required this.onPause,
    required this.shellPhase,
  });

  final String levelName;
  final String objectiveTitle;
  final String? objectiveProgress;
  final bool showResourceDisplay;
  final String resourceValue;
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
                onPressed:
                    shellPhase == GameplayShellPhase.paused ? null : onPause,
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
          ),
          if (showResourceDisplay) ...[
            SizedBox(height: theme.spacingHudInset),
            Align(
              alignment: Alignment.centerLeft,
              child: ResourceDisplay(
                icon: Icons.diamond_outlined,
                value: resourceValue,
                label: 'gems',
              ),
            ),
          ],
        ],
      ),
    );
  }
}
