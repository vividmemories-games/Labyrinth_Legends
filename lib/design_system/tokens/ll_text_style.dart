import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labyrinth_legends/design_system/tokens/ll_color.dart';
import 'package:labyrinth_legends/design_system/tokens/ll_shadow.dart';

/// Typography tokens — see docs/02_Design_System/Design_Tokens.md
abstract final class LLTextStyle {
  static TextStyle get display => GoogleFonts.cinzel(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: LLColor.ancientGoldLight,
        height: 1.05,
        shadows: LLShadow.titleGold,
      );

  static TextStyle get h1 => GoogleFonts.cinzel(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: LLColor.ancientGoldLight,
        height: 1.05,
        shadows: LLShadow.titleGold,
      );

  static TextStyle get h2 => GoogleFonts.cinzel(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: LLColor.ancientGold,
      );

  static TextStyle get body => GoogleFonts.exo2(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: LLColor.textSecondary,
      );

  static TextStyle get bodyPrimary => body.copyWith(color: LLColor.textPrimary);

  static TextStyle get caption => GoogleFonts.exo2(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: LLColor.textSecondary,
      );

  static TextStyle get button => GoogleFonts.exo2(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      );

  static TextStyle get currencyValue => GoogleFonts.exo2(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: LLColor.textPrimary,
      );

  // Backward-compatible aliases
  static TextStyle get title => h1;
  static TextStyle get subtitle => h2;
}
