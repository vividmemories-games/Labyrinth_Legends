import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Circular floating action button with gold portal styling.
class LLFloatingButton extends StatelessWidget {
  const LLFloatingButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.label,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Ink(
          width: LLSize.fab,
          height: LLSize.fab,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LLGradient.goldButton,
            border: Border.all(
              color: LLColor.ancientGoldLight.withValues(alpha: 0.9),
              width: LLSize.borderWidth,
            ),
            boxShadow: LLShadow.goldGlow,
          ),
          child: Icon(icon, color: LLColor.templeBlack, size: LLSize.iconLg),
        ),
      ),
    );
  }
}
