import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum ProceduralTileKind {
  floor,
  wallFill,
  wallEdgeNorth,
  wallEdgeEast,
  wallEdgeSouth,
  wallEdgeWest,
  wallCornerNorthEast,
  wallCornerNorthWest,
  wallCornerSouthEast,
  wallCornerSouthWest,
  wallInnerNorthEast,
  wallInnerNorthWest,
  wallInnerSouthEast,
  wallInnerSouthWest,
}

enum ProceduralSpriteKind {
  explorer,
  key,
  lockClosed,
  hudBack,
  hudSettings,
}

/// Rich ancient-temple tile art for gameplay PNG export.
class ProceduralTilePainter extends CustomPainter {
  const ProceduralTilePainter(this.kind);

  final ProceduralTileKind kind;

  static const int _seed = 41;

  @override
  void paint(Canvas canvas, Size size) {
    final art = _StoneArt(size: size, seed: _seed);
    switch (kind) {
      case ProceduralTileKind.floor:
        _paintFloor(canvas, size, art);
      case ProceduralTileKind.wallFill:
        _paintWallFill(canvas, size, art);
      case ProceduralTileKind.wallEdgeNorth:
        _paintEdgeShadow(canvas, size, band: _EdgeBand.north);
      case ProceduralTileKind.wallEdgeSouth:
        _paintEdgeShadow(canvas, size, band: _EdgeBand.south);
      case ProceduralTileKind.wallEdgeWest:
        _paintEdgeShadow(canvas, size, band: _EdgeBand.west);
      case ProceduralTileKind.wallEdgeEast:
        _paintEdgeShadow(canvas, size, band: _EdgeBand.east);
      case ProceduralTileKind.wallCornerNorthEast:
        _paintCornerShadow(canvas, size, top: true, right: true);
      case ProceduralTileKind.wallCornerNorthWest:
        _paintCornerShadow(canvas, size, top: true, right: false);
      case ProceduralTileKind.wallCornerSouthEast:
        _paintCornerShadow(canvas, size, top: false, right: true);
      case ProceduralTileKind.wallCornerSouthWest:
        _paintCornerShadow(canvas, size, top: false, right: false);
      case ProceduralTileKind.wallInnerNorthEast:
        _paintInnerShadow(canvas, size, top: true, right: true);
      case ProceduralTileKind.wallInnerNorthWest:
        _paintInnerShadow(canvas, size, top: true, right: false);
      case ProceduralTileKind.wallInnerSouthEast:
        _paintInnerShadow(canvas, size, top: false, right: true);
      case ProceduralTileKind.wallInnerSouthWest:
        _paintInnerShadow(canvas, size, top: false, right: false);
    }
  }

  void _paintFloor(Canvas canvas, Size size, _StoneArt art) {
    final rect = Offset.zero & size;
    final s = size.shortestSide;

    canvas.drawRect(
      rect,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(0, -0.15),
          radius: 1.1,
          colors: [
            const Color(0xFF2A3140),
            const Color(0xFF1E2430),
            const Color(0xFF141820),
          ],
          stops: const [0.0, 0.55, 1.0],
        ).createShader(rect),
    );

    art.stoneGrain(canvas, rect, strength: 0.14);
    art.cracks(canvas, rect, count: 5, alpha: 0.12);

    final inset = s * 0.07;
    final inner = Rect.fromLTWH(inset, inset, size.width - inset * 2, size.height - inset * 2);

    canvas.drawRect(
      inner,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.018
        ..color = LLColor.ancientGoldDark.withValues(alpha: 0.35),
    );
    canvas.drawRect(
      inner.deflate(s * 0.025),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.008
        ..color = LLColor.ancientGold.withValues(alpha: 0.15),
    );

    _paintFloorRosette(canvas, size, inner);
    art.cornerBrackets(canvas, rect, color: LLColor.ancientGold.withValues(alpha: 0.22), size: s * 0.11);
    art.mossPatches(canvas, rect, count: 2, alpha: 0.08);

