import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/gameplay_round_action_button.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/gameplay_stat_column.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_hud_icon.dart';
import 'package:labyrinth_legends/design_system/components/ll_button.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum GameplayControlBarState {
  idle,
  planning,
  confirmReady,
  disabled,
  executingHidden,
  resultReady,
}

/// Bottom gameplay zone — mockup action row, stats, and primary GO CTA.
class GameplayControlBar extends StatelessWidget {
  const GameplayControlBar({
    super.key,
    required this.primaryLabel,
    this.statusCue,
    this.statusHudIconKind,
    this.statusIconColor,
    this.onPrimaryPressed,
    this.onUndoPressed,
    this.onErasePressed,
    this.onHintPressed,
    this.movesValue = '0',
    this.gemsValue,
    this.keysValue,
    this.showGems = false,
    this.showKeys = false,
    this.hintBadge,
    this.state = GameplayControlBarState.idle,
    this.actionsEnabled = true,
  });

  final String primaryLabel;
  final String? statusCue;
  final GameplayHudIconKind? statusHudIconKind;
  final Color? statusIconColor;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onUndoPressed;
  final VoidCallback? onErasePressed;
  final VoidCallback? onHintPressed;
  final String movesValue;
  final String? gemsValue;
  final String? keysValue;
  final bool showGems;
  final bool showKeys;
  final String? hintBadge;
  final GameplayControlBarState state;
  final bool actionsEnabled;

  @override
  Widget build(BuildContext context) {
    if (state == GameplayControlBarState.executingHidden) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;
    final primaryEnabled =
        state != GameplayControlBarState.disabled && onPrimaryPressed != null;
    final showPlanningControls = state != GameplayControlBarState.resultReady;
    final roundActionsEnabled = actionsEnabled &&
        state != GameplayControlBarState.disabled &&
        state != GameplayControlBarState.resultReady;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.surfaceBase.withValues(alpha: 0),
            theme.surfaceBase.withValues(alpha: 0.94),
            theme.surfaceBase,
          ],
        ),
        border: Border(
          top: BorderSide(
            color: theme.actionPrimary.withValues(alpha: 0.18),
            width: LLSize.borderWidth,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(
          LLSpacing.screenPadding,
          LLSpacing.md,
          LLSpacing.screenPadding,
          LLSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showPlanningControls) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GameplayRoundActionButton(
                    label: 'UNDO',
                    iconKind: GameplayHudIconKind.undo,
                    tooltip: 'Undo last step',
                    enabled: roundActionsEnabled,
                    onPressed: roundActionsEnabled ? onUndoPressed : null,
                  ),
                  GameplayRoundActionButton(
                    label: 'ERASE',
                    iconKind: GameplayHudIconKind.erase,
                    tooltip: 'Erase path',
                    enabled: roundActionsEnabled,
                    onPressed: roundActionsEnabled ? onErasePressed : null,
                  ),
                  GameplayRoundActionButton(
                    label: 'HINT',
                    iconKind: GameplayHudIconKind.hint,
                    tooltip: 'Hint',
                    badge: hintBadge,
                    enabled: roundActionsEnabled,
                    onPressed: roundActionsEnabled ? onHintPressed : null,
                  ),
                ],
              ),
              const SizedBox(height: LLSpacing.lg),
              Row(
                children: [
                  Expanded(
                    child: GameplayStatColumn(
                      label: 'MOVES',
                      value: movesValue,
                    ),
                  ),
                  if (showGems && gemsValue != null)
                    Expanded(
                      child: GameplayStatColumn(
                        label: 'GEMS',
                        value: gemsValue!,
                        iconKind: GameplayHudIconKind.gem,
                      ),
                    ),
                  if (showKeys && keysValue != null)
                    Expanded(
                      child: GameplayStatColumn(
                        label: 'KEYS',
                        value: keysValue!,
                        iconKind: GameplayHudIconKind.key,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: LLSpacing.md),
            ],
            if (statusCue != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (statusHudIconKind != null) ...[
                    LLHudIcon(
                      kind: statusHudIconKind!,
                      size: 22,
                      fit: BoxFit.cover,
                      visualScale: 1.12,
                    ),
                    const SizedBox(width: LLSpacing.sm),
                  ],
                  Flexible(
                    child: Text(
                      statusCue!,
                      textAlign: TextAlign.center,
                      style: LLTextStyle.caption.copyWith(
                        color: theme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: LLSpacing.sm),
            ],
            LLButton(
              label: primaryLabel,
              expanded: true,
              enabled: primaryEnabled,
              onPressed: primaryEnabled ? onPrimaryPressed : null,
            ),
          ],
        ),
      ),
    );
  }
}
