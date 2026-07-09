import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_hud_icon.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Vertical stat readout — MOVES / GEMS / KEYS per MVP gameplay mockup.
class GameplayStatColumn extends StatelessWidget {
  const GameplayStatColumn({
    super.key,
    required this.label,
    required this.value,
    this.iconKind,
    this.semanticsLabel,
  });

  final String label;
  final String value;
  final GameplayHudIconKind? iconKind;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel ?? '$value $label',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: LLTextStyle.caption.copyWith(
              color: LLColor.textSecondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: LLSpacing.xs),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconKind != null) ...[
                LLHudIcon(
                  kind: iconKind!,
                  size: 28,
                  fit: BoxFit.cover,
                  visualScale: 1.15,
                ),
                const SizedBox(width: LLSpacing.xs),
              ],
              Text(
                value,
                style: LLTextStyle.h2.copyWith(
                  color: LLColor.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
