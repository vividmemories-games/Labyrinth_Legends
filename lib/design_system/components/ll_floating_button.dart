import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Circular floating action button with weathered gold plate styling.
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
            image: DecorationImage(
              image: AssetImage(LLAssetPaths.buttonPrimaryWeathered),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: LLColor.ancientGold.withValues(
                alpha: LLColor.borderWeatheredGoldAlpha,
              ),
              width: LLSize.borderWidth,
            ),
            boxShadow: LLShadow.weatheredPlate,
          ),
          child: Icon(icon, color: LLColor.textPrimary, size: LLSize.iconLg),
        ),
      ),
    );
  }
}
