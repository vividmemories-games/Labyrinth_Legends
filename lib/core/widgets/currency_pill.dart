import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/ll_currency_chip.dart';

/// Deprecated prototype currency chip — use [LLCurrencyChip] from `design_system`.
@Deprecated(
  'Prototype widget. Use LLCurrencyChip from package:labyrinth_legends/design_system/design_system.dart',
)
class CurrencyPill extends StatelessWidget {
  const CurrencyPill({
    super.key,
    required this.icon,
    required this.amount,
    this.onTap,
    this.compact = false,
  });

  final IconData icon;
  final int amount;
  final VoidCallback? onTap;
  final bool compact;

  LLCurrencyType get _type => switch (icon) {
        Icons.diamond_outlined => LLCurrencyType.gems,
        Icons.star => LLCurrencyType.stars,
        _ => LLCurrencyType.coins,
      };

  @override
  Widget build(BuildContext context) {
    return LLCurrencyChip(
      type: _type,
      amount: amount,
      onTap: onTap,
      compact: compact,
    );
  }
}