    art.bevel(canvas, rect, highlight: true, strength: 0.55);
    art.vignette(canvas, rect, strength: 0.22);
  }

  void _paintFloorRosette(Canvas canvas, Size size, Rect inner) {
    final c = inner.center;
    final r = inner.shortestSide * 0.2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.shortestSide * 0.01
      ..color = LLColor.ancientGoldDark.withValues(alpha: 0.2);

    canvas.drawCircle(c, r, paint);
    canvas.drawCircle(c, r * 0.55, paint..color = LLColor.ancientGold.withValues(alpha: 0.12));

    for (var i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;
      final p1 = Offset(c.dx + math.cos(angle) * r * 0.3, c.dy + math.sin(angle) * r * 0.3);
      final p2 = Offset(c.dx + math.cos(angle) * r, c.dy + math.sin(angle) * r);
      canvas.drawLine(p1, p2, paint..color = LLColor.ancientGold.withValues(alpha: 0.1));
    }
  }

  void _paintWallFill(Canvas canvas, Size size, _StoneArt art) {
    final rect = Offset.zero & size;
    final s = size.shortestSide;
    final rim = s * 0.09;

    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A1E28),
            Color(0xFF0E1018),
            Color(0xFF060810),
          ],
        ).createShader(rect),
    );

    final topFace = rect.deflate(rim);
    canvas.drawRect(
      topFace,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.2, -0.25),
          radius: 1.0,
          colors: [
            const Color(0xFF353C4A),
            const Color(0xFF222830),
            const Color(0xFF161A22),
          ],
        ).createShader(topFace),
    );

    art.stoneGrain(canvas, topFace, strength: 0.18);
    art.cracks(canvas, topFace, count: 7, alpha: 0.18);

    final runeY = topFace.center.dy;
    final runePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          LLColor.energyCyan.withValues(alpha: 0.0),
          LLColor.energyCyan.withValues(alpha: 0.85),
          LLColor.portalBlue.withValues(alpha: 0.9),
          LLColor.energyCyan.withValues(alpha: 0.85),
          LLColor.energyCyan.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(topFace.left, runeY - 2, topFace.width, 4))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    canvas.drawRect(
      Rect.fromLTWH(topFace.left + topFace.width * 0.08, runeY - s * 0.012, topFace.width * 0.84, s * 0.024),
      runePaint,
    );

    art.runeGlyphs(canvas, topFace, alpha: 0.35);
    art.cornerBrackets(canvas, topFace, color: LLColor.ancientGold.withValues(alpha: 0.55), size: s * 0.13);
    art.goldRivets(canvas, topFace, inset: s * 0.04);

    art.bevel(canvas, rect, highlight: false, strength: 0.85);
    art.bevel(canvas, topFace, highlight: true, strength: 0.35);

    final glow = Paint()
      ..color = LLColor.energyCyan.withValues(alpha: 0.06)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);
    canvas.drawRect(topFace.inflate(4), glow);
  }

  void _paintEdgeShadow(Canvas canvas, Size size, {required _EdgeBand band}) {
    final depth = size.shortestSide * 0.14;
    final rect = switch (band) {
      _EdgeBand.north => Rect.fromLTWH(0, 0, size.width, depth),
      _EdgeBand.south => Rect.fromLTWH(0, size.height - depth, size.width, depth),
      _EdgeBand.west => Rect.fromLTWH(0, 0, depth, size.height),
      _EdgeBand.east => Rect.fromLTWH(size.width - depth, 0, depth, size.height),
    };
    final begin = switch (band) {
      _EdgeBand.north => Alignment.topCenter,
      _EdgeBand.south => Alignment.bottomCenter,
      _EdgeBand.west => Alignment.centerLeft,
      _EdgeBand.east => Alignment.centerRight,
    };
    final end = switch (band) {
      _EdgeBand.north => Alignment.bottomCenter,
      _EdgeBand.south => Alignment.topCenter,
      _EdgeBand.west => Alignment.centerRight,
      _EdgeBand.east => Alignment.centerLeft,
    };
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: begin,
          end: end,
          colors: [
            Colors.black.withValues(alpha: 0.45),
            Colors.black.withValues(alpha: 0.0),
          ],
        ).createShader(rect),
    );
  }

  void _paintCornerShadow(
    Canvas canvas,
    Size size, {
    required bool top,
    required bool right,
  }) {
    final depth = size.shortestSide * 0.16;
    final rect = Rect.fromLTWH(
      right ? size.width - depth : 0,
      top ? 0 : size.height - depth,
      depth,
      depth,
    );
    canvas.drawRect(
      rect,
      Paint()
        ..shader = RadialGradient(
          center: top
              ? (right ? Alignment.topRight : Alignment.topLeft)
              : (right ? Alignment.bottomRight : Alignment.bottomLeft),
          radius: 1.0,
          colors: [
            Colors.black.withValues(alpha: 0.5),
            Colors.black.withValues(alpha: 0.0),
          ],
        ).createShader(rect),
    );
  }

  void _paintInnerShadow(
    Canvas canvas,
    Size size, {
    required bool top,
    required bool right,
  }) {
    final t = size.shortestSide * 0.12;
    final cx = right ? size.width - t : t;
    final cy = top ? t : size.height - t;
    final rect = Rect.fromCenter(center: Offset(cx, cy), width: t * 1.8, height: t * 1.8);
    canvas.drawRect(
      rect,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.black.withValues(alpha: 0.35),
            Colors.black.withValues(alpha: 0.0),
          ],
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant ProceduralTilePainter oldDelegate) =>
      oldDelegate.kind != kind;
}

