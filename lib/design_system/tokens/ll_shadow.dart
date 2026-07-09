import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/ll_color.dart';

/// Shadow tokens — see docs/02_Design_System/Design_Tokens.md
abstract final class LLShadow {
  static List<BoxShadow> get soft => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get panel => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get portalGlow => [
        BoxShadow(
          color: LLColor.portalBlue.withValues(alpha: 0.35),
          blurRadius: 16,
          spreadRadius: 2,
        ),
      ];

  static List<BoxShadow> get goldGlow => [
        BoxShadow(
          color: LLColor.ancientGold.withValues(alpha: 0.35),
          blurRadius: 14,
          offset: const Offset(0, 4),
        ),
      ];

  /// Weathered engraved plate — inset depth, minimal bloom.
  static List<BoxShadow> get weatheredPlate => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.55),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get weatheredPlateSecondary => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.5),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: LLColor.energyCyan.withValues(alpha: 0.06),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get cyanGlow => [
        BoxShadow(
          color: LLColor.energyCyan.withValues(alpha: 0.15),
          blurRadius: 14,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get dangerGlow => [
        BoxShadow(
          color: LLColor.emberRed.withValues(alpha: 0.3),
          blurRadius: 12,
        ),
      ];

  static List<Shadow> get titleGold => [
        Shadow(
          color: LLColor.ancientGold.withValues(alpha: 0.5),
          blurRadius: 16,
        ),
      ];

  /// Engraved plate label legibility on weathered textures.
  static List<Shadow> get buttonPlate => [
        Shadow(
          color: Colors.black.withValues(alpha: 0.65),
          offset: const Offset(0, 1),
          blurRadius: 2,
        ),
      ];
}
