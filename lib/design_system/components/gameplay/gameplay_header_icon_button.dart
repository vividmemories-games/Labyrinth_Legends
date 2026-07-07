import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_hud_icon.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Transparent header icon control — back / settings per MVP gameplay mockup.
class GameplayHeaderIconButton extends StatelessWidget {
  const GameplayHeaderIconButton({
    super.key,
    required this.iconKind,
    this.onPressed,
    this.tooltip,
    this.enabled = true,
  });

  final GameplayHudIconKind iconKind;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool enabled;

  static const double _diameter = 56;
  static const double _iconScale = 0.88;
  static const double _iconSize = _diameter * _iconScale;
  static const double _iconVisualScale = 1.2;

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onPressed != null;
    final label = tooltip ?? iconKind.name;

    return Semantics(
      button: true,
      enabled: isInteractive,
      label: label,
      child: Opacity(
        opacity: isInteractive ? 1 : 0.5,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isInteractive ? onPressed : null,
            borderRadius: LLRadius.mdBorder,
            splashColor: LLColor.ancientGold.withValues(alpha: 0.14),
            highlightColor: LLColor.ancientGold.withValues(alpha: 0.08),
            child: SizedBox(
              width: _diameter,
              height: _diameter,
              child: Center(
                child: LLHudIcon(
                  kind: iconKind,
                  size: _iconSize,
                  fit: BoxFit.cover,
                  visualScale: _iconVisualScale,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
