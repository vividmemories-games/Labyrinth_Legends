import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum LLButtonVariant { primary, secondary, ghost, danger }

/// Weathered engraved plate CTA — see docs/02_Design_System/Components.md
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

  static const double _minHeight = 52;

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onPressed != null;
    final style = _styleFor(variant);
    final foreground = style.foreground;

    final plate = ClipRRect(
      borderRadius: LLRadius.buttonBorder,
      child: Stack(
        fit: expanded ? StackFit.passthrough : StackFit.loose,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: style.gradient,
                color: style.background,
              ),
            ),
          ),
          if (style.textureAsset != null)
            Positioned.fill(
              child: Transform.scale(
                scale: style.textureScale,
                child: Image.asset(
                  style.textureAsset!,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  color: isInteractive
                      ? null
                      : Colors.black.withValues(alpha: 0.35),
                  colorBlendMode: isInteractive ? null : BlendMode.darken,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: LLSpacing.lg,
              vertical: LLSpacing.md + LLSpacing.xs,
            ),
            child: Row(
              mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: LLSpacing.md + LLSpacing.xs, color: foreground),
                  SizedBox(width: LLSpacing.sm),
                ],
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: _labelStyleFor(variant, foreground),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isInteractive ? onPressed : null,
        borderRadius: LLRadius.buttonBorder,
        child: Ink(
          width: expanded ? double.infinity : null,
          decoration: BoxDecoration(
            borderRadius: LLRadius.buttonBorder,
            border: Border.all(color: style.border, width: LLSize.borderWidth),
            boxShadow: isInteractive ? style.shadows : null,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: _minHeight),
            child: plate,
          ),
        ),
      ),
    );

    return Semantics(
      button: true,
      enabled: isInteractive,
      label: label,
      excludeSemantics: true,
      child: Opacity(
        opacity: isInteractive ? 1 : 0.55,
        child: expanded
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: LLSpacing.buttonHorizontalInset,
                ),
                child: button,
              )
            : button,
      ),
    );
  }

  _LLButtonStyle _styleFor(LLButtonVariant variant) {
    return switch (variant) {
      LLButtonVariant.primary => _LLButtonStyle(
          gradient: LLGradient.goldButton,
          textureAsset: LLAssetPaths.buttonPrimaryWeathered,
          textureScale: 1.14,
          border: LLColor.ancientGold.withValues(
            alpha: LLColor.borderWeatheredGoldAlpha,
          ),
          foreground: LLColor.textPrimary,
          shadows: LLShadow.weatheredPlate,
        ),
      LLButtonVariant.secondary => _LLButtonStyle(
          gradient: LLGradient.secondaryButton,
          textureAsset: LLAssetPaths.buttonSecondaryWeathered,
          textureScale: 1.0,
          border: LLColor.energyCyan.withValues(
            alpha: LLColor.borderWeatheredCyanAlpha,
          ),
          foreground: LLColor.energyCyan,
          shadows: LLShadow.weatheredPlateSecondary,
        ),
      LLButtonVariant.ghost => _LLButtonStyle(
          background: LLColor.stoneDark.withValues(alpha: 0.35),
          border: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          foreground: LLColor.textSecondary,
          shadows: LLShadow.soft,
        ),
      LLButtonVariant.danger => _LLButtonStyle(
          background: LLColor.emberRed.withValues(alpha: 0.18),
          border: LLColor.emberRed.withValues(alpha: 0.75),
          foreground: LLColor.emberRed,
          shadows: LLShadow.dangerGlow,
        ),
    };
  }

  TextStyle _labelStyleFor(LLButtonVariant variant, Color foreground) {
    final base = switch (variant) {
      LLButtonVariant.primary => LLTextStyle.buttonPrimary,
      LLButtonVariant.secondary => LLTextStyle.buttonSecondary,
      LLButtonVariant.ghost || LLButtonVariant.danger => LLTextStyle.buttonSecondary,
    };

    return base.copyWith(
      color: foreground,
      shadows: variant == LLButtonVariant.ghost ? null : LLShadow.buttonPlate,
    );
  }
}

class _LLButtonStyle {
  const _LLButtonStyle({
    this.gradient,
    this.background,
    this.textureAsset,
    this.textureScale = 1.0,
    required this.border,
    required this.foreground,
    this.shadows,
  });

  final Gradient? gradient;
  final Color? background;
  final String? textureAsset;
  final double textureScale;
  final Color border;
  final Color foreground;
  final List<BoxShadow>? shadows;
}
