import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Programmatic AB2 object placeholders — replaced by bitmaps when approved art ships.
class GameplayObjectPainter extends CustomPainter {
  GameplayObjectPainter({
    required this.kind,
    this.tint,
  });

  final GameplayAssetKind kind;
  final Color? tint;

  @override
  void paint(Canvas canvas, Size size) {
    switch (kind) {
      case GameplayAssetKind.explorer:
        _paintExplorer(canvas, size);
      case GameplayAssetKind.gem:
        _paintGem(canvas, size);
      case GameplayAssetKind.key:
        _paintKey(canvas, size);
      case GameplayAssetKind.lockClosed:
        _paintLock(canvas, size, open: false);
      case GameplayAssetKind.lockOpen:
        _paintLock(canvas, size, open: true);
      case GameplayAssetKind.exitPortal:
        _paintExitPortal(canvas, size);
      case GameplayAssetKind.extensionHint:
        _paintExtensionHint(canvas, size);
      case GameplayAssetKind.invalidBlock:
        _paintInvalidBlock(canvas, size);
      case GameplayAssetKind.switchOff:
        _paintSwitch(canvas, size);
      case GameplayAssetKind.tileFloor:
      case GameplayAssetKind.edgeNorth:
      case GameplayAssetKind.edgeEast:
      case GameplayAssetKind.edgeSouth:
      case GameplayAssetKind.edgeWest:
      case GameplayAssetKind.edgeCornerNorthEast:
      case GameplayAssetKind.edgeCornerNorthWest:
      case GameplayAssetKind.edgeCornerSouthEast:
      case GameplayAssetKind.edgeCornerSouthWest:
      case GameplayAssetKind.edgeInnerNorthEast:
      case GameplayAssetKind.edgeInnerNorthWest:
      case GameplayAssetKind.edgeInnerSouthEast:
      case GameplayAssetKind.edgeInnerSouthWest:
        break;
    }
  }

