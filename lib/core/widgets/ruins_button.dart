import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/ll_button.dart';

/// Deprecated prototype button — use [LLButton] from `design_system`.
@Deprecated(
  'Prototype widget. Use LLButton from package:labyrinth_legends/design_system/design_system.dart',
)
enum RuinsButtonVariant { primary, secondary, ghost, danger }

@Deprecated(
  'Prototype widget. Use LLButton from package:labyrinth_legends/design_system/design_system.dart',
)
class RuinsButton extends StatelessWidget {
  const RuinsButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = RuinsButtonVariant.primary,
    this.expanded = false,
    this.enabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final RuinsButtonVariant variant;
  final bool expanded;
  final bool enabled;

  LLButtonVariant get _mappedVariant => switch (variant) {
        RuinsButtonVariant.primary => LLButtonVariant.primary,
        RuinsButtonVariant.secondary => LLButtonVariant.secondary,
        RuinsButtonVariant.ghost => LLButtonVariant.ghost,
        RuinsButtonVariant.danger => LLButtonVariant.danger,
      };

  @override
  Widget build(BuildContext context) {
    return LLButton(
      label: label,
      onPressed: onPressed,
      icon: icon,
      variant: _mappedVariant,
      expanded: expanded,
      enabled: enabled,
    );
  }
}
