import 'package:flutter/material.dart';

/// Deprecated prototype palette — use [LLColor] from `design_system`.
@Deprecated(
  'Prototype palette. Use LLColor from package:labyrinth_legends/design_system/tokens/tokens.dart',
)
abstract final class AppColors {
  static const Color cyanGlow = Color(0xFF00D9FF);
  static const Color cyanDeep = Color(0xFF00AEEF);
  static const Color gold = Color(0xFFD4A63A);
  static const Color goldLight = Color(0xFFE8C56A);
  static const Color goldDark = Color(0xFF9A7424);
  static const Color goldDeep = Color(0xFF6B4E14);
  static const Color mysticPurple = Color(0xFF8A5CFF);
  static const Color voidBlack = Color(0xFF080B12);
  static const Color slate = Color(0xFF2B313C);
  static const Color tealPanel = Color(0xFF1A3A42);

  static const Color surface = Color(0xFF12161F);
  static const Color surfaceElevated = Color(0xFF1A1F2B);
  static const Color textPrimary = Color(0xFFE8ECF4);
  static const Color textSecondary = Color(0xFF9AA3B2);
  static const Color danger = Color(0xFFE85D5D);
  static const Color success = Color(0xFF4CD964);
  static const Color fog = Color(0xCC080B12);
  static const Color pathGlow = cyanGlow;
  static const Color wall = Color(0xFF3D4554);
  static const Color floor = Color(0xFF1E2430);

  static const List<Color> goldButtonGradient = [
    goldLight,
    gold,
    goldDark,
  ];

  static const List<Color> secondaryButtonGradient = [
    Color(0xFF1E3A44),
    tealPanel,
    Color(0xFF122830),
  ];
}
