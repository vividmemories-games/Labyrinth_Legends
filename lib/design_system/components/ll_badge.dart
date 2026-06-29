import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum LLBadgeVariant { locked, completed, newItem, perfect }

/// Small status badge for level nodes and shop items.
class LLBadge extends StatelessWidget {
  const LLBadge({
    super.key,
    required this.label,
    this.variant = LLBadgeVariant.newItem,
    this.icon,
  });

  final String label;
  final LLBadgeVariant variant;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(variant);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: style.background,
        borderRadius: LLRadius.pillBorder,
        border: Border.all(color: style.border, width: LLSize.borderWidth),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LLSpacing.sm,
          vertical: LLSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: LLSize.iconSm, color: style.foreground),
              SizedBox(width: LLSpacing.xs),
            ],
            Text(
              label,
              style: LLTextStyle.caption.copyWith(
                color: style.foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _BadgeStyle _styleFor(LLBadgeVariant variant) {
    return switch (variant) {
      LLBadgeVariant.locked => _BadgeStyle(
          background: LLColor.stoneDark,
          border: LLColor.stoneEdge,
          foreground: LLColor.textSecondary,
        ),
      LLBadgeVariant.completed => _BadgeStyle(
          background: LLColor.successGreen.withValues(alpha: 0.15),
          border: LLColor.successGreen,
          foreground: LLColor.successGreen,
        ),
      LLBadgeVariant.newItem => _BadgeStyle(
          background: LLColor.energyCyan.withValues(alpha: 0.12),
          border: LLColor.energyCyan,
          foreground: LLColor.energyCyan,
        ),
      LLBadgeVariant.perfect => _BadgeStyle(
          background: LLColor.ancientGold.withValues(alpha: 0.15),
          border: LLColor.ancientGold,
          foreground: LLColor.ancientGoldLight,
        ),
    };
  }
}

class _BadgeStyle {
  const _BadgeStyle({
    required this.background,
    required this.border,
    required this.foreground,
  });

  final Color background;
  final Color border;
  final Color foreground;
}
