import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_error.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_result.dart';

/// Stateless GP2 path legality checks per [GP2_Movement_System.md] §4.
///
/// Revisits are permitted when explicitly included in the path (GP2-L09).
class PathValidator {
  const PathValidator();

  PathValidationResult validate({
    required MazeGrid grid,
    required List<GridPosition> path,
    bool requireExit = false,
  }) {
    if (path.isEmpty) {
      return PathValidationResult.failure(
        const PathValidationError(
          code: PathValidationErrorCode.emptyPath,
          message: 'Path cannot be empty',
          stepIndex: 0,
        ),
      );
    }

    final start = grid.findStart();
    if (start == null) {
      return PathValidationResult.failure(
        const PathValidationError(
          code: PathValidationErrorCode.missingStartCell,
          message: 'Level has no start tile',
        ),
      );
    }

    if (path.first != start) {
      return PathValidationResult.failure(
        PathValidationError(
          code: PathValidationErrorCode.notAtStart,
          message: 'Path must begin at the start tile',
          stepIndex: 0,
          position: path.first,
        ),
      );
    }

    final keys = <String>{};

    for (var index = 0; index < path.length; index++) {
      final position = path[index];
      final cell = grid.cellAtOrNull(position);

      if (cell == null) {
        return PathValidationResult.failure(
          PathValidationError(
            code: PathValidationErrorCode.outOfBounds,
            message: 'Path leaves the maze at step $index',
            stepIndex: index,
            position: position,
          ),
        );
      }

      if (index > 0 && !path[index - 1].isAdjacentTo(position)) {
        return PathValidationResult.failure(
          PathValidationError(
            code: PathValidationErrorCode.notAdjacent,
            message: 'Path must move to orthogonally adjacent cells at step $index',
            stepIndex: index,
            position: position,
          ),
        );
      }

      if (index > 0 && !grid.canTraverse(path[index - 1], position)) {
        return PathValidationResult.failure(
          PathValidationError(
            code: PathValidationErrorCode.notWalkable,
            message: 'Path crosses a blocked edge at step $index',
            stepIndex: index,
            position: position,
          ),
        );
      }

      if (!cell.isWalkable) {
        return PathValidationResult.failure(
          PathValidationError(
            code: PathValidationErrorCode.notWalkable,
            message: 'Path crosses a wall at step $index',
            stepIndex: index,
            position: position,
          ),
        );
      }

      if (cell.visibility == CellVisibility.hidden) {
        return PathValidationResult.failure(
          PathValidationError(
            code: PathValidationErrorCode.hiddenCell,
            message: 'Path crosses a hidden cell at step $index',
            stepIndex: index,
            position: position,
          ),
        );
      }

      final keyId = cell.keyId;
      if (keyId != null) {
        keys.add(keyId);
      }

      final lockId = cell.lockId;
      if (lockId != null && !keys.contains(lockId)) {
        return PathValidationResult.failure(
          PathValidationError(
            code: PathValidationErrorCode.lockedWithoutKey,
            message: 'Path crosses locked gate without key at step $index',
            stepIndex: index,
            position: position,
          ),
        );
      }
    }

    if (requireExit) {
      final exit = grid.findExit();
      if (exit == null) {
        return PathValidationResult.failure(
          const PathValidationError(
            code: PathValidationErrorCode.missingExitCell,
            message: 'Level has no exit tile',
          ),
        );
      }
      if (path.last != exit) {
        return PathValidationResult.failure(
          PathValidationError(
            code: PathValidationErrorCode.notAtExit,
            message: 'Path must end at the exit',
            stepIndex: path.length - 1,
            position: path.last,
          ),
        );
      }
    }

    return PathValidationResult.valid;
  }
}
