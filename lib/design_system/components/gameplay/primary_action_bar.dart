import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/ll_button.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum PrimaryActionBarState {
  idle,
  planning,
  confirmReady,
  disabled,
  executingHidden,
  resultReady,
}

/// Bottom primary action zone anchor — UI_05 Primary Action Bar.
class PrimaryActionBar extends StatelessWidget {
  const PrimaryActionBar({
    super.key,
    required this.primaryLabel,
    this.secondaryLabel,
    this.statusCue,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.state = PrimaryActionBarState.idle,
  });

  final String primaryLabel;
  final String? secondaryLabel;
  final String? statusCue;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final PrimaryActionBarState state;

  @override
  Widget build(BuildContext context) {
    if (state == PrimaryActionBarState.executingHidden) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;
    final primaryEnabled = state != PrimaryActionBarState.disabled &&
        onPrimaryPressed != null;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.surfaceBase.withValues(alpha: 0.96),
        border: Border(
          top: BorderSide(color: theme.borderSubtle, width: LLSize.borderWidth),
        ),
      ),
      child: SafeArea(
        top: false,
        minimum: EdgeInsets.fromLTRB(
          theme.spacingScreenPadding,
          theme.spacingZoneGap,
          theme.spacingScreenPadding,
          theme.spacingZoneGap,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (statusCue != null) ...[
              Text(
                statusCue!,
                textAlign: TextAlign.center,
                style: LLTextStyle.caption.copyWith(color: theme.textSecondary),
              ),
              SizedBox(height: theme.spacingHudInset),
            ],
            LLButton(
              label: primaryLabel,
              expanded: true,
              enabled: primaryEnabled,
              onPressed: primaryEnabled ? onPrimaryPressed : null,
            ),
            if (secondaryLabel != null) ...[
              SizedBox(height: theme.spacingHudInset),
              LLButton(
                label: secondaryLabel!,
                expanded: true,
                variant: LLButtonVariant.ghost,
                onPressed: onSecondaryPressed,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
