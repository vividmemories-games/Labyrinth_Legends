import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';

/// Factual GP7 resolution for one destination tile — no lifecycle transitions.
class StepResolutionResult {
  const StepResolutionResult({
    required this.attemptContext,
    required this.grid,
  });

  final GameplayAttemptContext attemptContext;
  final MazeGrid grid;
}
