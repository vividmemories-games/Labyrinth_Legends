import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/discovery/discovery_engine.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

void main() {
  MazeGrid buildGrid() {
    return MazeGrid(
      width: 5,
      height: 5,
      cells: List.generate(
        5,
        (row) => List.generate(
          5,
          (col) => MazeCell(
            type: row == 0 || row == 4 || col == 0 || col == 4
                ? CellType.wall
                : CellType.floor,
            hiddenUntilRelicId:
                col == 3 && row == 2 ? 'ancient_lens' : null,
            visibility: col == 3 && row == 2
                ? CellVisibility.hidden
                : CellVisibility.visible,
          ),
        ),
      ),
    );
  }

  test('fog mode reveals cells within manhattan radius 2 of the path', () {
    final engine = DiscoveryEngine(discoveryMode: DiscoveryMode.fog);
    final grid = buildGrid();
    final start = const GridPosition(row: 2, col: 1);

    final revealed = engine.revealFromPath(grid, [start]);

    expect(
      revealed.cellAt(const GridPosition(row: 2, col: 2)).visibility,
      CellVisibility.visible,
    );
    expect(
      revealed.cellAt(const GridPosition(row: 4, col: 4)).visibility,
      CellVisibility.fogged,
    );
  });

  test('relic gated mode hides cells until relic is collected', () {
    final engine = DiscoveryEngine(discoveryMode: DiscoveryMode.relicGated);
    final grid = buildGrid();

    final hidden = engine.applyInitialVisibility(grid);
    expect(
      hidden.cellAt(const GridPosition(row: 2, col: 3)).visibility,
      CellVisibility.hidden,
    );

    final revealed = engine.revealAfterRelicCollection(
      hidden,
      {'ancient_lens'},
    );
    expect(
      revealed.cellAt(const GridPosition(row: 2, col: 3)).visibility,
      CellVisibility.visible,
    );
  });

  test('full mode leaves visibility unchanged', () {
    final engine = DiscoveryEngine(discoveryMode: DiscoveryMode.full);
    final grid = buildGrid();

    final result = engine.revealFromPath(
      grid,
      [const GridPosition(row: 2, col: 1)],
    );

    expect(result, grid);
  });
}
