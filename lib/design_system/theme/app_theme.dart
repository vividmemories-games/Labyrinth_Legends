import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Material theme built exclusively from LLDL tokens.
ThemeData buildLLAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: LLColor.templeBlack,
    colorScheme: const ColorScheme.dark(
      primary: LLColor.ancientGold,
      secondary: LLColor.energyCyan,
      tertiary: LLColor.crystalPurple,
      surface: LLColor.stoneDark,
      onPrimary: LLColor.templeBlack,
      onSecondary: LLColor.templeBlack,
      onSurface: LLColor.textPrimary,
      error: LLColor.dangerEmber,
    ),
  );

  return base.copyWith(
    textTheme: base.textTheme.copyWith(
      displayLarge: LLTextStyle.display,
      displayMedium: LLTextStyle.h1,
      headlineMedium: LLTextStyle.h2,
      titleLarge: LLTextStyle.h2,
      bodyMedium: LLTextStyle.body,
      labelLarge: LLTextStyle.button.copyWith(color: LLColor.ancientGold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: LLColor.templeBlack.withValues(alpha: 0.92),
      foregroundColor: LLColor.ancientGold,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: LLTextStyle.subtitle,
    ),
    cardTheme: CardThemeData(
      color: LLColor.stoneDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: LLRadius.panelBorder,
        side: BorderSide(
          color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: LLColor.stoneEdge.withValues(alpha: 0.6),
      thickness: 1,
    ),
    iconTheme: const IconThemeData(color: LLColor.ancientGold),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: LLColor.stoneMid,
      contentTextStyle: LLTextStyle.body.copyWith(color: LLColor.textPrimary),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: LLRadius.mdBorder),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: LLColor.stoneDark,
      modalBackgroundColor: LLColor.stoneDark,
      shape: RoundedRectangleBorder(borderRadius: LLRadius.dialogBorder),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: LLColor.ancientGold,
      unselectedLabelColor: LLColor.textSecondary,
      indicatorColor: LLColor.ancientGold,
    ),
  );
}
