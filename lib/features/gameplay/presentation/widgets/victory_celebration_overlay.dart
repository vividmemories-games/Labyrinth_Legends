import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Foreground celebration while completion sync runs in the background.
class VictoryCelebrationOverlay extends StatelessWidget {
  const VictoryCelebrationOverlay({
    super.key,
    required this.stars,
    this.message = 'Chamber cleared',
  });

  final int stars;
  final String message;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ColoredBox(
        color: LLColor.templeBlack.withValues(alpha: 0.42),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: LLTextStyle.h2.copyWith(color: LLColor.ancientGold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: LLSpacing.md),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  final filled = index < stars;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: LLSpacing.xs),
                    child: Icon(
                      filled ? Icons.star : Icons.star_border,
                      color: LLColor.ancientGold,
                      size: LLSize.iconLg,
                    ),
                  );
                }),
              ),
              SizedBox(height: LLSpacing.lg),
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: LLColor.energyCyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
