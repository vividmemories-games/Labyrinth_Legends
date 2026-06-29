import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Shared surface decorations for panels, cards, and chips.
abstract final class LLSurface {
  static BoxDecoration panel({BorderRadius? radius}) => BoxDecoration(
        borderRadius: radius ?? LLRadius.panelBorder,
        gradient: LLGradient.stonePanel,
        border: Border.all(
          color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          width: LLSize.borderWidth,
        ),
        boxShadow: LLShadow.panel,
      );

  static BoxDecoration card({BorderRadius? radius}) => BoxDecoration(
        borderRadius: radius ?? LLRadius.cardBorder,
        gradient: LLGradient.stonePanel,
        border: Border.all(
          color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          width: LLSize.borderWidth,
        ),
        boxShadow: LLShadow.soft,
      );

  static BoxDecoration pill({Color? borderColor}) => BoxDecoration(
        borderRadius: LLRadius.pillBorder,
        color: LLColor.stoneMid,
        border: Border.all(
          color: borderColor ??
              LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          width: LLSize.borderWidth,
        ),
        boxShadow: LLShadow.soft,
      );
}
