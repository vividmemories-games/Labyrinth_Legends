import 'dart:async';

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/board/board_geometry.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/floor_tile_layout.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/maze_painter.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/maze_texture_loader.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/maze_theme.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/cell_overlay.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/explorer_marker.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/path_overlay.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Production maze board renderer with code-drawn maze skin and path overlays.
class BoardRenderer extends StatefulWidget {
  const BoardRenderer({
    super.key,
    required this.grid,
    required this.visualPath,
    required this.onTileInteraction,
    this.explorerPosition,
    this.selectedTile,
    this.invalidTarget,
    this.traversedPathPositions = const {},
    this.isExecuting = false,
    this.showDebugGrid = false,
    this.enabled = true,
    this.effectiveKeyIds = const {},
    this.mazeTheme = MazeTheme.ancientRuins,
    this.floorLayoutSeed = 0,
  });

  final MazeGrid grid;
  final List<GridPosition> visualPath;
  final ValueChanged<GridPosition> onTileInteraction;
  final GridPosition? explorerPosition;
  final GridPosition? selectedTile;
  final GridPosition? invalidTarget;
  final Set<GridPosition> traversedPathPositions;
  final bool isExecuting;
  final bool showDebugGrid;
  final bool enabled;
  final Set<String> effectiveKeyIds;
  final MazeTheme mazeTheme;
  final int floorLayoutSeed;

  @override
  State<BoardRenderer> createState() => _BoardRendererState();
}

class _BoardRendererState extends State<BoardRenderer> {
  static const double _cameraTiltRadians = 0.11;
  static const double _cameraPerspective = 0.00085;

  GridPosition? _lastDragTile;
  GridPosition? _pressedTile;
  Timer? _pressTimer;
  MazeThemeTextures _textures = MazeThemeTextures.none;
  FloorTileLayout? _floorLayout;

  @override
  void initState() {
    super.initState();
    _loadTextures();
    _rebuildFloorLayout();
  }

  @override
  void didUpdateWidget(covariant BoardRenderer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visualPath.length < oldWidget.visualPath.length) {
      _lastDragTile = widget.visualPath.isEmpty ? null : widget.visualPath.last;
    }
    if (oldWidget.mazeTheme.id != widget.mazeTheme.id) {
      _loadTextures();
    }
    if (oldWidget.floorLayoutSeed != widget.floorLayoutSeed ||
        oldWidget.grid != widget.grid) {
      _rebuildFloorLayout();
    }
  }

  void _rebuildFloorLayout() {
    _floorLayout = FloorTileLayout.forGrid(
      widget.grid,
      seed: widget.floorLayoutSeed,
      variantCount: _textures.floorTileVariants.length,
    );
  }

  @override
  void dispose() {
    _pressTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadTextures() async {
    final theme = widget.mazeTheme;
    final textures = await MazeTextureLoader.load(theme);
    if (!mounted || widget.mazeTheme.id != theme.id) {
      return;
    }
    setState(() {
      _textures = textures;
      _rebuildFloorLayout();
    });
  }

  void _flashPress(GridPosition tile) {
    _pressTimer?.cancel();
    setState(() => _pressedTile = tile);
    _pressTimer = Timer(const Duration(milliseconds: 140), () {
      if (mounted) {
        setState(() => _pressedTile = null);
      }
    });
  }

  void _handlePosition(Offset local, BoardGeometry geometry) {
    if (!widget.enabled) return;

    final tile = geometry.positionFromLocal(local);
    if (tile == null) return;
    if (_lastDragTile == tile) return;

    _lastDragTile = tile;
    _flashPress(tile);
    widget.onTileInteraction(tile);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;
    final explorer = widget.explorerPosition;

    return LayoutBuilder(
      builder: (context, constraints) {
        final geometry = BoardGeometry.fromGrid(
          grid: widget.grid,
          maxSize: constraints.biggest,
        );

        final pathSet = widget.visualPath.toSet();
        final board = _buildBoardStack(
          geometry: geometry,
          pathSet: pathSet,
          explorer: explorer,
          theme: theme,
        );

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, _cameraPerspective)
            ..rotateX(_cameraTiltRadians),
          child: board,
        );
      },
    );
  }

  Widget _buildBoardStack({
    required BoardGeometry geometry,
    required Set<GridPosition> pathSet,
    required GridPosition? explorer,
    required LLThemeExtension theme,
  }) {
    return SizedBox(
      width: geometry.boardSize.width,
      height: geometry.boardSize.height,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapUp: (details) {
          _lastDragTile = null;
          _handlePosition(details.localPosition, geometry);
        },
        onPanStart: (details) {
          _lastDragTile = null;
          _handlePosition(details.localPosition, geometry);
        },
        onPanUpdate: (details) {
          _handlePosition(details.localPosition, geometry);
        },
        onPanEnd: (_) => _lastDragTile = null,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: geometry.boardSize,
              painter: MazePainter(
                grid: widget.grid,
                theme: widget.mazeTheme,
                textures: _textures,
                wallStyle: MazeWallStyle.edge,
                paintCellMarkers: false,
                floorLayout: _floorLayout,
              ),
            ),
            for (var row = 0; row < widget.grid.height; row++)
              for (var col = 0; col < widget.grid.width; col++)
                Builder(
                  builder: (context) {
                    final position = GridPosition(row: row, col: col);
                    final cell = widget.grid.cellAt(position);
                    final isOnPath = pathSet.contains(position);
                    final isEndpoint = widget.visualPath.isNotEmpty &&
                        widget.visualPath.last == position;
                    final cellRect = geometry.cellRect(position);

                    return Positioned(
                      left: cellRect.left,
                      top: cellRect.top,
                      width: cellRect.width,
                      height: cellRect.height,
                      child: CellOverlay(
                        cell: cell,
                        size: geometry.cellSize,
                        isPathTile: isOnPath,
                        isPathEndpoint: isEndpoint,
                        isInvalidTarget: widget.invalidTarget == position,
                        effectiveKeyIds: widget.effectiveKeyIds,
                        isSelected: widget.selectedTile == position,
                        isTraversed:
                            widget.traversedPathPositions.contains(position),
                        isExecutionFocus:
                            widget.isExecuting && explorer == position,
                        isPressed: _pressedTile == position,
                      ),
                    );
                  },
                ),
            PathOverlay(
              geometry: geometry,
              path: widget.visualPath,
            ),
            if (explorer != null)
              ExplorerMarker(
                geometry: geometry,
                position: explorer,
                isExecuting: widget.isExecuting,
              ),
            if (widget.showDebugGrid)
              CustomPaint(
                size: geometry.boardSize,
                painter: _BoardDebugGridPainter(
                  geometry: geometry,
                  color: theme.pathEnergy.withValues(alpha: 0.2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _BoardDebugGridPainter extends CustomPainter {
  _BoardDebugGridPainter({required this.geometry, required this.color});

  final BoardGeometry geometry;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    for (var row = 0; row <= geometry.grid.height; row++) {
      final y = row * geometry.cellSize;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    for (var col = 0; col <= geometry.grid.width; col++) {
      final x = col * geometry.cellSize;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BoardDebugGridPainter oldDelegate) {
    return oldDelegate.geometry.cellSize != geometry.cellSize;
  }
}
