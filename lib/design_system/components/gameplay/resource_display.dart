import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum ResourceDisplayState { hidden, idle, updating, depleted, emphasized }

/// Contextual resource counter for the gameplay HUD — UI_05 Resource Display.
class ResourceDisplay extends StatelessWidget {
  const ResourceDisplay({
    super.key,
    required this.icon,
    required this.value,
    this.label,
    this.state = ResourceDisplayState.idle,
  });

  final IconData icon;
  final String value;
  final String? label;
  final ResourceDisplayState state;

  @override
  Widget build(BuildContext context) {
    if (state == ResourceDisplayState.hidden) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;
    final semanticsLabel = label == null ? value : '$value $label';

    return Semantics(
      label: semanticsLabel,
      child: DecoratedBox(
        decoration: LLSurface.pill(
          borderColor: state == ResourceDisplayState.emphasized
              ? theme.actionPrimary
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacingHudInset + LLSpacing.xs,
            vertical: theme.spacingHudInset,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: LLSize.iconSm, color: theme.actionPrimary),
              SizedBox(width: LLSpacing.xs),
              Text(
                value,
                style: LLTextStyle.caption.copyWith(color: theme.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
