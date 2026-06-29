import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_executor.dart';

MazeGrid _simpleGrid() {
  return MazeGrid(
    width: 3,
    height: 3,
    cells: [
      [
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.start),
        const MazeCell(type: CellType.wall),
      ],
      [
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.floor, hasGem: true),
        const MazeCell(type: CellType.wall),
      ],
      [
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.exit),
        const MazeCell(type: CellType.wall),
      ],
    ],
  );
}

void main() {
  test('collects gem and reaches exit', () {
    final grid = _simpleGrid();
    const path = [
      GridPosition(row: 0, col: 1),
      GridPosition(row: 1, col: 1),
      GridPosition(row: 2, col: 1),
    ];

    final result = PathExecutor().execute(grid: grid, path: path);

    expect(result.context.gemsCollected, 1);
    expect(result.context.reachedExit, isTrue);
    expect(result.context.failed, isFalse);
  });
}
