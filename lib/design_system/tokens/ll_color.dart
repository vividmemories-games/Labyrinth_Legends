import 'package:flutter/material.dart';

/// Canonical color tokens — see docs/02_Design_System/Design_Tokens.md
/// Authority: WS10 tier model — foundational primitives + semantic roles (WS2).
abstract final class LLColor {
  // --- Foundational: surface ramp (internal composition; prefer semantic roles) ---
  static const Color templeBlack = Color(0xFF080B12);
  static const Color stoneDark = Color(0xFF12161F);
  static const Color stoneMid = Color(0xFF1A1F2B);
  static const Color stoneEdge = Color(0xFF2B313C);
  static const Color tealDeep = Color(0xFF1E3A44);
  static const Color tealShadow = Color(0xFF122830);

  // --- Semantic: WS2 color roles (default consumption layer) ---
  static const Color ancientGold = Color(0xFFD4A63A);
  static const Color ancientGoldLight = Color(0xFFE8C56A);
  static const Color ancientGoldDark = Color(0xFF9A7424);
  static const Color portalBlue = Color(0xFF00AEEF);
  static const Color energyCyan = Color(0xFF00D9FF);
  static const Color crystalPurple = Color(0xFF8A5CFF);
  static const Color textPrimary = Color(0xFFE8ECF4);
  static const Color textSecondary = Color(0xFF9AA3B2);
  static const Color emberRed = Color(0xFFE85D5D);
  static const Color successGreen = Color(0xFF4CD964);
  static const Color fogVeil = Color(0xCC080B12);

  // Aliases (backward compatible)
  static const Color dangerEmber = emberRed;
  static const Color successJade = successGreen;

  // Opacity helpers (component-token composition)
  static const double borderGoldAlpha = 0.25;
  static const double borderCyanAlpha = 0.55;
  static const double veilTopAlpha = 0.55;
  static const double veilMidAlpha = 0.88;
  static const double veilBottomAlpha = 0.96;
  static const double overlayVeilAlpha = 0.85;

  /// All swatches for showcase palette section.
  static const List<(String label, Color color)> palette = [
    ('Ancient Gold', ancientGold),
    ('Portal Blue', portalBlue),
    ('Energy Cyan', energyCyan),
    ('Crystal Purple', crystalPurple),
    ('Temple Black', templeBlack),
    ('Stone Dark', stoneDark),
    ('Stone Mid', stoneMid),
    ('Ember Red', emberRed),
    ('Success Green', successGreen),
  ];
}
