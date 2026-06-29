import 'package:labyrinth_legends/game_engine/mechanics/mechanic_context.dart';
import 'package:labyrinth_legends/game_engine/mechanics/tile_mechanic.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class LockMechanic implements TileMechanic {
  @override
  MechanicContext apply({
    required MechanicContext context,
    required MazeGrid grid,
    required GridPosition position,
    required MazeCell cell,
  }) {
    final lockId = cell.lockId;
    if (lockId == null || context.hasKey(lockId)) {
      return context;
    }

    return context.copyWith(
      failed: true,
      failureReason: 'Locked gate requires key: $lockId',
    );
  }
}
