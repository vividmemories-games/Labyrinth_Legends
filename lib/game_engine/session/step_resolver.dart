import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';
import 'package:labyrinth_legends/game_engine/session/step_resolution_result.dart';

/// Resolves GP7 effects for one destination tile per [Engine_Architecture.md] EA-007.
///
/// M1.4 subset: gem collection, key pickup, lock check, exit flag.
/// Reports facts only — [GameplaySession] owns lifecycle (EA-008). Lock failure
/// is recorded on [GameplayAttemptContext.failed]; the session decides whether to
/// halt execution or continue (M1.4 continues; M1.5+ may change this).
class StepResolver {
  const StepResolver();

  StepResolutionResult resolve({
    required MazeGrid grid,
    required GridPosition position,
    required GameplayAttemptContext attemptContext,
  }) {
    final cell = grid.cellAt(position);
    var context = attemptContext;
    var currentGrid = grid;

    context = _resolveLock(cell, context);
    if (context.failed) {
      return StepResolutionResult(attemptContext: context, grid: currentGrid);
    }

    context = _resolveKey(cell, context);
    context = _resolveRelic(cell, position, context);
    context = _resolveGem(cell, position, context);
    if (cell.hasGem && context.collectedGemPositions.contains(position)) {
      currentGrid = currentGrid.withCellAt(
        position,
        cell.copyWith(hasGem: false),
      );
    }
    context = _resolveExit(cell, context);

    return StepResolutionResult(
      attemptContext: context,
      grid: currentGrid,
    );
  }

  GameplayAttemptContext _resolveLock(
    MazeCell cell,
    GameplayAttemptContext context,
  ) {
    final lockId = cell.lockId;
    if (lockId == null || context.collectedKeys.contains(lockId)) {
      return context;
    }
    return context.copyWith(
      failed: true,
      failureReason: 'Locked gate requires key: $lockId',
    );
  }

  GameplayAttemptContext _resolveKey(
    MazeCell cell,
    GameplayAttemptContext context,
  ) {
    final keyId = cell.keyId;
    if (keyId == null || context.collectedKeys.contains(keyId)) {
      return context;
    }
    return context.copyWith(
      collectedKeys: {...context.collectedKeys, keyId},
    );
  }

  GameplayAttemptContext _resolveRelic(
    MazeCell cell,
    GridPosition position,
    GameplayAttemptContext context,
  ) {
    if (!cell.hasRelic) {
      return context;
    }

    final relicId = cell.relicId ?? 'relic_${position.row}_${position.col}';
    if (context.collectedRelics.contains(relicId)) {
      return context;
    }

    return context.copyWith(
      collectedRelics: {...context.collectedRelics, relicId},
    );
  }

  GameplayAttemptContext _resolveGem(
    MazeCell cell,
    GridPosition position,
    GameplayAttemptContext context,
  ) {
    if (!cell.hasGem || context.collectedGemPositions.contains(position)) {
      return context;
    }
    return context.copyWith(
      collectedGemPositions: {...context.collectedGemPositions, position},
    );
  }

  GameplayAttemptContext _resolveExit(
    MazeCell cell,
    GameplayAttemptContext context,
  ) {
    if (cell.type != CellType.exit) {
      return context;
    }
    return context.copyWith(reachedExit: true);
  }
}
