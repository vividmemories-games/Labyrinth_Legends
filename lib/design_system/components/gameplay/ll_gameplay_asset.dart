import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/painting/gameplay_object_painter.dart';

/// Resolves AB2 gameplay-world assets with LLDL programmatic fallbacks (M2.7).
///
/// Avoid direct [Image.asset] in feature widgets — use this component.
class LLGameplayAsset extends StatelessWidget {
  const LLGameplayAsset({
    super.key,
    required this.kind,
    required this.size,
    this.tint,
    this.semanticLabel,
    this.fit = BoxFit.contain,
    this.visualScale = 1,
    this.fallback,
  });

  final GameplayAssetKind kind;
  final double size;
  final Color? tint;
  final String? semanticLabel;
  final BoxFit fit;

  /// Multiplier applied to [size] so trimmed PNGs with canvas padding read larger.
  final double visualScale;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    final renderSize = size * visualScale;
    final dimension = Size.square(renderSize);

    return Semantics(
      label: semanticLabel,
      child: RepaintBoundary(
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Image.asset(
              LLGameplayAssets.path(kind),
              width: renderSize,
              height: renderSize,
              fit: fit,
              gaplessPlayback: true,
              filterQuality: FilterQuality.medium,
              errorBuilder: (_, __, ___) =>
                  fallback ??
                  CustomPaint(
                    size: dimension,
                    painter: GameplayObjectPainter(kind: kind, tint: tint),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
