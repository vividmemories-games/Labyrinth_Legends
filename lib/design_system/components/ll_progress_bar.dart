import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Gold-fill progress track on stone background.
class LLProgressBar extends StatelessWidget {
  const LLProgressBar({
    super.key,
    required this.value,
    this.label,
    this.showPercent = false,
  });

  /// 0.0 – 1.0
  final double value;
  final String? label;
  final bool showPercent;

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null || showPercent)
          Padding(
            padding: EdgeInsets.only(bottom: LLSpacing.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (label != null)
                  Text(label!, style: LLTextStyle.caption),
                if (showPercent)
                  Text(
                    '${(clamped * 100).round()}%',
                    style: LLTextStyle.caption.copyWith(
                      color: LLColor.ancientGold,
                    ),
                  ),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: LLRadius.pillBorder,
          child: SizedBox(
            height: LLSize.progressHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ColoredBox(color: LLColor.stoneEdge),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: clamped,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LLGradient.goldButton,
                      boxShadow: LLShadow.goldGlow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
