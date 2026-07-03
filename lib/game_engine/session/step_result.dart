import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';

/// Public result of [GameplaySession.executeNextStep].
class StepResult {
  const StepResult({
    required this.pathIndex,
    required this.position,
    required this.pathComplete,
    this.from,
    this.attemptContext,
  });

  factory StepResult.pathComplete({
    required int pathIndex,
    required GridPosition position,
    required GameplayAttemptContext attemptContext,
  }) {
    return StepResult(
      pathIndex: pathIndex,
      position: position,
      pathComplete: true,
      attemptContext: attemptContext,
    );
  }

  factory StepResult.moved({
    required GridPosition from,
    required GridPosition to,
    required int pathIndex,
    required GameplayAttemptContext attemptContext,
    bool pathComplete = false,
  }) {
    return StepResult(
      pathIndex: pathIndex,
      position: to,
      pathComplete: pathComplete,
      from: from,
      attemptContext: attemptContext,
    );
  }

  final int pathIndex;
  final GridPosition position;
  final bool pathComplete;
  final GridPosition? from;
  final GameplayAttemptContext? attemptContext;
}
