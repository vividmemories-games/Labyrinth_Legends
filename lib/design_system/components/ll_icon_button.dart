import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum LLIconButtonVariant { gold, ghost, danger }

/// Square icon control for toolbars and app bars.
class LLIconButton extends StatelessWidget {
  const LLIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = LLIconButtonVariant.gold,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final LLIconButtonVariant variant;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final colors = _colorsFor(variant);

    final button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: LLRadius.mdBorder,
        child: Ink(
          width: LLSize.touchTarget,
          height: LLSize.touchTarget,
          decoration: BoxDecoration(
            borderRadius: LLRadius.mdBorder,
            color: colors.background,
            border: Border.all(color: colors.border, width: LLSize.borderWidth),
          ),
          child: Icon(icon, color: colors.foreground, size: LLSize.iconMd),
        ),
      ),
    );

    if (tooltip == null) return button;
    return Tooltip(message: tooltip!, child: button);
  }

  _IconButtonColors _colorsFor(LLIconButtonVariant variant) {
    return switch (variant) {
      LLIconButtonVariant.gold => _IconButtonColors(
          background: LLColor.stoneMid,
          border: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          foreground: LLColor.ancientGold,
        ),
      LLIconButtonVariant.ghost => _IconButtonColors(
          background: Colors.transparent,
          border: LLColor.stoneEdge,
          foreground: LLColor.textSecondary,
        ),
      LLIconButtonVariant.danger => _IconButtonColors(
          background: LLColor.emberRed.withValues(alpha: 0.12),
          border: LLColor.emberRed,
          foreground: LLColor.emberRed,
        ),
    };
  }
}

class _IconButtonColors {
  const _IconButtonColors({
    required this.background,
    required this.border,
    required this.foreground,
  });

  final Color background;
  final Color border;
  final Color foreground;
}
