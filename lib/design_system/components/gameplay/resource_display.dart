import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_hud_icon.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum ResourceDisplayState { hidden, idle, updating, depleted, emphasized }

/// Contextual resource counter for the gameplay HUD — UI_05 Resource Display.
class ResourceDisplay extends StatelessWidget {
  const ResourceDisplay({
    super.key,
    required this.iconKind,
    required this.value,
    this.label,
    this.state = ResourceDisplayState.idle,
  });

  final GameplayHudIconKind iconKind;
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
    final borderColor = switch (state) {
      ResourceDisplayState.emphasized => theme.actionPrimary,
      ResourceDisplayState.updating => theme.pathEnergy.withValues(alpha: 0.7),
      ResourceDisplayState.depleted =>
        theme.feedbackDanger.withValues(alpha: 0.5),
      _ => null,
    };

    return Semantics(
      label: semanticsLabel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: LLSurface.pill(borderColor: borderColor),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacingHudInset + LLSpacing.sm,
            vertical: theme.spacingHudInset + LLSpacing.xs,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LLHudIcon(
                kind: iconKind,
                size: LLSize.iconSm,
              ),
              const SizedBox(width: LLSpacing.sm),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: Text(
                  value,
                  key: ValueKey<String>(value),
                  style: LLTextStyle.caption.copyWith(
                    color: theme.textPrimary,
                    fontWeight: FontWeight.w600,
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
