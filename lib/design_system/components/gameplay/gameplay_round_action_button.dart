import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_hud_icon.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Circular stone action control — MVP gameplay mockup (UNDO / ERASE / HINT).
class GameplayRoundActionButton extends StatelessWidget {
  const GameplayRoundActionButton({
    super.key,
    required this.label,
    required this.iconKind,
    this.onPressed,
    this.enabled = true,
    this.badge,
    this.tooltip,
  });

  final String label;
  final GameplayHudIconKind iconKind;
  final VoidCallback? onPressed;
  final bool enabled;
  final String? badge;
  final String? tooltip;

  static const double _diameter = 64;
  static const double _iconScale = 0.84;
  static const double _iconSize = _diameter * _iconScale;
  static const double _iconVisualScale = 1.22;

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onPressed != null;
    final semanticsLabel = tooltip ?? label;

    final button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isInteractive ? onPressed : null,
        customBorder: const CircleBorder(),
        child: Ink(
          width: _diameter,
          height: _diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LLGradient.stonePanel,
            border: Border.all(
              color: LLColor.ancientGold
                  .withValues(alpha: LLColor.borderGoldAlpha),
              width: LLSize.borderWidth * 1.2,
            ),
            boxShadow: LLShadow.soft,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              LLHudIcon(
                kind: iconKind,
                size: _iconSize,
                fit: BoxFit.cover,
                visualScale: _iconVisualScale,
              ),
              if (badge != null)
                Positioned(
                  top: -2,
                  right: -2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: LLColor.ancientGold,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: LLColor.templeBlack,
                        width: LLSize.borderWidth,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(LLSpacing.xs),
                      child: Text(
                        badge!,
                        style: LLTextStyle.caption.copyWith(
                          color: LLColor.templeBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    return Opacity(
      opacity: isInteractive ? 1 : 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            button: true,
            enabled: isInteractive,
            label: semanticsLabel,
            child: button,
          ),
          const SizedBox(height: LLSpacing.xs),
          Text(
            label,
            style: LLTextStyle.caption.copyWith(
              color: LLColor.textSecondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
