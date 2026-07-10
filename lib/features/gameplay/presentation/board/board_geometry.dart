import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Maps grid coordinates to board pixel space with square cells.
class BoardGeometry {
  const BoardGeometry({
    required this.cellSize,
    required this.grid,
  });

  final double cellSize;
  final MazeGrid grid;

  Size get boardSize => Size(grid.width * cellSize, grid.height * cellSize);

  Offset cellCenter(GridPosition position) {
    return Offset(
      (position.col + 0.5) * cellSize,
      (position.row + 0.5) * cellSize,
    );
  }

  Rect cellRect(GridPosition position) {
    return Rect.fromLTWH(
      position.col * cellSize,
      position.row * cellSize,
      cellSize,
      cellSize,
    );
  }

  GridPosition? positionFromLocal(Offset local) {
    final col = (local.dx / cellSize).floor();
    final row = (local.dy / cellSize).floor();
    final position = GridPosition(row: row, col: col);
    return grid.isInBounds(position) ? position : null;
  }

  static BoardGeometry fromGrid({
    required MazeGrid grid,
    required Size maxSize,
    double padding = 0,
  }) {
    final boundedWidth = maxSize.width.isFinite ? maxSize.width : 0.0;
    final boundedHeight = maxSize.height.isFinite ? maxSize.height : 0.0;
    final availableWidth = math.max(0, boundedWidth - padding * 2);
    final availableHeight = math.max(0, boundedHeight - padding * 2);
    if (availableWidth == 0 || availableHeight == 0 || grid.width == 0 || grid.height == 0) {
      return BoardGeometry(cellSize: 0, grid: grid);
    }

    final cellWidth = availableWidth / grid.width;
    final cellHeight = availableHeight / grid.height;
    final cellSize = math.min(cellWidth, cellHeight);

    return BoardGeometry(cellSize: cellSize, grid: grid);
  }
}
