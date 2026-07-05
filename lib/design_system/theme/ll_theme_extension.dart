import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Semantic design-token mapping exposed through [ThemeData.extensions].
///
/// Maps UI_04 semantic roles to canonical LLDL values. Widgets should prefer
/// [BuildContext.llTheme] over direct [LLColor] references where possible.
@immutable
class LLThemeExtension extends ThemeExtension<LLThemeExtension> {
  const LLThemeExtension({
    required this.actionPrimary,
    required this.actionPrimaryForeground,
    required this.pathEnergy,
    required this.surfaceBase,
    required this.surfaceElevated,
    required this.surfacePanel,
    required this.textPrimary,
    required this.textSecondary,
    required this.feedbackDanger,
    required this.feedbackSuccess,
    required this.borderSubtle,
    required this.overlayVeil,
    required this.spacingScreenPadding,
    required this.spacingZoneGap,
    required this.spacingHudInset,
    required this.radiusPanel,
    required this.radiusCard,
    required this.radiusButton,
  });

  final Color actionPrimary;
  final Color actionPrimaryForeground;
  final Color pathEnergy;
  final Color surfaceBase;
  final Color surfaceElevated;
  final Color surfacePanel;
  final Color textPrimary;
  final Color textSecondary;
  final Color feedbackDanger;
  final Color feedbackSuccess;
  final Color borderSubtle;
  final Color overlayVeil;

  final double spacingScreenPadding;
  final double spacingZoneGap;
  final double spacingHudInset;

  final BorderRadius radiusPanel;
  final BorderRadius radiusCard;
  final BorderRadius radiusButton;

  static LLThemeExtension get light => dark;

  static LLThemeExtension get dark => LLThemeExtension(
        actionPrimary: LLColor.ancientGold,
        actionPrimaryForeground: LLColor.templeBlack,
        pathEnergy: LLColor.energyCyan,
        surfaceBase: LLColor.templeBlack,
        surfaceElevated: LLColor.stoneDark,
        surfacePanel: LLColor.stoneMid,
        textPrimary: LLColor.textPrimary,
        textSecondary: LLColor.textSecondary,
        feedbackDanger: LLColor.emberRed,
        feedbackSuccess: LLColor.successGreen,
        borderSubtle: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
        overlayVeil: LLColor.templeBlack.withValues(alpha: LLColor.overlayVeilAlpha),
        spacingScreenPadding: LLSpacing.screenPadding,
        spacingZoneGap: LLSpacing.md,
        spacingHudInset: LLSpacing.sm,
        radiusPanel: LLRadius.panelBorder,
        radiusCard: LLRadius.cardBorder,
        radiusButton: LLRadius.buttonBorder,
      );

  @override
  LLThemeExtension copyWith({
    Color? actionPrimary,
    Color? actionPrimaryForeground,
    Color? pathEnergy,
    Color? surfaceBase,
    Color? surfaceElevated,
    Color? surfacePanel,
    Color? textPrimary,
    Color? textSecondary,
    Color? feedbackDanger,
    Color? feedbackSuccess,
    Color? borderSubtle,
    Color? overlayVeil,
    double? spacingScreenPadding,
    double? spacingZoneGap,
    double? spacingHudInset,
    BorderRadius? radiusPanel,
    BorderRadius? radiusCard,
    BorderRadius? radiusButton,
  }) {
    return LLThemeExtension(
      actionPrimary: actionPrimary ?? this.actionPrimary,
      actionPrimaryForeground:
          actionPrimaryForeground ?? this.actionPrimaryForeground,
      pathEnergy: pathEnergy ?? this.pathEnergy,
      surfaceBase: surfaceBase ?? this.surfaceBase,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      surfacePanel: surfacePanel ?? this.surfacePanel,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      feedbackDanger: feedbackDanger ?? this.feedbackDanger,
      feedbackSuccess: feedbackSuccess ?? this.feedbackSuccess,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      overlayVeil: overlayVeil ?? this.overlayVeil,
      spacingScreenPadding: spacingScreenPadding ?? this.spacingScreenPadding,
      spacingZoneGap: spacingZoneGap ?? this.spacingZoneGap,
      spacingHudInset: spacingHudInset ?? this.spacingHudInset,
      radiusPanel: radiusPanel ?? this.radiusPanel,
      radiusCard: radiusCard ?? this.radiusCard,
      radiusButton: radiusButton ?? this.radiusButton,
    );
  }

  @override
  LLThemeExtension lerp(covariant ThemeExtension<LLThemeExtension>? other, double t) {
    if (other is! LLThemeExtension) return this;
    return LLThemeExtension(
      actionPrimary: Color.lerp(actionPrimary, other.actionPrimary, t)!,
      actionPrimaryForeground:
          Color.lerp(actionPrimaryForeground, other.actionPrimaryForeground, t)!,
      pathEnergy: Color.lerp(pathEnergy, other.pathEnergy, t)!,
      surfaceBase: Color.lerp(surfaceBase, other.surfaceBase, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      surfacePanel: Color.lerp(surfacePanel, other.surfacePanel, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      feedbackDanger: Color.lerp(feedbackDanger, other.feedbackDanger, t)!,
      feedbackSuccess: Color.lerp(feedbackSuccess, other.feedbackSuccess, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      overlayVeil: Color.lerp(overlayVeil, other.overlayVeil, t)!,
      spacingScreenPadding:
          spacingScreenPadding + (other.spacingScreenPadding - spacingScreenPadding) * t,
      spacingZoneGap: spacingZoneGap + (other.spacingZoneGap - spacingZoneGap) * t,
      spacingHudInset: spacingHudInset + (other.spacingHudInset - spacingHudInset) * t,
      radiusPanel: BorderRadius.lerp(radiusPanel, other.radiusPanel, t)!,
      radiusCard: BorderRadius.lerp(radiusCard, other.radiusCard, t)!,
      radiusButton: BorderRadius.lerp(radiusButton, other.radiusButton, t)!,
    );
  }
}

extension LLThemeContext on BuildContext {
  LLThemeExtension get llTheme =>
      Theme.of(this).extension<LLThemeExtension>() ?? LLThemeExtension.dark;
}
