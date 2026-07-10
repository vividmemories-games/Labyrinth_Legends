import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
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

    final startKeys = _keysAlongPath(grid, [resolvedStart]);
    final startRelics = _relicsAlongPath(grid, [resolvedStart]);
    final queue = <_SearchNode>[
      _SearchNode(
        path: [resolvedStart],
        keys: startKeys,
        relics: startRelics,
      ),
    ];
    final visited = <String>{
      _stateKey([resolvedStart], startKeys, startRelics),
    };

    while (queue.isNotEmpty) {
      final node = queue.removeAt(0);
      final path = node.path;
      final current = path.last;

      if (current == resolvedGoal) {
        return path;
      }

      final keys = node.keys;
      final relics = node.relics;

      for (final neighbor in current.orthogonalNeighbors()) {
        if (!grid.isInBounds(neighbor)) {
          continue;
        }

        final cell = grid.cellAt(neighbor);
        if (!cell.isWalkable) {
          continue;
        }

        final relicsBefore = _relicsAlongPath(grid, path);
        if (!_isCellVisibleForPath(cell, relicsBefore)) {
          continue;
        }

        if (!grid.canTraverse(current, neighbor)) {
          continue;
        }

        final nextKeys = Set<String>.from(keys);
        final nextRelics = Set<String>.from(relicsBefore);
        if (cell.keyId != null) {
          nextKeys.add(cell.keyId!);
        }
        if (cell.hasRelic) {
          nextRelics.add(
            cell.relicId ?? 'relic_${neighbor.row}_${neighbor.col}',
          );
        }

        final lockId = cell.lockId;
        if (lockId != null && !nextKeys.contains(lockId)) {
          continue;
        }

        final nextPath = [...path, neighbor];
        final stateKey = _stateKey(nextPath, nextKeys, nextRelics);
        if (visited.contains(stateKey)) {
          continue;
        }

        visited.add(stateKey);
        queue.add(
          _SearchNode(
            path: nextPath,
            keys: nextKeys,
            relics: nextRelics,
          ),
        );
      }
    }

    return null;
  }

  bool _isCellVisibleForPath(MazeCell cell, Set<String> collectedRelics) {
    final relicGate = cell.hiddenUntilRelicId;
    if (relicGate != null) {
      return collectedRelics.contains(relicGate);
    }
    return cell.visibility != CellVisibility.hidden;
  }

  Set<String> _keysAlongPath(MazeGrid grid, List<GridPosition> path) {
    final keys = <String>{};
    for (final position in path) {
      final keyId = grid.cellAt(position).keyId;
      if (keyId != null) {
        keys.add(keyId);
      }
    }
    return keys;
  }

  Set<String> _relicsAlongPath(MazeGrid grid, List<GridPosition> path) {
    final relics = <String>{};
    for (final position in path) {
      final cell = grid.cellAt(position);
      if (cell.hasRelic) {
        relics.add(cell.relicId ?? 'relic_${position.row}_${position.col}');
      }
    }
    return relics;
  }

  String _stateKey(
    List<GridPosition> path,
    Set<String> keys,
    Set<String> relics,
  ) {
    final position = path.last;
    final sortedKeys = keys.toList()..sort();
    final sortedRelics = relics.toList()..sort();
    return '${position.row}:${position.col}|${sortedKeys.join(',')}|${sortedRelics.join(',')}';
  }
}

class _SearchNode {
  const _SearchNode({
    required this.path,
    this.keys = const {},
    this.relics = const {},
  });

  final List<GridPosition> path;
  final Set<String> keys;
  final Set<String> relics;
}
