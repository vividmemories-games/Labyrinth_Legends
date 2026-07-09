import 'dart:async';

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/board/board_geometry.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/explorer_marker.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/path_overlay.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/tile_view.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Production maze board renderer with path visualization and explorer marker.
class BoardRenderer extends StatefulWidget {
  const BoardRenderer({
    super.key,
    required this.grid,
    required this.visualPath,
    required this.onTileInteraction,
    this.explorerPosition,
    this.selectedTile,
    this.invalidTarget,
    this.planningExtensionHints = const {},
    this.traversedPathPositions = const {},
    this.isExecuting = false,
    this.showDebugGrid = false,
    this.enabled = true,
    this.effectiveKeyIds = const {},
  });

  final MazeGrid grid;
  final List<GridPosition> visualPath;
  final ValueChanged<GridPosition> onTileInteraction;
  final GridPosition? explorerPosition;
  final GridPosition? selectedTile;
  final GridPosition? invalidTarget;
  final Set<GridPosition> planningExtensionHints;
  final Set<GridPosition> traversedPathPositions;
  final bool isExecuting;
  final bool showDebugGrid;
  final bool enabled;
  final Set<String> effectiveKeyIds;

  @override
  State<BoardRenderer> createState() => _BoardRendererState();
}

class _BoardRendererState extends State<BoardRenderer> {
  GridPosition? _lastDragTile;
  GridPosition? _pressedTile;
  Timer? _pressTimer;

  @override
  void dispose() {
    _pressTimer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BoardRenderer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visualPath.length < oldWidget.visualPath.length) {
      _lastDragTile = widget.visualPath.isEmpty ? null : widget.visualPath.last;
    }
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
    final hideStartMarker = explorer != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final geometry = BoardGeometry.fromGrid(
          grid: widget.grid,
          maxSize: Size(constraints.maxWidth, constraints.maxHeight),
          padding: theme.spacingHudInset,
        );

        final pathSet = widget.visualPath.toSet();

        return Center(
          child: SizedBox(
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var row = 0; row < widget.grid.height; row++)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var col = 0; col < widget.grid.width; col++)
                              Builder(
                                builder: (context) {
                                  final position =
                                      GridPosition(row: row, col: col);
                                  final cell = widget.grid.cellAt(position);
                                  final isOnPath = pathSet.contains(position);
                                  final isEndpoint =
                                      widget.visualPath.isNotEmpty &&
                                          widget.visualPath.last == position;

                                  return TileView(
                                    cell: cell,
                                    position: position,
                                    grid: widget.grid,
                                    size: geometry.cellSize,
                                    isPathTile: isOnPath,
                                    isPathEndpoint: isEndpoint,
                                    isInvalidTarget:
                                        widget.invalidTarget == position,
                                    hideStartMarker: hideStartMarker,
                                    effectiveKeyIds: widget.effectiveKeyIds,
                                    isSelected: widget.selectedTile == position,
                                    isExtensionHint: widget
                                            .planningExtensionHints
                                            .contains(position) &&
                                        !isOnPath &&
                                        widget.invalidTarget != position,
                                    isTraversed: widget.traversedPathPositions
                                        .contains(position),
                                    isExecutionFocus: widget.isExecuting &&
                                        explorer == position,
                                    isPressed: _pressedTile == position,
                                  );
                                },
                              ),
                          ],
                        ),
                    ],
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
          ),
        );
      },
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
