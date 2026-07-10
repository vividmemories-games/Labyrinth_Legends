import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Temple screen backdrop — see docs/02_Design_System/Components.md
class LLScreenBackground extends StatelessWidget {
  const LLScreenBackground({
    super.key,
    required this.child,
    this.heroImageAsset,
    this.heroAlignment = Alignment.topCenter,
    /// Scales the dark gradient veil (1.0 = default). Lower values reveal more hero art.
    this.veilStrength = 1.0,
    /// Values below 1.0 zoom the hero image out (show more of the plate).
    this.heroScale = 1.0,
  });

  final Widget child;
  final String? heroImageAsset;
  final Alignment heroAlignment;
  final double veilStrength;
  final double heroScale;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LLColor.templeBlack,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (heroImageAsset != null)
            Transform.scale(
              scale: heroScale,
              child: Image.asset(
                heroImageAsset!,
                fit: BoxFit.cover,
                alignment: heroAlignment,
              ),
            ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LLGradient.screenVeil(strength: veilStrength),
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