enum _EdgeBand { north, south, east, west }

/// Shared stone texture utilities.
class _StoneArt {
  _StoneArt({required this.size, required this.seed});

  final Size size;
  final int seed;

  double _hash(double x, double y) {
    final n = math.sin(x * 127.1 + y * 311.7 + seed) * 43758.5453;
    return n - n.floor();
  }

  double _noise(double x, double y) {
    final x0 = x.floorToDouble();
    final y0 = y.floorToDouble();
    final fx = x - x0;
    final fy = y - y0;
    final a = _hash(x0, y0);
    final b = _hash(x0 + 1, y0);
    final c = _hash(x0, y0 + 1);
    final d = _hash(x0 + 1, y0 + 1);
    final ux = fx * fx * (3 - 2 * fx);
    final uy = fy * fy * (3 - 2 * fy);
    return ui.lerpDouble(ui.lerpDouble(a, b, ux)!, ui.lerpDouble(c, d, ux)!, uy)!;
  }

  double _fbm(double x, double y, {int octaves = 4}) {
    var value = 0.0;
    var amp = 0.5;
    var freq = 1.0;
    for (var i = 0; i < octaves; i++) {
      value += amp * _noise(x * freq, y * freq);
      amp *= 0.5;
      freq *= 2.1;
    }
    return value;
  }

  void stoneGrain(Canvas canvas, Rect rect, {required double strength}) {
    final step = math.max(2.0, rect.shortestSide / 64);
    final rnd = math.Random(seed);
    for (var y = rect.top; y < rect.bottom; y += step) {
      for (var x = rect.left; x < rect.right; x += step) {
        final n = _fbm(x / 18, y / 18);
        final speck = rnd.nextDouble();
        final alpha = (n * 0.5 + speck * 0.5) * strength;
        if (alpha < 0.04) continue;
        final tone = n > 0.55 ? Colors.white : Colors.black;
        canvas.drawRect(
          Rect.fromLTWH(x, y, step, step),
          Paint()..color = tone.withValues(alpha: alpha.clamp(0.0, 0.25)),
        );
      }
    }
  }

