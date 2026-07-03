import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_execution_step_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';
import 'package:labyrinth_legends/game_engine/session/step_resolver.dart';

/// Advances execution one tile along a confirmed path per [Engine_Architecture.md] EA-007.
///
/// Owns movement between path nodes; delegates destination resolution to [StepResolver].
class PathExecutor {
  const PathExecutor({StepResolver? stepResolver})
      : _stepResolver = stepResolver ?? const StepResolver();

  final StepResolver _stepResolver;

  /// Advances exactly one tile from [currentPathIndex] on [path].
  ///
  /// Returns [PathExecutionStepResult.pathComplete] when [currentPathIndex] is
  /// already the final node — no movement occurs.
  PathExecutionStepResult executeStep({
    required MazeGrid grid,
    required List<GridPosition> path,
    required int currentPathIndex,
    required GameplayAttemptContext attemptContext,
  }) {
    final currentPosition = path[currentPathIndex];

    if (currentPathIndex >= path.length - 1) {
      return PathExecutionStepResult.pathComplete(
        pathIndex: currentPathIndex,
        position: currentPosition,
      );
    }

    final nextIndex = currentPathIndex + 1;
    final destination = path[nextIndex];
    final resolution = _stepResolver.resolve(
      grid: grid,
      position: destination,
      attemptContext: attemptContext,
    );

    return PathExecutionStepResult.moved(
      from: currentPosition,
      to: destination,
      pathIndex: nextIndex,
      resolution: resolution,
    );
  }
}
