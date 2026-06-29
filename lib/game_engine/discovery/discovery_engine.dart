import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Reveals maze cells based on discovery mode, path, and collected relics.
class DiscoveryEngine {
  DiscoveryEngine({
    required this.discoveryMode,
    this.fogRevealRadius = 2,
  });

  final DiscoveryMode discoveryMode;
  final int fogRevealRadius;

  MazeGrid applyInitialVisibility(MazeGrid grid) {
    switch (discoveryMode) {
      case DiscoveryMode.full:
        return grid;
      case DiscoveryMode.fog:
        return _applyFog(grid, const []);
      case DiscoveryMode.relicGated:
        return _applyRelicGated(grid, collectedRelicIds: const {});
    }
  }

  MazeGrid revealFromPath(MazeGrid grid, List<GridPosition> path) {
    switch (discoveryMode) {
      case DiscoveryMode.full:
        return grid;
      case DiscoveryMode.fog:
        return _applyFog(grid, path);
      case DiscoveryMode.relicGated:
        return grid;
    }
  }

  MazeGrid revealFromPlayer(
    MazeGrid grid,
    GridPosition playerPosition,
  ) {
    if (discoveryMode != DiscoveryMode.fog) {
      return grid;
    }
    return _applyFog(grid, [playerPosition]);
  }

  MazeGrid revealAfterRelicCollection(
    MazeGrid grid,
    Set<String> collectedRelicIds,
  ) {
    if (discoveryMode != DiscoveryMode.relicGated) {
      return grid;
    }
    return _applyRelicGated(grid, collectedRelicIds: collectedRelicIds);
  }

  MazeGrid _applyFog(MazeGrid grid, List<GridPosition> revealCenters) {
    var updated = grid;
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final position = GridPosition(row: row, col: col);
        final cell = grid.cellAt(position);
        final isNearRevealCenter = revealCenters.any(
          (center) =>
              center.manhattanDistanceTo(position) <= fogRevealRadius,
        );

        final visibility = isNearRevealCenter
            ? CellVisibility.visible
            : CellVisibility.fogged;

        if (cell.visibility != visibility) {
          updated = updated.withCellAt(
            position,
            cell.copyWith(visibility: visibility),
          );
        }
      }
    }
    return updated;
  }

  MazeGrid _applyRelicGated(
    MazeGrid grid, {
    required Set<String> collectedRelicIds,
  }) {
    var updated = grid;
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final position = GridPosition(row: row, col: col);
        final cell = grid.cellAt(position);

        final visibility = _visibilityForRelicGatedCell(
          cell.hiddenUntilRelicId,
          collectedRelicIds,
        );

        if (cell.visibility != visibility) {
          updated = updated.withCellAt(
            position,
            cell.copyWith(visibility: visibility),
          );
        }
      }
    }
    return updated;
  }

  CellVisibility _visibilityForRelicGatedCell(
    String? hiddenUntilRelicId,
    Set<String> collectedRelicIds,
  ) {
    if (hiddenUntilRelicId == null) {
      return CellVisibility.visible;
    }
    return collectedRelicIds.contains(hiddenUntilRelicId)
        ? CellVisibility.visible
        : CellVisibility.hidden;
  }
}
