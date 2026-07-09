import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Neighbor-aware geometry for a single wall cell.
///
/// This is the "autotile in code" replacement for a PNG tileset: instead of
/// picking one of 16/47 pre-drawn tile images per wall cell, we derive the
/// shape (which corners are rounded, which edges fuse into neighbors) from
/// the four orthogonal neighbors. The painter turns this into one merged
/// vector path, so the result is pixel-perfect at any resolution and fully
/// theme-independent.
class WallCellGeometry {
  const WallCellGeometry({
    required this.row,
    required this.col,
    required this.wallNorth,
    required this.wallEast,
    required this.wallSouth,
    required this.wallWest,
  });

  final int row;
  final int col;

  /// Whether the orthogonal neighbor is also a wall (out of bounds counts as
  /// open, so the maze's outer silhouette gets rounded corners too).
  final bool wallNorth;
  final bool wallEast;
  final bool wallSouth;
  final bool wallWest;

  /// A convex corner is rounded only when both adjacent sides face open
  /// space. Corners that fuse into a neighboring wall stay square so the
  /// merged path reads as one continuous structure.
  bool get roundNorthWest => !wallNorth && !wallWest;
  bool get roundNorthEast => !wallNorth && !wallEast;
  bool get roundSouthEast => !wallSouth && !wallEast;
  bool get roundSouthWest => !wallSouth && !wallWest;

  /// Free-standing pillar (no wall neighbors at all).
  bool get isIsolated => !wallNorth && !wallEast && !wallSouth && !wallWest;
}

/// Pure, UI-free geometry pass over a [MazeGrid].
abstract final class WallShapeBuilder {
  static List<WallCellGeometry> build(MazeGrid grid) {
    final geometries = <WallCellGeometry>[];
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        if (grid.cells[row][col].type != CellType.wall) {
          continue;
        }
        geometries.add(
          WallCellGeometry(
            row: row,
            col: col,
            wallNorth: _isWall(grid, row - 1, col),
            wallEast: _isWall(grid, row, col + 1),
            wallSouth: _isWall(grid, row + 1, col),
            wallWest: _isWall(grid, row, col - 1),
          ),
        );
      }
    }
    return geometries;
  }

  static bool _isWall(MazeGrid grid, int row, int col) {
    final cell = grid.cellAtOrNull(GridPosition(row: row, col: col));
    return cell != null && cell.type == CellType.wall;
  }
}
