import 'package:labyrinth_legends/game_engine/mechanics/mechanic_context.dart';
import 'package:labyrinth_legends/game_engine/mechanics/tile_mechanic.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class KeyMechanic implements TileMechanic {
  @override
  MechanicContext apply({
    required MechanicContext context,
    required MazeGrid grid,
    required GridPosition position,
    required MazeCell cell,
  }) {
    final keyId = cell.keyId;
    if (keyId == null || context.hasKey(keyId)) {
      return context;
    }

    return context.copyWith(
      collectedKeys: {...context.collectedKeys, keyId},
    );
  }
}
