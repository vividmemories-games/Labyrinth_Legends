import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class HintSolver {
  List<GridPosition>? findShortestPath({
    required MazeGrid grid,
    GridPosition? start,
    GridPosition? goal,
  }) {
    final resolvedStart = start ?? grid.findStart();
    final resolvedGoal = goal ?? grid.findExit();

    if (resolvedStart == null || resolvedGoal == null) {
      return null;
    }

    final queue = <List<GridPosition>>[
      [resolvedStart],
    ];
    final visited = <String>{_positionKey(resolvedStart)};

    while (queue.isNotEmpty) {
      final path = queue.removeAt(0);
      final current = path.last;

      if (current == resolvedGoal) {
        return path;
      }

      for (final neighbor in current.orthogonalNeighbors()) {
        if (!grid.isInBounds(neighbor)) {
          continue;
        }

        final key = _positionKey(neighbor);
        if (visited.contains(key)) {
          continue;
        }

        final cell = grid.cellAt(neighbor);
        if (!cell.isWalkable || cell.visibility == CellVisibility.hidden) {
          continue;
        }

        if (!grid.canTraverse(current, neighbor)) {
          continue;
        }

        if (!_canTraversePath(path, grid, neighbor)) {
          continue;
        }

        visited.add(key);
        queue.add([...path, neighbor]);
      }
    }

    return null;
  }

  bool _canTraversePath(
    List<GridPosition> pathSoFar,
    MazeGrid grid,
    GridPosition next,
  ) {
    final keys = <String>{};
    for (final position in pathSoFar) {
      final keyId = grid.cellAt(position).keyId;
      if (keyId != null) {
        keys.add(keyId);
      }
    }

    final nextCell = grid.cellAt(next);
    final lockId = nextCell.lockId;
    if (lockId != null && !keys.contains(lockId)) {
      return false;
    }

    return true;
  }

  String _positionKey(GridPosition position) =>
      '${position.row}:${position.col}';
}
