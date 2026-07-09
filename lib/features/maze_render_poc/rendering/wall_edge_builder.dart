import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// A raised wall edge lying on the boundary between two grid cells.
///
/// Edge-based wall model: a raised edge exists wherever traversal is blocked
/// between neighboring cells — either from legacy wall cells (`CellType.wall`)
/// or schema-v2 `blockedEdges` on walkable cells.
class MazeEdge {
  const MazeEdge.vertical({required this.row, required this.col})
      : isVertical = true;

  const MazeEdge.horizontal({required this.row, required this.col})
      : isVertical = false;

  /// For a vertical edge: boundary between (row, col) and (row, col + 1).
  /// For a horizontal edge: boundary between (row, col) and (row + 1, col).
  final int row;
  final int col;
  final bool isVertical;

  @override
  bool operator ==(Object other) =>
      other is MazeEdge &&
      other.row == row &&
      other.col == col &&
      other.isVertical == isVertical;

  @override
  int get hashCode => Object.hash(row, col, isVertical);

  @override
  String toString() =>
      '${isVertical ? 'V' : 'H'}($row, $col)';
}

/// Pure, UI-free edge extraction from a [MazeGrid].
///
/// Supports both:
/// - **Legacy wall cells** — an edge wherever wall-ness flips between neighbors
/// - **Schema v2 `blockedEdges`** — an edge for each authored blocked side
///
/// Outer perimeter edges from `resolvedEdgesAt` are omitted so the maze sits
/// on a continuous tiled floor (matching the original POC silhouette rule).
abstract final class WallEdgeBuilder {
  static List<MazeEdge> build(MazeGrid grid) {
    final edges = <MazeEdge>{};

    // Legacy: wall-cell adjacency flips.
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final wall = _isWall(grid, row, col);
        if (col + 1 < grid.width && wall != _isWall(grid, row, col + 1)) {
          edges.add(MazeEdge.vertical(row: row, col: col));
        }
        if (row + 1 < grid.height && wall != _isWall(grid, row + 1, col)) {
          edges.add(MazeEdge.horizontal(row: row, col: col));
        }
      }
    }

    // Schema v2: authored blockedEdges on walkable cells (interior only).
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final cell = grid.cellAt(GridPosition(row: row, col: col));
        if (cell.type == CellType.wall) {
          continue;
        }
        final blocked = cell.blockedEdges;
        if (blocked.east && col + 1 < grid.width) {
          edges.add(MazeEdge.vertical(row: row, col: col));
        }
        if (blocked.west && col > 0) {
          edges.add(MazeEdge.vertical(row: row, col: col - 1));
        }
        if (blocked.south && row + 1 < grid.height) {
          edges.add(MazeEdge.horizontal(row: row, col: col));
        }
        if (blocked.north && row > 0) {
          edges.add(MazeEdge.horizontal(row: row - 1, col: col));
        }
      }
    }

    return edges.toList();
  }

  static bool _isWall(MazeGrid grid, int row, int col) {
    final cell = grid.cellAtOrNull(GridPosition(row: row, col: col));
    return cell == null || cell.type == CellType.wall;
  }
}
