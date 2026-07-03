import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/session/step_resolution_result.dart';

/// Result of advancing one tile along a confirmed path.
class PathExecutionStepResult {
  const PathExecutionStepResult._({
    required this.pathComplete,
    required this.pathIndex,
    required this.position,
    this.from,
    this.resolution,
  });

  factory PathExecutionStepResult.pathComplete({
    required int pathIndex,
    required GridPosition position,
  }) {
    return PathExecutionStepResult._(
      pathComplete: true,
      pathIndex: pathIndex,
      position: position,
    );
  }

  factory PathExecutionStepResult.moved({
    required GridPosition from,
    required GridPosition to,
    required int pathIndex,
    required StepResolutionResult resolution,
  }) {
    return PathExecutionStepResult._(
      pathComplete: false,
      pathIndex: pathIndex,
      position: to,
      from: from,
      resolution: resolution,
    );
  }

  final bool pathComplete;
  final int pathIndex;
  final GridPosition position;
  final GridPosition? from;
  final StepResolutionResult? resolution;
}
