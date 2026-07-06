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
  });

  final GameplayAssetKind kind;
  final double size;
  final Color? tint;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final dimension = Size.square(size);

    return Semantics(
      label: semanticLabel,
      child: RepaintBoundary(
        child: Image.asset(
          LLGameplayAssets.path(kind),
          width: size,
          height: size,
          fit: BoxFit.contain,
          gaplessPlayback: true,
          errorBuilder: (_, __, ___) => CustomPaint(
            size: dimension,
            painter: GameplayObjectPainter(kind: kind, tint: tint),
          ),
        ),
      ),
    );
  }
}
