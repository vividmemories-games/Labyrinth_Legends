import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Production Material theme built exclusively from LLDL semantic tokens.
ThemeData buildLLAppTheme() {
  final llTheme = LLThemeExtension.dark;

  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: llTheme.surfaceBase,
    extensions: [llTheme],
    colorScheme: ColorScheme.dark(
      primary: llTheme.actionPrimary,
      secondary: llTheme.pathEnergy,
      tertiary: LLColor.crystalPurple,
      surface: llTheme.surfaceElevated,
      onPrimary: llTheme.actionPrimaryForeground,
      onSecondary: llTheme.actionPrimaryForeground,
      onSurface: llTheme.textPrimary,
      error: llTheme.feedbackDanger,
    ),
  );

  return base.copyWith(
    textTheme: base.textTheme.copyWith(
      displayLarge: LLTextStyle.display,
      displayMedium: LLTextStyle.h1,
      headlineMedium: LLTextStyle.h2,
      titleLarge: LLTextStyle.h2,
      bodyMedium: LLTextStyle.body,
      bodyLarge: LLTextStyle.bodyPrimary,
      labelLarge: LLTextStyle.button.copyWith(color: llTheme.actionPrimary),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: llTheme.surfaceBase.withValues(alpha: 0.92),
      foregroundColor: llTheme.actionPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: LLTextStyle.subtitle,
    ),
    cardTheme: CardThemeData(
      color: llTheme.surfaceElevated,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: llTheme.radiusCard,
        side: BorderSide(color: llTheme.borderSubtle),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: LLColor.stoneEdge.withValues(alpha: 0.6),
      thickness: 1,
    ),
    iconTheme: IconThemeData(color: llTheme.actionPrimary),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: llTheme.surfacePanel,
      contentTextStyle: LLTextStyle.body.copyWith(color: llTheme.textPrimary),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: LLRadius.mdBorder),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: llTheme.surfaceElevated,
      modalBackgroundColor: llTheme.surfaceElevated,
      shape: RoundedRectangleBorder(borderRadius: LLRadius.dialogBorder),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: llTheme.actionPrimary,
      unselectedLabelColor: llTheme.textSecondary,
      indicatorColor: llTheme.actionPrimary,
    ),
  );
}