  void cracks(Canvas canvas, Rect rect, {required int count, required double alpha}) {
    final rnd = math.Random(seed + 99);
    for (var i = 0; i < count; i++) {
      final start = Offset(
        rect.left + rnd.nextDouble() * rect.width,
        rect.top + rnd.nextDouble() * rect.height,
      );
      final path = Path()..moveTo(start.dx, start.dy);
      var p = start;
      final segments = 3 + rnd.nextInt(4);
      for (var s = 0; s < segments; s++) {
        p += Offset(
          (rnd.nextDouble() - 0.5) * rect.width * 0.22,
          (rnd.nextDouble() - 0.5) * rect.height * 0.22,
        );
        path.lineTo(p.dx.clamp(rect.left, rect.right), p.dy.clamp(rect.top, rect.bottom));
      }
      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = rect.shortestSide * 0.006
          ..color = Colors.black.withValues(alpha: alpha),
      );
    }
  }

  void cornerBrackets(Canvas canvas, Rect rect, {required Color color, required double size}) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size * 0.12
      ..strokeCap = StrokeCap.round;
    final corners = [
      rect.topLeft,
      Offset(rect.right, rect.top),
      Offset(rect.left, rect.bottom),
      rect.bottomRight,
    ];
    for (final corner in corners) {
      final dx = corner.dx < rect.center.dx ? 1.0 : -1.0;
      final dy = corner.dy < rect.center.dy ? 1.0 : -1.0;
      canvas.drawLine(corner, corner + Offset(dx * size, 0), paint);
      canvas.drawLine(corner, corner + Offset(0, dy * size), paint);
    }
  }

  void mossPatches(Canvas canvas, Rect rect, {required int count, required double alpha}) {
    final rnd = math.Random(seed + 7);
    for (var i = 0; i < count; i++) {
      final c = Offset(
        rect.left + rnd.nextDouble() * rect.width,
        rect.top + rnd.nextDouble() * rect.height,
      );
      canvas.drawCircle(
        c,
        rect.shortestSide * (0.04 + rnd.nextDouble() * 0.05),
        Paint()..color = LLColor.tealDeep.withValues(alpha: alpha),
      );
    }
  }

  void runeGlyphs(Canvas canvas, Rect rect, {required double alpha}) {
    final paint = Paint()
      ..color = LLColor.energyCyan.withValues(alpha: alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = rect.shortestSide * 0.012
      ..strokeCap = StrokeCap.round;
    final positions = [
      Offset(rect.left + rect.width * 0.2, rect.top + rect.height * 0.28),
      Offset(rect.right - rect.width * 0.2, rect.top + rect.height * 0.28),
      Offset(rect.left + rect.width * 0.2, rect.bottom - rect.height * 0.28),
      Offset(rect.right - rect.width * 0.2, rect.bottom - rect.height * 0.28),
    ];
    for (final p in positions) {
      canvas.drawLine(p, p + Offset(rect.shortestSide * 0.06, 0), paint);
      canvas.drawLine(p, p + Offset(0, rect.shortestSide * 0.06), paint);
      canvas.drawCircle(p + Offset(rect.shortestSide * 0.03, rect.shortestSide * 0.03), rect.shortestSide * 0.015, paint);
    }
  }

  void goldRivets(Canvas canvas, Rect rect, {required double inset}) {
    final r = rect.shortestSide * 0.018;
    for (final corner in [
      rect.topLeft + Offset(inset, inset),
      Offset(rect.right - inset, rect.top + inset),
      Offset(rect.left + inset, rect.bottom - inset),
      rect.bottomRight - Offset(inset, inset),
    ]) {
      canvas.drawCircle(
        corner,
        r,
        Paint()
          ..shader = RadialGradient(
            colors: [LLColor.ancientGoldLight, LLColor.ancientGoldDark],
          ).createShader(Rect.fromCircle(center: corner, radius: r)),
      );
    }
  }

  void bevel(Canvas canvas, Rect rect, {required bool highlight, required double strength}) {
    final stroke = math.max(1.0, rect.shortestSide * 0.022 * strength);
    final hi = highlight
        ? Colors.white.withValues(alpha: 0.22 * strength)
        : Colors.black.withValues(alpha: 0.35 * strength);
    final lo = highlight
        ? Colors.black.withValues(alpha: 0.2 * strength)
        : Colors.black.withValues(alpha: 0.65 * strength);
    final hiPaint = Paint()..color = hi..strokeWidth = stroke;
    final loPaint = Paint()..color = lo..strokeWidth = stroke;
    canvas.drawLine(rect.topLeft, rect.topRight, hiPaint);
    canvas.drawLine(rect.topLeft, rect.bottomLeft, hiPaint);
    canvas.drawLine(rect.bottomLeft, rect.bottomRight, loPaint);
    canvas.drawLine(rect.topRight, rect.bottomRight, loPaint);
  }

  void vignette(Canvas canvas, Rect rect, {required double strength}) {
    canvas.drawRect(
      rect,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha: strength),
          ],
          stops: const [0.55, 1.0],
        ).createShader(rect),
    );
  }
}

