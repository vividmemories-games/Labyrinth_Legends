import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/maze_theme.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/wall_edge_builder.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/wall_shape_builder.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// How wall cells are turned into geometry.
enum MazeWallStyle {
  /// Full-cell extruded blocks (hedge/fortress look).
  block,

  /// Raised edges on tile boundaries: an edge is drawn wherever a walkable
  /// tile borders a wall cell, so walls sit on the sides of tiles instead
  /// of occupying tiles (ancient-ruins look, per design reference).
  edge,
}

/// Renders a [MazeGrid] as one merged vector shape with a themed skin.
///
/// Rendering passes:
///  1. background gradient
///  2. floor fill (+ optional seamless texture, + procedural speckles)
///  3. wall drop shadow (merged path, offset + blurred)
///  4. wall side face (merged path offset down — fake 3D extrusion)
///  5. wall top face (+ optional seamless texture)
///  6. wall rim highlight (raised edge)
///  7. start / exit / gem markers
///
/// Because walls are a single `Path` built from neighbor-aware rounded
/// rects, there are no per-tile seams and no PNG tileset — themes only swap
/// colors and textures (see [MazeTheme]).
class MazePainter extends CustomPainter {
  MazePainter({
    required this.grid,
    required this.theme,
    this.textures = MazeThemeTextures.none,
    this.showTextures = true,
    this.wallStyle = MazeWallStyle.edge,
  })  : _geometries = WallShapeBuilder.build(grid),
        _edges = WallEdgeBuilder.build(grid);

  final MazeGrid grid;
  final MazeTheme theme;
  final MazeThemeTextures textures;
  final bool showTextures;
  final MazeWallStyle wallStyle;

  final List<WallCellGeometry> _geometries;
  final List<MazeEdge> _edges;

  static const double _cornerRadiusFactor = 0.30;
  static const double _blockExtrusionFactor = 0.14;
  static const double _edgeExtrusionFactor = 0.07;

  /// Raised edge thickness as a fraction of the cell.
  static const double _edgeThicknessFactor = 0.16;

  @override
  void paint(Canvas canvas, Size size) {
    final cell = size.width / grid.width;
    final boardRect = Offset.zero & size;
    final isEdge = wallStyle == MazeWallStyle.edge;
    final depth =
        cell * (isEdge ? _edgeExtrusionFactor : _blockExtrusionFactor);

    _paintBackground(canvas, boardRect);
    _paintFloor(canvas, boardRect, cell);
    if (isEdge) {
      _paintDeadRegions(canvas, cell);
    }

    final wallPath = isEdge ? _buildEdgePath(cell) : _buildBlockPath(cell);

    _paintWallShadow(canvas, wallPath, depth);
    _paintWallSide(canvas, wallPath, depth);
    _paintWallTop(canvas, wallPath, boardRect);
    _paintWallRim(canvas, wallPath, cell);
    _paintMarkers(canvas, cell);
  }

  /// In edge mode wall cells are ordinary floor, just fenced off. A subtle
  /// darkening keeps the playable corridors readable (and marks where
  /// decoration props like statues would sit).
  void _paintDeadRegions(Canvas canvas, double cell) {
    final paint = Paint()..color = Colors.black.withValues(alpha: 0.18);
    for (final g in _geometries) {
      canvas.drawRect(
        Rect.fromLTWH(g.col * cell, g.row * cell, cell, cell),
        paint,
      );
    }
  }

  void _paintBackground(Canvas canvas, Rect rect) {
    canvas.drawRect(
      rect,
      Paint()
        ..shader = ui.Gradient.linear(
          rect.topCenter,
          rect.bottomCenter,
          [theme.backgroundTop, theme.backgroundBottom],
        ),
    );
  }

