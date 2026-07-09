import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Visual edge overlays for a walkable cell (schema v2).
class CellEdgeMask {
  const CellEdgeMask({
    this.north = false,
    this.east = false,
    this.south = false,
    this.west = false,
    this.innerNorthEast = false,
    this.innerNorthWest = false,
    this.innerSouthEast = false,
    this.innerSouthWest = false,
  });

  final bool north;
  final bool east;
  final bool south;
  final bool west;
  final bool innerNorthEast;
  final bool innerNorthWest;
  final bool innerSouthEast;
  final bool innerSouthWest;

  factory CellEdgeMask.forCell(MazeGrid grid, GridPosition position) {
    final edges = grid.resolvedEdgesAt(position);

    bool blockedToward(int deltaRow, int deltaCol) {
      final neighbor = position.neighborInDirection(deltaRow, deltaCol);
      if (neighbor == null || !grid.isInBounds(neighbor)) {
        return true;
      }
      return !grid.canTraverse(position, neighbor);
    }

    final north = edges.north;
    final south = edges.south;
    final west = edges.west;
    final east = edges.east;

    return CellEdgeMask(
      north: north,
      east: east,
      south: south,
      west: west,
      innerNorthEast: north && east && !blockedToward(-1, 1),
      innerNorthWest: north && west && !blockedToward(-1, -1),
      innerSouthEast: south && east && !blockedToward(1, 1),
      innerSouthWest: south && west && !blockedToward(1, -1),
    );
  }

  /// Layered overlay sprites — floor base is always [GameplayAssetKind.tileFloor].
  List<GameplayAssetKind> get layeredOverlays {
    if (innerNorthEast) return [GameplayAssetKind.edgeInnerNorthEast];
    if (innerNorthWest) return [GameplayAssetKind.edgeInnerNorthWest];
    if (innerSouthEast) return [GameplayAssetKind.edgeInnerSouthEast];
    if (innerSouthWest) return [GameplayAssetKind.edgeInnerSouthWest];

    final overlays = <GameplayAssetKind>[];
    var n = north;
    var e = east;
    var s = south;
    var w = west;

    if (n && e) {
      overlays.add(GameplayAssetKind.edgeCornerNorthEast);
      n = false;
      e = false;
    }
    if (n && w) {
      overlays.add(GameplayAssetKind.edgeCornerNorthWest);
      n = false;
      w = false;
    }
    if (s && e) {
      overlays.add(GameplayAssetKind.edgeCornerSouthEast);
      s = false;
      e = false;
    }
    if (s && w) {
      overlays.add(GameplayAssetKind.edgeCornerSouthWest);
      s = false;
      w = false;
    }
    if (n) overlays.add(GameplayAssetKind.edgeNorth);
    if (e) overlays.add(GameplayAssetKind.edgeEast);
    if (s) overlays.add(GameplayAssetKind.edgeSouth);
    if (w) overlays.add(GameplayAssetKind.edgeWest);

    return overlays;
  }
}
