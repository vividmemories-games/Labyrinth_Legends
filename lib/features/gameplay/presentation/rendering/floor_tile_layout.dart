import 'dart:math' as math;

import 'package:labyrinth_legends/features/gameplay/presentation/rendering/wall_edge_builder.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Variant + rotation assigned to one walkable floor cell for a level attempt.
class FloorTilePlacement {
  const FloorTilePlacement({
    required this.variantIndex,
    required this.quarterTurns,
  });

  /// Index into [MazeThemeTextures.floorTileVariants], or `-1` for fallback.
  final int variantIndex;

  /// Clockwise quarter turns applied when drawing (`0`–`3`).
  final int quarterTurns;

  @override
  bool operator ==(Object other) =>
      other is FloorTilePlacement &&
      other.variantIndex == variantIndex &&
      other.quarterTurns == quarterTurns;

  @override
  int get hashCode => Object.hash(variantIndex, quarterTurns);
}

/// Per-level floor tile assignments — stable for one attempt, reshuffled on retry.
class FloorTileLayout {
  FloorTileLayout._({
    required this.seed,
    required this.placements,
  });

  final int seed;
  final Map<GridPosition, FloorTilePlacement> placements;

  factory FloorTileLayout.forGrid(
    MazeGrid grid, {
    required int seed,
    required int variantCount,
  }) {
    final random = math.Random(seed);
    final placements = <GridPosition, FloorTilePlacement>{};

    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final position = GridPosition(row: row, col: col);
        if (!_isWalkable(grid, position)) {
          continue;
        }
        placements[position] = FloorTilePlacement(
          variantIndex:
              variantCount > 0 ? random.nextInt(variantCount) : -1,
          quarterTurns: random.nextInt(4),
        );
      }
    }

    return FloorTileLayout._(seed: seed, placements: placements);
  }

  FloorTilePlacement? placementAt(GridPosition position) =>
      placements[position];

  /// Raised wall stones reuse the walkable cell they border.
  FloorTilePlacement? placementForEdge(MazeEdge edge, MazeGrid grid) {
    final neighbor = _walkableNeighborForEdge(edge, grid);
    if (neighbor == null) {
      return null;
    }
    return placementAt(neighbor);
  }

  static GridPosition? _walkableNeighborForEdge(MazeEdge edge, MazeGrid grid) {
    if (edge.isVertical) {
      final west = GridPosition(row: edge.row, col: edge.col);
      final east = GridPosition(row: edge.row, col: edge.col + 1);
      if (_isWalkable(grid, west)) {
        return west;
      }
      if (_isWalkable(grid, east)) {
        return east;
      }
      return null;
    }

    final north = GridPosition(row: edge.row, col: edge.col);
    final south = GridPosition(row: edge.row + 1, col: edge.col);
    if (_isWalkable(grid, north)) {
      return north;
    }
    if (_isWalkable(grid, south)) {
      return south;
    }
    return null;
  }

  static bool _isWalkable(MazeGrid grid, GridPosition position) {
    if (!grid.isInBounds(position)) {
      return false;
    }
    return grid.cellAt(position).type != CellType.wall;
  }
}

/// Combines level id and retry count so tile variation reshuffles per attempt.
int floorLayoutSeedFor({required String levelId, required int retryCount}) {
  return Object.hash(levelId, retryCount);
}
