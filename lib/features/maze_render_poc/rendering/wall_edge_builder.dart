import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// A raised wall edge lying on the boundary between two grid cells.
///
/// Edge-based wall model: instead of walls occupying cells, a raised edge
/// exists wherever a walkable cell borders a wall cell. The whole board
/// reads as floor tiles, and a one-cell-thick wall line in the data
/// collapses visually into ridges on the surrounding tiles' borders —
/// e.g. in level_001 the corridor tiles above an interior wall row get a
/// raised bottom edge, and the tiles below it get a raised top edge.
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

/// Pure, UI-free edge extraction from a cell-based [MazeGrid].
abstract final class WallEdgeBuilder {
  static List<MazeEdge> build(MazeGrid grid) {
    final edges = <MazeEdge>[];
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final wall = _isWall(grid, row, col);
        // Only interior boundaries where wall-ness flips become edges; the
        // outer silhouette of a border wall ring is intentionally open so
        // the maze sits on a continuous tiled floor.
        if (col + 1 < grid.width && wall != _isWall(grid, row, col + 1)) {
          edges.add(MazeEdge.vertical(row: row, col: col));
        }
        if (row + 1 < grid.height && wall != _isWall(grid, row + 1, col)) {
          edges.add(MazeEdge.horizontal(row: row, col: col));
        }
      }
    }
    return edges;
  }

  static bool _isWall(MazeGrid grid, int row, int col) {
    final cell = grid.cellAtOrNull(GridPosition(row: row, col: col));
    return cell == null || cell.type == CellType.wall;
  }
}