  void _paintExplorer(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final bodyColor = tint ?? LLColor.ancientGold;
    final radius = size.shortestSide * 0.22;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..shader = RadialGradient(
          colors: [
            bodyColor.withValues(alpha: 0.95),
            LLColor.ancientGoldDark,
          ],
        ).createShader(Rect.fromCircle(center: center, radius: radius)),
    );

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(1, size.shortestSide * 0.04)
        ..color = LLColor.ancientGoldLight.withValues(alpha: 0.85),
    );

    final headCenter = center + Offset(0, -radius * 0.55);
    canvas.drawCircle(
      headCenter,
      radius * 0.42,
      Paint()..color = bodyColor.withValues(alpha: 0.92),
    );
  }

  void _paintGem(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final w = size.width * 0.28;
    final h = size.height * 0.34;
    final path = Path()
      ..moveTo(center.dx, center.dy - h)
      ..lineTo(center.dx + w, center.dy)
      ..lineTo(center.dx, center.dy + h)
      ..lineTo(center.dx - w, center.dy)
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            LLColor.crystalPurple.withValues(alpha: 0.95),
            LLColor.crystalPurple.withValues(alpha: 0.55),
          ],
        ).createShader(
            Rect.fromCenter(center: center, width: w * 2, height: h * 2)),
    );
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(0.75, size.shortestSide * 0.025)
        ..color = Colors.white.withValues(alpha: 0.35),
    );
  }

  void _paintKey(Canvas canvas, Size size) {
    final color = tint ?? LLColor.ancientGold;
    final stroke = math.max(1.2, size.shortestSide * 0.05);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    final headCenter = Offset(size.width * 0.62, size.height * 0.28);
    canvas.drawCircle(headCenter, size.shortestSide * 0.11, paint);
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.55),
      Offset(size.width * 0.62, size.height * 0.35),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.55),
      Offset(size.width * 0.35, size.height * 0.72),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.64),
      Offset(size.width * 0.28, size.height * 0.64),
      paint,
    );
  }

  void _paintLock(Canvas canvas, Size size, {required bool open}) {
    final color = tint ?? LLColor.emberRed;
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.28,
        size.height * 0.42,
        size.width * 0.44,
        size.height * 0.38,
      ),
      Radius.circular(size.shortestSide * 0.06),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..color = LLColor.stoneEdge.withValues(alpha: 0.9)
        ..style = PaintingStyle.fill,
    );
    canvas.drawRRect(
      body,
      Paint()
        ..color = color.withValues(alpha: 0.85)
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(1, size.shortestSide * 0.035),
    );

    final shackle = Rect.fromLTWH(
      size.width * 0.34,
      size.height * (open ? 0.16 : 0.22),
      size.width * 0.32,
      size.height * 0.28,
    );
    canvas.drawArc(
      shackle,
      math.pi,
      math.pi,
      false,
      Paint()
        ..color = color.withValues(alpha: 0.9)
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(1.2, size.shortestSide * 0.045),
    );
  }

  void _paintExitPortal(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final outer = size.shortestSide * 0.34;
    final inner = size.shortestSide * 0.22;

    canvas.drawCircle(
      center,
      outer,
      Paint()
        ..shader = RadialGradient(
          colors: [
            LLColor.portalBlue.withValues(alpha: 0.45),
            LLColor.portalBlue.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromCircle(center: center, radius: outer)),
    );

    canvas.drawCircle(
      center,
      inner,
      Paint()
        ..shader = RadialGradient(
          colors: [
            LLColor.energyCyan.withValues(alpha: 0.85),
            LLColor.portalBlue.withValues(alpha: 0.65),
          ],
        ).createShader(Rect.fromCircle(center: center, radius: inner)),
    );

    canvas.drawCircle(
      center,
      inner,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = math.max(1, size.shortestSide * 0.03)
        ..color = LLColor.energyCyan.withValues(alpha: 0.9),
    );
  }

  void _paintExtensionHint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final color = tint ?? LLColor.energyCyan;
    final arm = size.shortestSide * 0.12;
    final paint = Paint()
      ..color = color.withValues(alpha: 0.65)
      ..strokeWidth = math.max(1, size.shortestSide * 0.035)
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(center.dx - arm, center.dy),
      Offset(center.dx + arm, center.dy),
      paint,
    );
    canvas.drawLine(
      Offset(center.dx, center.dy - arm),
      Offset(center.dx, center.dy + arm),
      paint,
    );
  }

  void _paintInvalidBlock(Canvas canvas, Size size) {
    final color = tint ?? LLColor.emberRed;
    final center = size.center(Offset.zero);
    final radius = size.shortestSide * 0.18;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = color.withValues(alpha: 0.18)
        ..style = PaintingStyle.fill,
    );
    final paint = Paint()
      ..color = color
      ..strokeWidth = math.max(1.2, size.shortestSide * 0.045)
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center + Offset(-radius * 0.55, -radius * 0.55),
      center + Offset(radius * 0.55, radius * 0.55),
      paint,
    );
    canvas.drawLine(
      center + Offset(radius * 0.55, -radius * 0.55),
      center + Offset(-radius * 0.55, radius * 0.55),
      paint,
    );
  }

  void _paintSwitch(Canvas canvas, Size size) {
    final color = LLColor.ancientGoldDark;
    final plate = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.22,
        size.height * 0.58,
        size.width * 0.56,
        size.height * 0.18,
      ),
      Radius.circular(size.shortestSide * 0.04),
    );
    canvas.drawRRect(plate, Paint()..color = color.withValues(alpha: 0.75));
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.38),
      size.shortestSide * 0.12,
      Paint()..color = LLColor.ancientGold.withValues(alpha: 0.85),
    );
  }

  @override
  bool shouldRepaint(covariant GameplayObjectPainter oldDelegate) {
    return oldDelegate.kind != kind || oldDelegate.tint != tint;
  }
}
