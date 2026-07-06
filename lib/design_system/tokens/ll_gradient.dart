import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/ll_color.dart';

/// Gradient tokens — see docs/02_Design_System/Design_Tokens.md
abstract final class LLGradient {
  static const LinearGradient goldButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      LLColor.ancientGoldDark,
      LLColor.bronzeRust,
      LLColor.oxidizedBronze,
    ],
  );

  static const LinearGradient secondaryButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      LLColor.stoneEdge,
      LLColor.weatheredStone,
      LLColor.tealShadow,
    ],
  );

  static const LinearGradient stonePanel = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [LLColor.stoneMid, LLColor.stoneDark],
  );

  static LinearGradient portalAura({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
  }) =>
      LinearGradient(
        begin: begin,
        end: end,
        colors: [
          LLColor.portalBlue.withValues(alpha: 0.35),
          LLColor.portalBlue.withValues(alpha: 0),
        ],
      );

  static LinearGradient screenVeil({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    double strength = 1.0,
  }) {
    final clamped = strength.clamp(0.0, 1.0);
    return LinearGradient(
      begin: begin,
      end: end,
      stops: const [0.0, 0.45, 1.0],
      colors: [
        LLColor.templeBlack.withValues(alpha: LLColor.veilTopAlpha * clamped),
        LLColor.templeBlack.withValues(alpha: LLColor.veilMidAlpha * clamped),
        LLColor.templeBlack.withValues(alpha: LLColor.veilBottomAlpha * clamped),
      ],
    );
  }
}
