import 'package:labyrinth_legends/game_engine/mechanics/mechanic_context.dart';
import 'package:labyrinth_legends/game_engine/mechanics/exit_mechanic.dart';
import 'package:labyrinth_legends/game_engine/mechanics/gem_mechanic.dart';
import 'package:labyrinth_legends/game_engine/mechanics/key_mechanic.dart';
import 'package:labyrinth_legends/game_engine/mechanics/lock_mechanic.dart';
import 'package:labyrinth_legends/game_engine/mechanics/relic_mechanic.dart';
import 'package:labyrinth_legends/game_engine/mechanics/tile_mechanic.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class PathExecutionResult {
  const PathExecutionResult({
    required this.context,
    required this.finalGrid,
    required this.stepsTaken,
  });

  final MechanicContext context;
  final MazeGrid finalGrid;
  final int stepsTaken;
}

class PathExecutor {
  PathExecutor({
    GemMechanic? gemMechanic,
    KeyMechanic? keyMechanic,
    LockMechanic? lockMechanic,
    RelicMechanic? relicMechanic,
    ExitMechanic? exitMechanic,
  })  : _mechanics = [
          gemMechanic ?? GemMechanic(),
          keyMechanic ?? KeyMechanic(),
          lockMechanic ?? LockMechanic(),
          relicMechanic ?? RelicMechanic(),
          exitMechanic ?? ExitMechanic(),
        ];

  final List<TileMechanic> _mechanics;

  PathExecutionResult execute({
    required MazeGrid grid,
    required List<GridPosition> path,
    MechanicContext? initialContext,
    void Function(int stepIndex, MechanicContext context)? onStep,
  }) {
    var context = initialContext ?? MechanicContext();
    var currentGrid = grid;
    var stepsTaken = 0;

    for (var index = 0; index < path.length; index++) {
      if (context.failed) {
        break;
      }

      final position = path[index];
      final cell = currentGrid.cellAt(position);

      for (final mechanic in _mechanics) {
        context = mechanic.apply(
          context: context,
          grid: currentGrid,
          position: position,
          cell: cell,
        );
        if (context.failed) {
          break;
        }
      }

      if (cell.hasGem && context.collectedGemPositions.contains(position)) {
        currentGrid = currentGrid.withCellAt(
          position,
          cell.copyWith(hasGem: false),
        );
      }

      stepsTaken++;
      onStep?.call(index, context);

      if (context.failed) {
        break;
      }
    }

    return PathExecutionResult(
      context: context,
      finalGrid: currentGrid,
      stepsTaken: stepsTaken,
    );
  }
}
