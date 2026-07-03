import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_executor.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';

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
  const executor = PathExecutor();

  test('advances exactly one tile per executeStep call', () {
    final grid = _simpleGrid();
    const path = [
      GridPosition(row: 0, col: 1),
      GridPosition(row: 1, col: 1),
      GridPosition(row: 2, col: 1),
    ];

    final first = executor.executeStep(
      grid: grid,
      path: path,
      currentPathIndex: 0,
      attemptContext: GameplayAttemptContext(),
    );

    expect(first.pathComplete, isFalse);
    expect(first.pathIndex, 1);
    expect(first.position, const GridPosition(row: 1, col: 1));
    expect(first.from, const GridPosition(row: 0, col: 1));
    expect(first.resolution!.attemptContext.gemsCollected, 1);

    final second = executor.executeStep(
      grid: first.resolution!.grid,
      path: path,
      currentPathIndex: first.pathIndex,
      attemptContext: first.resolution!.attemptContext,
    );

    expect(second.pathComplete, isFalse);
    expect(second.pathIndex, 2);
    expect(second.resolution!.attemptContext.reachedExit, isTrue);
  });

  test('returns pathComplete at final node without movement', () {
    final grid = _simpleGrid();
    const path = [
      GridPosition(row: 0, col: 1),
      GridPosition(row: 1, col: 1),
      GridPosition(row: 2, col: 1),
    ];

    final result = executor.executeStep(
      grid: grid,
      path: path,
      currentPathIndex: 2,
      attemptContext: GameplayAttemptContext(reachedExit: true),
    );

    expect(result.pathComplete, isTrue);
    expect(result.pathIndex, 2);
    expect(result.from, isNull);
    expect(result.resolution, isNull);
  });
}
