import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/board/board_geometry.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

/// Premium engraved path linework — UI_03 path visualization (M2.7).
class PremiumPathOverlayPainter extends CustomPainter {
  PremiumPathOverlayPainter({
    required this.geometry,
    required this.path,
    required this.pathColor,
    required this.endpointColor,
  });

  final BoardGeometry geometry;
  final List<GridPosition> path;
  final Color pathColor;
  final Color endpointColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (path.length < 2) {
      return;
    }

    final coreWidth = geometry.cellSize * 0.1;
    final glowWidth = geometry.cellSize * 0.16;

    for (var i = 0; i < path.length - 1; i++) {
      final from = geometry.cellCenter(path[i]);
      final to = geometry.cellCenter(path[i + 1]);

      canvas.drawLine(
        from,
        to,
        Paint()
          ..color = pathColor.withValues(alpha: 0.18)
          ..strokeWidth = glowWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      );

      canvas.drawLine(
        from,
        to,
        Paint()
          ..color = pathColor.withValues(alpha: 0.82)
          ..strokeWidth = coreWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      );
    }

    final endpoint = geometry.cellCenter(path.last);
    final endpointRadius = geometry.cellSize * 0.11;
    canvas.drawCircle(
      endpoint,
      endpointRadius * 1.35,
      Paint()
        ..color = endpointColor.withValues(alpha: 0.22)
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      endpoint,
      endpointRadius,
      Paint()..color = endpointColor,
    );
    canvas.drawCircle(
      endpoint,
      endpointRadius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(1, geometry.cellSize * 0.02)
        ..color = Colors.white.withValues(alpha: 0.35),
    );
  }

  @override
  bool shouldRepaint(covariant PremiumPathOverlayPainter oldDelegate) {
    return oldDelegate.path != path ||
        oldDelegate.geometry.cellSize != geometry.cellSize ||
        oldDelegate.pathColor != pathColor ||
        oldDelegate.endpointColor != endpointColor;
  }
}