/// In-maze and HUD sprites — tight to canvas for correct in-game scale.
class ProceduralSpritePainter extends CustomPainter {
  const ProceduralSpritePainter(this.kind);

  final ProceduralSpriteKind kind;

  @override
  void paint(Canvas canvas, Size size) {
    switch (kind) {
      case ProceduralSpriteKind.explorer:
        _paintExplorer(canvas, size);
      case ProceduralSpriteKind.key:
        _paintKey(canvas, size);
      case ProceduralSpriteKind.lockClosed:
        _paintLock(canvas, size);
      case ProceduralSpriteKind.hudBack:
        _paintBack(canvas, size);
      case ProceduralSpriteKind.hudSettings:
        _paintSettings(canvas, size);
    }
  }

  void _paintExplorer(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final s = size.shortestSide;

    final glow = Paint()
      ..color = LLColor.energyCyan.withValues(alpha: 0.28)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.08);
    canvas.drawCircle(c, s * 0.28, glow);

    final body = RRect.fromRectAndRadius(
      Rect.fromCenter(center: c.translate(0, s * 0.04), width: s * 0.34, height: s * 0.42),
      Radius.circular(s * 0.08),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [LLColor.ancientGoldLight, LLColor.ancientGold, LLColor.ancientGoldDark],
        ).createShader(body.outerRect),
    );

    final helm = Rect.fromCenter(
      center: c.translate(0, -s * 0.18),
      width: s * 0.3,
      height: s * 0.22,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(helm, Radius.circular(s * 0.1)),
      Paint()
        ..shader = LinearGradient(
          colors: [LLColor.ancientGoldLight, LLColor.bronzeRust],
        ).createShader(helm),
    );

    canvas.drawCircle(
      c.translate(0, -s * 0.16),
      s * 0.045,
      Paint()..color = LLColor.energyCyan,
    );
    canvas.drawCircle(
      c.translate(0, -s * 0.16),
      s * 0.025,
      Paint()..color = Colors.white.withValues(alpha: 0.9),
    );

    final cape = Path()
      ..moveTo(c.dx - s * 0.12, c.dy - s * 0.02)
      ..quadraticBezierTo(c.dx - s * 0.2, c.dy + s * 0.18, c.dx - s * 0.08, c.dy + s * 0.22)
      ..lineTo(c.dx + s * 0.08, c.dy + s * 0.22)
      ..quadraticBezierTo(c.dx + s * 0.2, c.dy + s * 0.18, c.dx + s * 0.12, c.dy - s * 0.02)
      ..close();
    canvas.drawPath(
      cape,
      Paint()..color = LLColor.tealDeep.withValues(alpha: 0.85),
    );
  }

  void _paintKey(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final bowCenter = Offset(size.width * 0.36, size.height * 0.5);
    final bowR = s * 0.18;

    canvas.drawCircle(
      bowCenter,
      bowR * 1.15,
      Paint()
        ..color = LLColor.ancientGold.withValues(alpha: 0.25)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6),
    );

    canvas.drawCircle(
      bowCenter,
      bowR,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = bowR * 0.42
        ..color = LLColor.ancientGold,
    );
    canvas.drawCircle(
      bowCenter,
      bowR * 0.55,
      Paint()
        ..shader = RadialGradient(
          colors: [LLColor.ancientGoldLight, LLColor.ancientGoldDark],
        ).createShader(Rect.fromCircle(center: bowCenter, radius: bowR)),
    );

    for (var i = 0; i < 4; i++) {
      final angle = i * math.pi / 2 + math.pi / 4;
      canvas.drawLine(
        bowCenter,
        bowCenter + Offset(math.cos(angle) * bowR * 0.7, math.sin(angle) * bowR * 0.7),
        Paint()
          ..color = LLColor.ancientGoldDark
          ..strokeWidth = s * 0.02,
      );
    }

    final shaft = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(size.width * 0.62, size.height * 0.5), width: s * 0.38, height: s * 0.09),
      Radius.circular(s * 0.045),
    );
    canvas.drawRRect(
      shaft,
      Paint()
        ..shader = LinearGradient(
          colors: [LLColor.ancientGoldLight, LLColor.ancientGold, LLColor.ancientGoldDark],
        ).createShader(shaft.outerRect),
    );

    for (var i = 0; i < 2; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            shaft.right - s * 0.1,
            size.height * 0.5 + (i == 0 ? -s * 0.11 : s * 0.02),
            s * 0.08,
            s * 0.08,
          ),
          Radius.circular(s * 0.02),
        ),
        Paint()..color = LLColor.ancientGoldDark,
      );
    }
  }

  void _paintLock(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final body = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.58), width: s * 0.46, height: s * 0.36),
      Radius.circular(s * 0.05),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [LLColor.bronzeRust, LLColor.oxidizedBronze, const Color(0xFF2A1E12)],
        ).createShader(body.outerRect),
    );

    final shackle = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.32), width: s * 0.3, height: s * 0.26),
      Radius.circular(s * 0.1),
    );
    canvas.drawRRect(
      shackle,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.07
        ..color = LLColor.ancientGold,
    );

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.58),
      s * 0.045,
      Paint()..color = LLColor.ancientGold,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.62), width: s * 0.06, height: s * 0.1),
        Radius.circular(s * 0.02),
      ),
      Paint()..color = LLColor.templeBlack.withValues(alpha: 0.6),
    );
  }

  void _paintBack(Canvas canvas, Size size) {
    final pad = size.shortestSide * 0.2;
    final path = Path()
      ..moveTo(size.width * 0.6, pad)
      ..lineTo(size.width * 0.32, size.height * 0.5)
      ..lineTo(size.width * 0.6, size.height - pad)
      ..close();
    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          colors: [LLColor.ancientGoldLight, LLColor.ancientGold, LLColor.ancientGoldDark],
        ).createShader(path.getBounds()),
    );
  }

  void _paintSettings(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final outerR = size.shortestSide * 0.28;
    final innerR = outerR * 0.38;

    for (var i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;
      final tooth = Offset(c.dx + math.cos(angle) * outerR * 1.08, c.dy + math.sin(angle) * outerR * 1.08);
      canvas.drawCircle(
        tooth,
        outerR * 0.13,
        Paint()..color = LLColor.ancientGold,
      );
    }

    canvas.drawCircle(
      c,
      outerR,
      Paint()
        ..shader = RadialGradient(
          colors: [LLColor.ancientGoldLight, LLColor.ancientGoldDark],
        ).createShader(Rect.fromCircle(center: c, radius: outerR)),
    );
    canvas.drawCircle(c, innerR, Paint()..color = const Color(0xFF1A1F2B));
    canvas.drawCircle(
      c,
      innerR * 0.35,
      Paint()..color = LLColor.ancientGold.withValues(alpha: 0.5),
    );
  }

  @override
  bool shouldRepaint(covariant ProceduralSpritePainter oldDelegate) =>
      oldDelegate.kind != kind;
}
