import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/painting/gameplay_object_painter.dart';

/// AB3 HUD icon with asset path + programmatic fallback (M2.7).
class LLHudIcon extends StatelessWidget {
  const LLHudIcon({
    super.key,
    required this.kind,
    required this.size,
    this.color,
    this.semanticLabel,
  });

  final GameplayHudIconKind kind;
  final double size;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: RepaintBoundary(
        child: Image.asset(
          LLGameplayAssets.hudIconPath(kind),
          width: size,
          height: size,
          fit: BoxFit.contain,
          color: color,
          gaplessPlayback: true,
          errorBuilder: (_, __, ___) => _FallbackHudIcon(
            kind: kind,
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _FallbackHudIcon extends StatelessWidget {
  const _FallbackHudIcon({
    required this.kind,
    required this.size,
    this.color,
  });

  final GameplayHudIconKind kind;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final assetKind = switch (kind) {
      GameplayHudIconKind.gem => GameplayAssetKind.gem,
      GameplayHudIconKind.key => GameplayAssetKind.key,
      GameplayHudIconKind.statusLock => GameplayAssetKind.lockClosed,
      GameplayHudIconKind.statusBlock => GameplayAssetKind.invalidBlock,
      _ => null,
    };

    if (assetKind != null) {
      return CustomPaint(
        size: Size.square(size),
        painter: GameplayObjectPainter(kind: assetKind, tint: color),
      );
    }

    return Icon(
      _materialIcon(kind),
      size: size,
      color: color,
    );
  }

  IconData _materialIcon(GameplayHudIconKind kind) => switch (kind) {
        GameplayHudIconKind.objective => Icons.flag_outlined,
        GameplayHudIconKind.objectiveComplete => Icons.check_circle_outline,
        GameplayHudIconKind.objectiveFailed => Icons.error_outline,
        GameplayHudIconKind.pause => Icons.pause,
        GameplayHudIconKind.statusCheck => Icons.check,
        GameplayHudIconKind.statusRefresh => Icons.refresh,
        GameplayHudIconKind.statusClear => Icons.clear_all,
        _ => Icons.circle_outlined,
      };
}
