import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';

/// Carved stone tile base — AB2 environment placeholder until bitmap tiles ship.
class MazeTilePainter extends CustomPainter {
  MazeTilePainter({
    required this.cellType,
    required this.isWalkable,
  });

  final CellType cellType;
  final bool isWalkable;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final inset = size.shortestSide * 0.04;

    if (!isWalkable) {
      _paintWall(canvas, rect, inset);
      return;
    }

    _paintFloor(canvas, rect, inset);

    if (cellType == CellType.start) {
      _paintStartAccent(canvas, rect);
    } else if (cellType == CellType.exit) {
      _paintExitAccent(canvas, rect);
    }
  }

  void _paintWall(Canvas canvas, Rect rect, double inset) {
    final basePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          LLColor.stoneEdge,
          LLColor.stoneDark,
          LLColor.templeBlack.withValues(alpha: 0.95),
        ],
      ).createShader(rect);
    canvas.drawRect(rect, basePaint);

    _paintBevel(canvas, rect, highlight: false);

    final groove = Rect.fromLTWH(
      inset,
      inset,
      rect.width - inset * 2,
      rect.height - inset * 2,
    );
    canvas.drawRect(
      groove,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(1, rect.shortestSide * 0.03)
        ..color = LLColor.templeBlack.withValues(alpha: 0.55),
    );
  }

  void _paintFloor(Canvas canvas, Rect rect, double inset) {
    final basePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          LLColor.stoneMid.withValues(alpha: 0.98),
          LLColor.stoneDark.withValues(alpha: 0.96),
        ],
      ).createShader(rect);
    canvas.drawRect(rect, basePaint);

    _paintBevel(canvas, rect, highlight: true);
    _paintEngravedBorder(canvas, rect, inset);
    _paintCornerGlyphs(canvas, rect, inset);
  }

  void _paintBevel(Canvas canvas, Rect rect, {required bool highlight}) {
    final stroke = math.max(0.75, rect.shortestSide * 0.025);
    final topLeft = highlight ? LLColor.stoneEdge.withValues(alpha: 0.45) : LLColor.templeBlack.withValues(alpha: 0.35);
    final bottomRight = highlight ? LLColor.templeBlack.withValues(alpha: 0.35) : LLColor.templeBlack.withValues(alpha: 0.65);

    canvas.drawLine(
      rect.topLeft,
      rect.topRight,
      Paint()
        ..color = topLeft
        ..strokeWidth = stroke,
    );
    canvas.drawLine(
      rect.topLeft,
      rect.bottomLeft,
      Paint()
        ..color = topLeft
        ..strokeWidth = stroke,
    );
    canvas.drawLine(
      rect.bottomLeft,
      rect.bottomRight,
      Paint()
        ..color = bottomRight
        ..strokeWidth = stroke,
    );
    canvas.drawLine(
      rect.topRight,
      rect.bottomRight,
      Paint()
        ..color = bottomRight
        ..strokeWidth = stroke,
    );
  }

  void _paintEngravedBorder(Canvas canvas, Rect rect, double inset) {
    final inner = Rect.fromLTWH(
      inset * 1.4,
      inset * 1.4,
      rect.width - inset * 2.8,
      rect.height - inset * 2.8,
    );
    canvas.drawRect(
      inner,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(0.75, rect.shortestSide * 0.018)
        ..color = LLColor.ancientGoldDark.withValues(alpha: 0.22),
    );
  }

  void _paintCornerGlyphs(Canvas canvas, Rect rect, double inset) {
    final glyphLen = rect.shortestSide * 0.14;
    final paint = Paint()
      ..color = LLColor.ancientGold.withValues(alpha: 0.12)
      ..strokeWidth = math.max(0.75, rect.shortestSide * 0.02)
      ..strokeCap = StrokeCap.round;

    for (final corner in [
      Offset(inset * 2, inset * 2),
      Offset(rect.width - inset * 2, inset * 2),
      Offset(inset * 2, rect.height - inset * 2),
      Offset(rect.width - inset * 2, rect.height - inset * 2),
    ]) {
      canvas.drawLine(corner, corner + Offset(glyphLen, 0), paint);
      canvas.drawLine(corner, corner + Offset(0, glyphLen), paint);
    }
  }

  void _paintStartAccent(Canvas canvas, Rect rect) {
    final center = rect.center;
    final radius = rect.shortestSide * 0.18;
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = LLColor.ancientGold.withValues(alpha: 0.14),
    );
  }

  void _paintExitAccent(Canvas canvas, Rect rect) {
    final center = rect.center;
    final radius = rect.shortestSide * 0.2;
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = LLColor.portalBlue.withValues(alpha: 0.12),
    );
  }

  @override
  bool shouldRepaint(covariant MazeTilePainter oldDelegate) {
    return oldDelegate.cellType != cellType ||
        oldDelegate.isWalkable != isWalkable;
  }
}
