import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_hud_icon.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum ObjectiveCardState { idle, focused, updating, completed, failed, hidden }

/// Presents the current objective in the top context zone — UI_05 Objective Card.
class ObjectiveCard extends StatelessWidget {
  const ObjectiveCard({
    super.key,
    required this.title,
    this.progressLabel,
    this.state = ObjectiveCardState.idle,
  });

  final String title;
  final String? progressLabel;
  final ObjectiveCardState state;

  @override
  Widget build(BuildContext context) {
    if (state == ObjectiveCardState.hidden) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;
    final visuals = _ObjectiveCardVisuals.fromState(state, theme);

    return Semantics(
      label: progressLabel == null ? title : '$title. $progressLabel',
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: theme.radiusCard,
          color: theme.surfaceElevated.withValues(alpha: 0.92),
          border: Border.all(
            color: visuals.borderColor,
            width: visuals.borderWidth,
          ),
          boxShadow: LLShadow.soft,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacingHudInset + LLSpacing.sm,
            vertical: theme.spacingHudInset + LLSpacing.xs,
          ),
          child: Row(
            children: [
              LLHudIcon(
                kind: visuals.iconKind,
                size: LLSize.iconSm,
                color: visuals.iconColor,
              ),
              SizedBox(width: theme.spacingHudInset),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Column(
                    key: ValueKey<String?>(progressLabel),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: LLTextStyle.body.copyWith(
                          color: theme.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (progressLabel != null) ...[
                        const SizedBox(height: LLSpacing.xs),
                        Text(
                          progressLabel!,
                          style: LLTextStyle.caption.copyWith(
                            color: visuals.progressColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ObjectiveCardVisuals {
  const _ObjectiveCardVisuals({
    required this.iconKind,
    required this.iconColor,
    required this.borderColor,
    required this.progressColor,
    required this.borderWidth,
  });

  final GameplayHudIconKind iconKind;
  final Color iconColor;
  final Color borderColor;
  final Color progressColor;
  final double borderWidth;

  factory _ObjectiveCardVisuals.fromState(
    ObjectiveCardState state,
    LLThemeExtension theme,
  ) {
    return switch (state) {
      ObjectiveCardState.completed => _ObjectiveCardVisuals(
          iconKind: GameplayHudIconKind.objectiveComplete,
          iconColor: theme.feedbackSuccess,
          borderColor: theme.feedbackSuccess.withValues(alpha: 0.65),
          progressColor: theme.feedbackSuccess,
          borderWidth: LLSize.borderWidth * 1.2,
        ),
      ObjectiveCardState.failed => _ObjectiveCardVisuals(
          iconKind: GameplayHudIconKind.objectiveFailed,
          iconColor: theme.feedbackDanger,
          borderColor: theme.feedbackDanger.withValues(alpha: 0.65),
          progressColor: theme.feedbackDanger,
          borderWidth: LLSize.borderWidth * 1.2,
        ),
      ObjectiveCardState.updating => _ObjectiveCardVisuals(
          iconKind: GameplayHudIconKind.objective,
          iconColor: theme.pathEnergy,
          borderColor: theme.pathEnergy.withValues(alpha: 0.55),
          progressColor: theme.pathEnergy,
          borderWidth: LLSize.borderWidth * 1.1,
        ),
      ObjectiveCardState.focused => _ObjectiveCardVisuals(
          iconKind: GameplayHudIconKind.objective,
          iconColor: theme.actionPrimary,
          borderColor: theme.actionPrimary.withValues(alpha: 0.55),
          progressColor: theme.textSecondary,
          borderWidth: LLSize.borderWidth * 1.1,
        ),
      ObjectiveCardState.idle ||
      ObjectiveCardState.hidden =>
        _ObjectiveCardVisuals(
          iconKind: GameplayHudIconKind.objective,
          iconColor: theme.actionPrimary,
          borderColor: theme.borderSubtle,
          progressColor: theme.textSecondary,
          borderWidth: LLSize.borderWidth,
        ),
    };
  }
}
