import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_hud_icon.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum PauseButtonState { idle, focused, disabled, hidden }

/// Stable pause affordance for the gameplay HUD — UI_05 Pause Button.
class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
    this.onPressed,
    this.state = PauseButtonState.idle,
    this.tooltip = 'Pause',
  });

  final VoidCallback? onPressed;
  final PauseButtonState state;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    if (state == PauseButtonState.hidden) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;
    final enabled = state != PauseButtonState.disabled && onPressed != null;

    return Semantics(
      button: true,
      enabled: enabled,
      label: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: theme.radiusButton,
          child: Ink(
            width: LLSize.touchTarget,
            height: LLSize.touchTarget,
            decoration: BoxDecoration(
              borderRadius: theme.radiusButton,
              color: theme.surfaceElevated.withValues(alpha: 0.88),
              border: Border.all(
                  color: theme.borderSubtle, width: LLSize.borderWidth),
            ),
            child: Center(
              child: LLHudIcon(
                kind: GameplayHudIconKind.pause,
                size: LLSize.iconMd,
                color: enabled ? theme.actionPrimary : theme.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
