import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_result.dart';

class PathValidator {
  PathValidationResult validate({
    required MazeGrid grid,
    required List<GridPosition> path,
    bool requireExit = false,
  }) {
    if (path.isEmpty) {
      return const PathValidationResult(
        isValid: false,
        message: 'Path cannot be empty',
      );
    }

    final start = grid.findStart();
    if (start == null) {
      return const PathValidationResult(
        isValid: false,
        message: 'Level has no start tile',
      );
    }

    if (path.first != start) {
      return const PathValidationResult(
        isValid: false,
        message: 'Path must begin at the start tile',
        invalidIndex: 0,
      );
    }

    final visited = <GridPosition>{};
    final keys = <String>{};

    for (var index = 0; index < path.length; index++) {
      final position = path[index];
      final cell = grid.cellAtOrNull(position);

      if (cell == null) {
        return PathValidationResult(
          isValid: false,
          message: 'Path leaves the maze at step $index',
          invalidIndex: index,
        );
      }

      if (!cell.isWalkable) {
        return PathValidationResult(
          isValid: false,
          message: 'Path crosses a wall at step $index',
          invalidIndex: index,
        );
      }

      if (cell.visibility == CellVisibility.hidden) {
        return PathValidationResult(
          isValid: false,
          message: 'Path crosses a hidden cell at step $index',
          invalidIndex: index,
        );
      }

      if (visited.contains(position)) {
        return PathValidationResult(
          isValid: false,
          message: 'Path revisits a cell at step $index',
          invalidIndex: index,
        );
      }
      visited.add(position);

      if (index > 0 && !path[index - 1].isAdjacentTo(position)) {
        return PathValidationResult(
          isValid: false,
          message: 'Path must move to adjacent cells at step $index',
          invalidIndex: index,
        );
      }

      final keyId = cell.keyId;
      if (keyId != null) {
        keys.add(keyId);
      }

      final lockId = cell.lockId;
      if (lockId != null && !keys.contains(lockId)) {
        return PathValidationResult(
          isValid: false,
          message: 'Path crosses locked gate without key at step $index',
          invalidIndex: index,
        );
      }
    }

    if (requireExit) {
      final exit = grid.findExit();
      if (exit == null) {
        return const PathValidationResult(
          isValid: false,
          message: 'Level has no exit tile',
        );
      }
      if (path.last != exit) {
        return PathValidationResult(
          isValid: false,
          message: 'Path must end at the exit',
          invalidIndex: path.length - 1,
        );
      }
    }

    return PathValidationResult.valid;
  }
}
