import 'package:labyrinth_legends/game_engine/mechanics/mechanic_context.dart';
import 'package:labyrinth_legends/game_engine/mechanics/tile_mechanic.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class ExitMechanic implements TileMechanic {
  @override
  MechanicContext apply({
    required MechanicContext context,
    required MazeGrid grid,
    required GridPosition position,
    required MazeCell cell,
  }) {
    if (cell.type != CellType.exit) {
      return context;
    }

    return context.copyWith(reachedExit: true);
  }
}
