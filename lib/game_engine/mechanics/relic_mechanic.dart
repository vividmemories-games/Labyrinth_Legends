import 'package:labyrinth_legends/game_engine/mechanics/mechanic_context.dart';
import 'package:labyrinth_legends/game_engine/mechanics/tile_mechanic.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class RelicMechanic implements TileMechanic {
  @override
  MechanicContext apply({
    required MechanicContext context,
    required MazeGrid grid,
    required GridPosition position,
    required MazeCell cell,
  }) {
    if (!cell.hasRelic) {
      return context;
    }

    final relicId = cell.relicId ?? 'relic_${position.row}_${position.col}';
    if (context.hasRelic(relicId)) {
      return context;
    }

    return context.copyWith(
      collectedRelics: {...context.collectedRelics, relicId},
    );
  }
}