  void _paintFloor(Canvas canvas, Rect boardRect, double cell) {
    canvas.drawRect(boardRect, Paint()..color = theme.floorBase);

    final floorTexture = textures.floor;
    if (showTextures && floorTexture != null) {
      _drawTexture(
        canvas,
        boardRect,
        floorTexture,
        cell,
        theme.floorTextureOpacity,
      );
    }

    // Per-tile brightness variation: hand-laid stone slabs, not a uniform
    // surface. Deterministic per cell so it is stable across frames.
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final hash = _hash(row * 7 + 3, col * 13 + 5);
        final delta = ((hash & 0xFF) / 255.0 - 0.5) * 0.10;
        final tile = Rect.fromLTWH(col * cell, row * cell, cell, cell);
        canvas.drawRect(
          tile,
          Paint()
            ..color = delta >= 0
                ? Colors.white.withValues(alpha: delta)
                : Colors.black.withValues(alpha: -delta),
        );
      }
    }

    // Grout lines between tiles.
    final groutPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.30)
      ..strokeWidth = cell * 0.022;
    for (var col = 1; col < grid.width; col++) {
      canvas.drawLine(
        Offset(col * cell, 0),
        Offset(col * cell, boardRect.height),
        groutPaint,
      );
    }
    for (var row = 1; row < grid.height; row++) {
      canvas.drawLine(
        Offset(0, row * cell),
        Offset(boardRect.width, row * cell),
        groutPaint,
      );
    }

    // Deterministic speckle noise keeps floors alive when no texture asset
    // is present (and adds grain on top of textures).
    final specklePaint =
        Paint()..color = theme.floorSpeckle.withValues(alpha: 0.5);
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        for (var i = 0; i < 3; i++) {
          final hash = _hash(row * 31 + i, col * 17 + i);
          final dx = (hash & 0xFF) / 255.0;
          final dy = ((hash >> 8) & 0xFF) / 255.0;
          final radius = 0.02 + ((hash >> 16) & 0x7) / 7.0 * 0.03;
          canvas.drawCircle(
            Offset((col + dx) * cell, (row + dy) * cell),
            radius * cell,
            specklePaint,
          );
        }
      }
    }

    // Soft vignette so the arena feels lit from the center.
    canvas.drawRect(
      boardRect,
      Paint()
        ..shader = ui.Gradient.radial(
          boardRect.center,
          boardRect.longestSide * 0.75,
          [
            Colors.transparent,
            theme.backgroundBottom.withValues(alpha: 0.35),
          ],
        ),
    );
  }

  Path _buildBlockPath(double cell) {
    final radius = Radius.circular(cell * _cornerRadiusFactor);
    var merged = Path();
    for (final g in _geometries) {
      final rect = Rect.fromLTWH(g.col * cell, g.row * cell, cell, cell);
      final rrect = RRect.fromRectAndCorners(
        rect,
        topLeft: g.roundNorthWest ? radius : Radius.zero,
        topRight: g.roundNorthEast ? radius : Radius.zero,
        bottomRight: g.roundSouthEast ? radius : Radius.zero,
        bottomLeft: g.roundSouthWest ? radius : Radius.zero,
      );
      merged = Path.combine(
        PathOperation.union,
        merged,
        Path()..addRRect(rrect),
      );
    }
    return merged;
  }

  /// Raised edges on tile boundaries. Each edge is a thin bar centered on
  /// the shared border between two cells, extended half a thickness past
  /// both ends so meeting edges fuse into clean corners and junctions.
  Path _buildEdgePath(double cell) {
    final t = cell * _edgeThicknessFactor;
    var merged = Path();

    for (final e in _edges) {
      final Rect rect;
      if (e.isVertical) {
        final x = (e.col + 1) * cell;
        final y = e.row * cell;
        rect = Rect.fromLTRB(x - t / 2, y - t / 2, x + t / 2, y + cell + t / 2);
      } else {
        final x = e.col * cell;
        final y = (e.row + 1) * cell;
        rect = Rect.fromLTRB(x - t / 2, y - t / 2, x + cell + t / 2, y + t / 2);
      }
      merged = Path.combine(
        PathOperation.union,
        merged,
        Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(t / 4))),
      );
    }
    return merged;
  }

  void _paintWallShadow(Canvas canvas, Path wallPath, double depth) {
    canvas.drawPath(
      wallPath.shift(Offset(0, depth * 1.8)),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.45)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, depth),
    );
  }

  void _paintWallSide(Canvas canvas, Path wallPath, double depth) {
    canvas.drawPath(
      wallPath.shift(Offset(0, depth)),
      Paint()..color = theme.wallSide,
    );
  }

  void _paintWallTop(Canvas canvas, Path wallPath, Rect boardRect) {
    canvas.drawPath(wallPath, Paint()..color = theme.wallTop);

    final wallTexture = textures.wall;
    if (showTextures && wallTexture != null) {
      canvas.save();
      canvas.clipPath(wallPath);
      _drawTexture(
        canvas,
        boardRect,
        wallTexture,
        boardRect.width / grid.width,
        theme.wallTextureOpacity,
      );
      canvas.restore();
    }

    // Subtle top-down shading on the top face for depth.
    canvas.save();
    canvas.clipPath(wallPath);
    canvas.drawRect(
      boardRect,
      Paint()
        ..shader = ui.Gradient.linear(
          boardRect.topCenter,
          boardRect.bottomCenter,
          [
            Colors.white.withValues(alpha: 0.10),
            Colors.black.withValues(alpha: 0.18),
          ],
        ),
    );
    canvas.restore();
  }

  void _paintWallRim(Canvas canvas, Path wallPath, double cell) {
    canvas.drawPath(
      wallPath,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = cell * 0.035
        ..color = theme.wallEdgeHighlight.withValues(alpha: 0.8),
    );
  }

  void _paintMarkers(Canvas canvas, double cell) {
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final mazeCell = grid.cells[row][col];
        final center = Offset((col + 0.5) * cell, (row + 0.5) * cell);
        switch (mazeCell.type) {
          case CellType.start:
            canvas.drawCircle(
              center,
              cell * 0.26,
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = cell * 0.06
                ..color = theme.accent,
            );
          case CellType.exit:
            canvas.drawCircle(
              center,
              cell * 0.30,
              Paint()
                ..shader = ui.Gradient.radial(
                  center,
                  cell * 0.30,
                  [theme.accent, theme.accent.withValues(alpha: 0.0)],
                ),
            );
            canvas.drawCircle(
              center,
              cell * 0.16,
              Paint()..color = theme.accent,
            );
          case CellType.wall:
          case CellType.floor:
            break;
        }
        if (mazeCell.hasGem) {
          final r = cell * 0.16;
          final diamond = Path()
            ..moveTo(center.dx, center.dy - r)
            ..lineTo(center.dx + r, center.dy)
            ..lineTo(center.dx, center.dy + r)
            ..lineTo(center.dx - r, center.dy)
            ..close();
          canvas.drawPath(diamond, Paint()..color = theme.accent);
        }
      }
    }
  }

  void _drawTexture(
    Canvas canvas,
    Rect rect,
    ui.Image image,
    double cell,
    double opacity,
  ) {
    // Scale the texture so one image spans roughly three cells; mirror
    // tiling guarantees edge continuity even for imperfectly seamless art.
    final scale = (cell * 3) / image.width;
    final matrix = Matrix4.diagonal3Values(scale, scale, 1).storage;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = ui.ImageShader(
          image,
          TileMode.mirror,
          TileMode.mirror,
          matrix,
        )
        ..blendMode = BlendMode.multiply
        ..color = Colors.white.withValues(alpha: opacity),
    );
  }

  static int _hash(int a, int b) {
    var h = a * 73856093 ^ b * 19349663;
    h = (h ^ (h >> 13)) * 0x5bd1e995;
    return (h ^ (h >> 15)) & 0x7FFFFFFF;
  }

  @override
  bool shouldRepaint(MazePainter oldDelegate) {
    return oldDelegate.grid != grid ||
        oldDelegate.theme != theme ||
        oldDelegate.textures != textures ||
        oldDelegate.showTextures != showTextures ||
        oldDelegate.wallStyle != wallStyle;
  }
}
