import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum LLButtonVariant { primary, secondary, ghost, danger }

/// Primary gold CTA — see docs/02_Design_System/Components.md
class LLButton extends StatelessWidget {
  const LLButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.variant = LLButtonVariant.primary,
    this.expanded = false,
    this.enabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final LLButtonVariant variant;
  final bool expanded;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onPressed != null;
    final style = _styleFor(variant);
    final foreground = style.foreground;

    return Semantics(
      button: true,
      enabled: isInteractive,
      label: label,
      excludeSemantics: true,
      child: Opacity(
        opacity: isInteractive ? 1 : 0.55,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isInteractive ? onPressed : null,
            borderRadius: LLRadius.buttonBorder,
            child: Ink(
              width: expanded ? double.infinity : null,
              decoration: BoxDecoration(
                borderRadius: LLRadius.buttonBorder,
                gradient: style.gradient,
                color: style.background,
                border: Border.all(color: style.border, width: 1.5),
                boxShadow: isInteractive ? style.shadows : null,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: LLSpacing.lg,
                vertical: LLSpacing.md - LLSpacing.xs,
              ),
              child: Row(
                mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: LLSpacing.md + LLSpacing.xs, color: foreground),
                    SizedBox(width: LLSpacing.sm),
                  ],
                  Text(
                    label,
                    style: LLTextStyle.button.copyWith(color: foreground),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _LLButtonStyle _styleFor(LLButtonVariant variant) {
    return switch (variant) {
      LLButtonVariant.primary => _LLButtonStyle(
          gradient: LLGradient.goldButton,
          border: LLColor.ancientGoldLight.withValues(alpha: 0.9),
          foreground: LLColor.templeBlack,
          shadows: LLShadow.goldGlow,
        ),
      LLButtonVariant.secondary => _LLButtonStyle(
          gradient: LLGradient.secondaryButton,
          border: LLColor.energyCyan.withValues(alpha: LLColor.borderCyanAlpha),
          foreground: LLColor.energyCyan,
          shadows: LLShadow.cyanGlow,
        ),
      LLButtonVariant.ghost => _LLButtonStyle(
          background: Colors.transparent,
          border: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          foreground: LLColor.textSecondary,
        ),
      LLButtonVariant.danger => _LLButtonStyle(
          background: LLColor.dangerEmber.withValues(alpha: 0.15),
          border: LLColor.dangerEmber,
          foreground: LLColor.dangerEmber,
          shadows: LLShadow.dangerGlow,
        ),
    };
  }
}

class _LLButtonStyle {
  const _LLButtonStyle({
    this.gradient,
    this.background,
    required this.border,
    required this.foreground,
    this.shadows,
  });

  final Gradient? gradient;
  final Color? background;
  final Color border;
  final Color foreground;
  final List<BoxShadow>? shadows;
}
