import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/floor_tile_layout.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/maze_theme.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/wall_edge_builder.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/wall_shape_builder.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
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
    this.paintCellMarkers = false,
    this.floorLayout,
  })  : _geometries = WallShapeBuilder.build(grid),
        _edges = WallEdgeBuilder.build(grid);

  final MazeGrid grid;
  final MazeTheme theme;
  final MazeThemeTextures textures;
  final bool showTextures;
  final MazeWallStyle wallStyle;

  /// When false, start/exit/gem markers are omitted so [CellOverlay] sprites
  /// can render collectibles and portals on the gameplay board.
  final bool paintCellMarkers;

  /// Per-attempt floor slab variant + rotation assignments.
  final FloorTileLayout? floorLayout;

  final List<WallCellGeometry> _geometries;
  final List<MazeEdge> _edges;

  static const double _cornerRadiusFactor = 0.30;
  static const double _blockExtrusionFactor = 0.14;
  static const double _edgeExtrusionFactor = 0.08;

  /// Raised edge thickness as a fraction of the cell.
  static const double _edgeThicknessFactor = 0.18;

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
      _paintStoneWalls(canvas, boardRect, cell, depth);
    } else {
      final wallPath = _buildBlockPath(cell);
      _paintWallShadow(canvas, wallPath, depth);
      _paintWallSide(canvas, wallPath, depth);
      _paintWallTop(canvas, wallPath, boardRect);
      _paintWallRim(canvas, wallPath, cell);
    }
    if (paintCellMarkers) {
      _paintMarkers(canvas, cell);
    }
  }

  // --- Stone-wall rendering (edge style) ------------------------------

  /// Walls are laid as individual stone blocks along each tile boundary,
  /// with deterministic jitter in length, thickness, and offset, plus
  /// occasional damaged (crumbled) stones — old, rugged masonry instead of
  /// a clean vector bar. Texture is applied near-full-strength so the PNG
  /// carries the surface detail; the geometry carries the brokenness.
  void _paintStoneWalls(
    Canvas canvas,
    Rect boardRect,
    double cell,
    double depth,
  ) {
    final stones = _buildStones(cell);

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.40)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, depth * 0.9);
    for (final s in stones) {
      canvas.drawRRect(s.rrect.shift(Offset(0, depth * 1.6)), shadowPaint);
    }

    for (final s in stones) {
      final sideDepth = s.damaged ? depth * 0.45 : depth;
      canvas.drawRRect(
        s.rrect.shift(Offset(0, sideDepth)),
        Paint()..color = theme.wallSide,
      );
    }

    for (final s in stones) {
      canvas.drawRRect(s.rrect, Paint()..color = theme.wallTop);
    }

    final floorTile = textures.floorTile;
    final wallTexture = textures.wall;
    if (showTextures && _hasPlacedFloorTiles()) {
      for (final s in stones) {
        final placement = floorLayout?.placementForEdge(s.edge, grid);
        final image = _imageForPlacement(placement);
        if (image == null) {
          continue;
        }
        canvas.save();
        canvas.clipRRect(s.rrect);
        _drawPlacedFloorTile(
          canvas,
          slabRect: s.rrect,
          image: image,
          quarterTurns: placement?.quarterTurns ?? 0,
        );
        canvas.drawRect(
          s.rrect.outerRect,
          Paint()
            ..color = theme.wallSide.withValues(alpha: 0.16)
            ..blendMode = BlendMode.multiply,
        );
        canvas.restore();
      }
    } else if (showTextures && floorTile != null) {
      final src = Rect.fromLTWH(
        0,
        0,
        floorTile.width.toDouble(),
        floorTile.height.toDouble(),
      );
      for (final s in stones) {
        canvas.save();
        canvas.clipRRect(s.rrect);
        canvas.drawImageRect(
          floorTile,
          src,
          s.rrect.outerRect,
          Paint()..filterQuality = FilterQuality.medium,
        );
        canvas.drawRect(
          s.rrect.outerRect,
          Paint()
            ..color = theme.wallSide.withValues(alpha: 0.16)
            ..blendMode = BlendMode.multiply,
        );
        canvas.restore();
      }
    } else if (showTextures && wallTexture != null) {
      var union = Path();
      for (final s in stones) {
        union = Path.combine(
          PathOperation.union,
          union,
          Path()..addRRect(s.rrect),
        );
      }
      canvas.save();
      canvas.clipPath(union);
      _paintStoneTexture(
        canvas,
        shaderRect: boardRect,
        cell: cell,
        texture: wallTexture,
        tint: theme.wallTop,
      );
      canvas.restore();
    }

    // Per-stone definition: dark outline (mortar), light catch on top edge,
    // extra darkening on damaged stones.
    final outlinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = cell * 0.014
      ..color = Colors.black.withValues(alpha: 0.35);
    final highlightPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = cell * 0.012
      ..color = theme.wallEdgeHighlight.withValues(alpha: 0.55);
    for (final s in stones) {
      canvas.drawRRect(s.rrect, outlinePaint);
      final r = s.rrect.outerRect;
      canvas.drawLine(
        Offset(r.left + r.width * 0.12, r.top),
        Offset(r.right - r.width * 0.12, r.top),
        highlightPaint,
      );
      if (s.damaged) {
        canvas.drawRRect(
          s.rrect,
          Paint()..color = Colors.black.withValues(alpha: 0.22),
        );
      }
    }
  }

  /// Splits every boundary edge into 2-3 jittered stone blocks.
  List<_Stone> _buildStones(double cell) {
    final t = cell * _edgeThicknessFactor;
    final stones = <_Stone>[];

    for (final e in _edges) {
      final seedA = e.row * 31 + (e.isVertical ? 17 : 0);
      final seedB = e.col * 13 + 5;
      final h0 = _hash(seedA, seedB);
      final count = 2 + (h0 % 2);

      // The edge spans one cell plus half a thickness overhang on both
      // ends so perpendicular walls meet in covered corners.
      final start = -t / 2;
      final length = cell + t;
      final gap = t * 0.14;

      for (var i = 0; i < count; i++) {
        final h = _hash(h0 + i * 97, seedB + i * 61);
        final r1 = (h & 0xFF) / 255.0;
        final r2 = ((h >> 8) & 0xFF) / 255.0;
        final r3 = ((h >> 16) & 0xFF) / 255.0;

        final s0 = start + length * i / count + (i == 0 ? 0 : gap / 2);
        final s1 = start + length * (i + 1) / count - gap / 2;
        final thickness = t * (0.82 + 0.36 * r1);
        final offset = t * 0.22 * (r2 - 0.5);
        final damaged = (h % 100) < 12;
        // Damaged stones lose a chunk of their length — always from their
        // interior end so wall corners and junctions stay closed.
        var sStart = s0;
        var sEnd = s1;
        if (damaged) {
          final bite = (s1 - s0) * 0.28 * r3;
          if (i == count - 1) {
            sStart += bite;
          } else {
            sEnd -= bite;
          }
        }

        final Rect rect;
        if (e.isVertical) {
          final x = (e.col + 1) * cell + offset;
          rect = Rect.fromLTRB(
            x - thickness / 2,
            e.row * cell + sStart,
            x + thickness / 2,
            e.row * cell + sEnd,
          );
        } else {
          final y = (e.row + 1) * cell + offset;
          rect = Rect.fromLTRB(
            e.col * cell + sStart,
            y - thickness / 2,
            e.col * cell + sEnd,
            y + thickness / 2,
          );
        }
        stones.add(
          _Stone(
            edge: e,
            rrect: RRect.fromRectAndRadius(
              rect,
              Radius.circular(t * 0.22),
            ),
            damaged: damaged,
          ),
        );
      }
    }
    return stones;
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
    final wallTexture = textures.wall;
    final slabRadius = Radius.circular(cell * 0.06);

    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final mazeCell = grid.cells[row][col];
        if (mazeCell.type == CellType.wall) {
          continue;
        }

        final tileRect = Rect.fromLTWH(col * cell, row * cell, cell, cell);
        final slabRect = RRect.fromRectAndRadius(
          tileRect.deflate(cell * 0.015),
          slabRadius,
        );
        final position = GridPosition(row: row, col: col);
        final placement = floorLayout?.placementAt(position);

        _paintSlabDropShadow(canvas, slabRect, cell);

        canvas.drawRRect(slabRect, Paint()..color = theme.floorBase);

        if (showTextures && _hasPlacedFloorTiles()) {
          final image = _imageForPlacement(placement);
          if (image != null) {
            canvas.save();
            canvas.clipRRect(slabRect);
            _drawPlacedFloorTile(
              canvas,
              slabRect: slabRect,
              image: image,
              quarterTurns: placement?.quarterTurns ?? 0,
            );
            final hash = _hash(row * 7 + 3, col * 13 + 5);
            final shade = ((hash & 0xFF) / 255.0 - 0.5) * 0.04;
            canvas.drawRect(
              slabRect.outerRect,
              Paint()
                ..color = shade >= 0
                    ? Colors.white.withValues(alpha: shade)
                    : Colors.black.withValues(alpha: -shade),
            );
            canvas.restore();
          }
        } else if (showTextures && textures.floorTile != null) {
          final floorTile = textures.floorTile!;
          canvas.save();
          canvas.clipRRect(slabRect);
          _drawPlacedFloorTile(
            canvas,
            slabRect: slabRect,
            image: floorTile,
            quarterTurns: 0,
          );
          canvas.restore();
        } else if (showTextures && wallTexture != null) {
          canvas.save();
          canvas.clipRRect(slabRect);
          _paintStoneTexture(
            canvas,
            shaderRect: boardRect,
            cell: cell,
            texture: wallTexture,
            tint: theme.wallTop,
          );
          canvas.restore();
        }

        _paintSlabSurfaceLighting(
          canvas,
          slabRect: slabRect,
          cell: cell,
          row: row,
          col: col,
        );

        _paintSlabEdgeStroke(canvas, slabRect, cell);
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
            theme.backgroundBottom.withValues(alpha: 0.28),
          ],
        ),
    );
  }

  void _paintSlabDropShadow(Canvas canvas, RRect slabRect, double cell) {
    canvas.drawRRect(
      slabRect.shift(Offset(0, cell * 0.024)),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.24)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, cell * 0.038),
    );
  }

  void _paintSlabSurfaceLighting(
    Canvas canvas, {
    required RRect slabRect,
    required double cell,
    required int row,
    required int col,
  }) {
    final r = slabRect.outerRect;
    final position = GridPosition(row: row, col: col);
    final edges = grid.resolvedEdgesAt(position);

    canvas.drawRect(
      r,
      Paint()
        ..shader = ui.Gradient.linear(
          r.topLeft,
          r.bottomRight,
          [
            Colors.white.withValues(alpha: 0.13),
            Colors.transparent,
            Colors.black.withValues(alpha: 0.11),
          ],
          [0.0, 0.42, 1.0],
        )
        ..blendMode = BlendMode.softLight,
    );

    final highlightPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = cell * 0.010
      ..color = theme.wallEdgeHighlight.withValues(alpha: 0.38);
    canvas.drawLine(
      Offset(r.left + r.width * 0.08, r.top),
      Offset(r.right - r.width * 0.08, r.top),
      highlightPaint,
    );
    canvas.drawLine(
      Offset(r.left, r.top + r.height * 0.08),
      Offset(r.left, r.bottom - r.height * 0.08),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = cell * 0.008
        ..color = theme.wallEdgeHighlight.withValues(alpha: 0.22),
    );

    final aoPaint = Paint()
      ..shader = ui.Gradient.linear(
        r.bottomRight,
        r.topLeft,
        [
          Colors.black.withValues(alpha: 0.16),
          Colors.transparent,
        ],
      );
    canvas.drawRect(r, aoPaint);

    if (edges.north) {
      _paintEdgeContactShadow(canvas, r, cell, isHorizontal: true, fromStart: true);
    }
    if (edges.south) {
      _paintEdgeContactShadow(canvas, r, cell, isHorizontal: true, fromStart: false);
    }
    if (edges.west) {
      _paintEdgeContactShadow(canvas, r, cell, isHorizontal: false, fromStart: true);
    }
    if (edges.east) {
      _paintEdgeContactShadow(canvas, r, cell, isHorizontal: false, fromStart: false);
    }
  }

  void _paintEdgeContactShadow(
    Canvas canvas,
    Rect tileRect,
    double cell, {
    required bool isHorizontal,
    required bool fromStart,
  }) {
    final depth = cell * 0.24;
    final Rect band;
    if (isHorizontal) {
      band = fromStart
          ? Rect.fromLTWH(tileRect.left, tileRect.top, tileRect.width, depth)
          : Rect.fromLTWH(
              tileRect.left,
              tileRect.bottom - depth,
              tileRect.width,
              depth,
            );
    } else {
      band = fromStart
          ? Rect.fromLTWH(tileRect.left, tileRect.top, depth, tileRect.height)
          : Rect.fromLTWH(
              tileRect.right - depth,
              tileRect.top,
              depth,
              tileRect.height,
            );
    }

    final start = fromStart
        ? (isHorizontal ? band.topCenter : band.centerLeft)
        : (isHorizontal ? band.bottomCenter : band.centerRight);
    final end = fromStart
        ? (isHorizontal ? band.bottomCenter : band.centerRight)
        : (isHorizontal ? band.topCenter : band.centerLeft);

    canvas.drawRect(
      band,
      Paint()
        ..shader = ui.Gradient.linear(
          start,
          end,
          [
            Colors.black.withValues(alpha: 0.26),
            Colors.transparent,
          ],
        ),
    );
  }

  void _paintSlabEdgeStroke(Canvas canvas, RRect slabRect, double cell) {
    final r = slabRect.outerRect;
    canvas.drawRRect(
      slabRect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = cell * 0.010
        ..color = Colors.black.withValues(alpha: 0.16),
    );
    canvas.drawLine(
      Offset(r.left + r.width * 0.06, r.bottom),
      Offset(r.right - r.width * 0.06, r.bottom),
      Paint()
        ..strokeWidth = cell * 0.008
        ..color = Colors.black.withValues(alpha: 0.22),
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
      _paintStoneTexture(
        canvas,
        shaderRect: boardRect,
        cell: boardRect.width / grid.width,
        texture: wallTexture,
        tint: theme.wallTop,
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

  bool _hasPlacedFloorTiles() {
    return floorLayout != null &&
        (textures.floorTileVariants.isNotEmpty || textures.floorTile != null);
  }

  ui.Image? _imageForPlacement(FloorTilePlacement? placement) {
    if (placement != null &&
        placement.variantIndex >= 0 &&
        placement.variantIndex < textures.floorTileVariants.length) {
      return textures.floorTileVariants[placement.variantIndex];
    }
    return textures.floorTile;
  }

  void _drawPlacedFloorTile(
    Canvas canvas, {
    required RRect slabRect,
    required ui.Image image,
    required int quarterTurns,
  }) {
    final src = Rect.fromLTWH(
      0,
      0,
      image.width.toDouble(),
      image.height.toDouble(),
    );
    final center = slabRect.outerRect.center;
    final side = math.max(slabRect.outerRect.width, slabRect.outerRect.height);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(quarterTurns * math.pi / 2);
    canvas.drawImageRect(
      image,
      src,
      Rect.fromCenter(center: Offset.zero, width: side, height: side),
      Paint()..filterQuality = FilterQuality.medium,
    );
    canvas.restore();
  }

  /// Shared stone-surface texture pass — used for wall blocks and floor slabs.
  void _paintStoneTexture(
    Canvas canvas, {
    required Rect shaderRect,
    required double cell,
    required ui.Image texture,
    required Color tint,
  }) {
    final scale = (cell * 2.2) / texture.width;
    final matrix = Matrix4.diagonal3Values(scale, scale, 1).storage;
    canvas.drawRect(
      shaderRect,
      Paint()
        ..shader = ui.ImageShader(
          texture,
          TileMode.mirror,
          TileMode.mirror,
          matrix,
        )
        ..color = Colors.white.withValues(alpha: theme.wallTextureOpacity),
    );
    canvas.drawRect(
      shaderRect,
      Paint()
        ..color = tint.withValues(alpha: 0.30)
        ..blendMode = BlendMode.multiply,
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
        oldDelegate.wallStyle != wallStyle ||
        oldDelegate.paintCellMarkers != paintCellMarkers ||
        oldDelegate.floorLayout != floorLayout;
  }
}

class _Stone {
  const _Stone({
    required this.edge,
    required this.rrect,
    required this.damaged,
  });

  final MazeEdge edge;
  final RRect rrect;
  final bool damaged;
}
