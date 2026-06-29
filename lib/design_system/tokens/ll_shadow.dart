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
}
