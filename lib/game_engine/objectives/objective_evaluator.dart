import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/objectives/objective_evaluation_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';

/// Evaluates GP5 objective progress per [Engine_Architecture.md] EA-007.
///
/// Stateless — reports outcomes only; [GameplaySession] owns lifecycle.
class ObjectiveEvaluator {
  const ObjectiveEvaluator();

  ObjectiveEvaluationResult evaluate({
    required LevelDefinition level,
    required GameplayAttemptContext attemptContext,
    required bool executionComplete,
    MazeGrid? grid,
  }) {
    final objectives = level.objectives;
    final levelGrid = grid ?? level.grid;

    if (attemptContext.failed) {
      return ObjectiveEvaluationResult.lost(
        attemptContext.failureReason ?? 'Execution failed',
      );
    }

    if (_allRequiredObjectivesMet(
      objectives: objectives,
      attemptContext: attemptContext,
      levelGrid: levelGrid,
    )) {
      return const ObjectiveEvaluationResult.won();
    }

    if (executionComplete) {
      return ObjectiveEvaluationResult.lost(
        _unmetObjectivesReason(
          objectives: objectives,
          attemptContext: attemptContext,
          levelGrid: levelGrid,
        ),
      );
    }

    return const ObjectiveEvaluationResult.continueExecution();
  }

  bool _allRequiredObjectivesMet({
    required LevelObjectives objectives,
    required GameplayAttemptContext attemptContext,
    required MazeGrid levelGrid,
  }) {
    if (objectives.reachExit && !attemptContext.reachedExit) {
      return false;
    }
    return _gemsSatisfied(
      objectives: objectives,
      attemptContext: attemptContext,
      levelGrid: levelGrid,
    );
  }

  bool _gemsSatisfied({
    required LevelObjectives objectives,
    required GameplayAttemptContext attemptContext,
    required MazeGrid levelGrid,
  }) {
    if (objectives.collectAllGems) {
      final requiredGems = levelGrid.countGems();
      return requiredGems == 0 || attemptContext.gemsCollected >= requiredGems;
    }
    return attemptContext.gemsCollected >= objectives.minGems;
  }

  String _unmetObjectivesReason({
    required LevelObjectives objectives,
    required GameplayAttemptContext attemptContext,
    required MazeGrid levelGrid,
  }) {
    if (objectives.reachExit && !attemptContext.reachedExit) {
      return 'Exit not reached';
    }
    if (objectives.collectAllGems) {
      final requiredGems = levelGrid.countGems();
      if (attemptContext.gemsCollected < requiredGems) {
        return 'Not all gems collected';
      }
    }
    if (attemptContext.gemsCollected < objectives.minGems) {
      return 'Minimum gem requirement not met';
    }
    return 'Required objectives not met';
  }
}
