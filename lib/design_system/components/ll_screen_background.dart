import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Temple screen backdrop — see docs/02_Design_System/Components.md
class LLScreenBackground extends StatelessWidget {
  const LLScreenBackground({
    super.key,
    required this.child,
    this.heroImageAsset,
    this.heroAlignment = Alignment.topCenter,
  });

  final Widget child;
  final String? heroImageAsset;
  final Alignment heroAlignment;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LLColor.templeBlack,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (heroImageAsset != null)
            Image.asset(
              heroImageAsset!,
              fit: BoxFit.cover,
              alignment: heroAlignment,
            ),
          DecoratedBox(
            decoration: BoxDecoration(gradient: LLGradient.screenVeil()),
          ),
          child,
        ],
      ),
    );
  }
}
