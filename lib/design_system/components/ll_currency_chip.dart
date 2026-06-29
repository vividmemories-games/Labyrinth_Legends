import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum LLCurrencyType { coins, gems, stars }

/// Currency display chip — coins, gems, or stars.
class LLCurrencyChip extends StatelessWidget {
  const LLCurrencyChip({
    super.key,
    required this.type,
    required this.amount,
    this.onTap,
    this.compact = false,
  });

  final LLCurrencyType type;
  final int amount;
  final VoidCallback? onTap;
  final bool compact;

  IconData get _icon => switch (type) {
        LLCurrencyType.coins => Icons.monetization_on_outlined,
        LLCurrencyType.gems => Icons.diamond_outlined,
        LLCurrencyType.stars => Icons.star,
      };

  Color get _accent => switch (type) {
        LLCurrencyType.coins => LLColor.ancientGold,
        LLCurrencyType.gems => LLColor.crystalPurple,
        LLCurrencyType.stars => LLColor.ancientGold,
      };

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: compact ? LLSpacing.sm + LLSpacing.xs : LLSpacing.md,
      vertical: compact ? LLSpacing.xs + LLSpacing.xs : LLSpacing.sm,
    );

    final content = DecoratedBox(
      decoration: LLSurface.pill(borderColor: _accent.withValues(alpha: 0.35)),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _icon,
              size: compact ? LLSize.iconSm : LLSize.iconMd,
              color: _accent,
            ),
            SizedBox(width: LLSpacing.xs + LLSpacing.xs),
            Text('$amount', style: LLTextStyle.currencyValue),
          ],
        ),
      ),
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: LLRadius.pillBorder,
        child: content,
      ),
    );
  }
}
