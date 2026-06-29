import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Generic reward presentation card — no game logic.
class LLRewardCard extends StatelessWidget {
  const LLRewardCard({
    super.key,
    required this.title,
    this.subtitle,
    this.amount,
    this.icon = Icons.card_giftcard,
    this.accentColor,
  });

  final String title;
  final String? subtitle;
  final String? amount;
  final IconData icon;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final accent = accentColor ?? LLColor.ancientGold;

    return DecoratedBox(
      decoration: LLSurface.card(),
      child: Padding(
        padding: EdgeInsets.all(LLSpacing.md),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withValues(alpha: 0.15),
                border: Border.all(color: accent.withValues(alpha: 0.5)),
                boxShadow: LLShadow.goldGlow,
              ),
              child: Padding(
                padding: EdgeInsets.all(LLSpacing.sm),
                child: Icon(icon, color: accent, size: LLSize.iconLg),
              ),
            ),
            SizedBox(width: LLSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: LLTextStyle.bodyPrimary.copyWith(fontWeight: FontWeight.w600)),
                  if (subtitle != null) ...[
                    SizedBox(height: LLSpacing.xs),
                    Text(subtitle!, style: LLTextStyle.caption),
                  ],
                ],
              ),
            ),
            if (amount != null)
              Text(
                amount!,
                style: LLTextStyle.currencyValue.copyWith(color: accent),
              ),
          ],
        ),
      ),
    );
  }
}
