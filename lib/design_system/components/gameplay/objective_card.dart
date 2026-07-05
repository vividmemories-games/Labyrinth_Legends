import 'package:flutter/material.dart';
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

    return Semantics(
      label: progressLabel == null ? title : '$title. $progressLabel',
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: theme.radiusCard,
          color: theme.surfaceElevated.withValues(alpha: 0.88),
          border: Border.all(color: theme.borderSubtle, width: LLSize.borderWidth),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacingHudInset + LLSpacing.xs,
            vertical: theme.spacingHudInset,
          ),
          child: Row(
            children: [
              Icon(
                Icons.flag_outlined,
                size: LLSize.iconSm,
                color: theme.actionPrimary,
              ),
              SizedBox(width: theme.spacingHudInset),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: LLTextStyle.caption.copyWith(color: theme.textPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (progressLabel != null) ...[
                      SizedBox(height: LLSpacing.xs),
                      Text(
                        progressLabel!,
                        style: LLTextStyle.caption.copyWith(
                          color: theme.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
