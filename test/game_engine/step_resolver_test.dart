import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';
import 'package:labyrinth_legends/game_engine/session/step_resolver.dart';

MazeGrid _gridWithMechanics() {
  return MazeGrid(
    width: 5,
    height: 3,
    cells: [
      [
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.start),
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.wall),
      ],
      [
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.floor, hasGem: true),
        const MazeCell(type: CellType.floor, keyId: 'bronze_key'),
        const MazeCell(type: CellType.floor, lockId: 'bronze_key'),
        const MazeCell(type: CellType.wall),
      ],
      [
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.wall),
        const MazeCell(type: CellType.exit),
        const MazeCell(type: CellType.wall),
      ],
    ],
  );
}

void main() {
  const resolver = StepResolver();

  test('collects gem and clears tile flag', () {
    const position = GridPosition(row: 1, col: 1);
    final grid = _gridWithMechanics();

    final result = resolver.resolve(
      grid: grid,
      position: position,
      attemptContext: GameplayAttemptContext(),
    );

    expect(result.attemptContext.gemsCollected, 1);
    expect(result.grid.cellAt(position).hasGem, isFalse);
  });

  test('collects key without mutating grid', () {
    const position = GridPosition(row: 1, col: 2);
    final grid = _gridWithMechanics();

    final result = resolver.resolve(
      grid: grid,
      position: position,
      attemptContext: GameplayAttemptContext(),
    );

    expect(result.attemptContext.collectedKeys, {'bronze_key'});
    expect(result.grid, same(grid));
  });

  test('lock without key records failure fact', () {
    const position = GridPosition(row: 1, col: 3);
    final grid = _gridWithMechanics();

    final result = resolver.resolve(
      grid: grid,
      position: position,
      attemptContext: GameplayAttemptContext(),
    );

    expect(result.attemptContext.failed, isTrue);
    expect(result.attemptContext.failureReason, contains('bronze_key'));
  });

  test('lock with key passes through', () {
    const position = GridPosition(row: 1, col: 3);
    final grid = _gridWithMechanics();

    final result = resolver.resolve(
      grid: grid,
      position: position,
      attemptContext: GameplayAttemptContext(
        collectedKeys: {'bronze_key'},
      ),
    );

    expect(result.attemptContext.failed, isFalse);
  });

  test('exit tile sets reachedExit fact', () {
    const position = GridPosition(row: 2, col: 3);
    final grid = _gridWithMechanics();

    final result = resolver.resolve(
      grid: grid,
      position: position,
      attemptContext: GameplayAttemptContext(),
    );

    expect(result.attemptContext.reachedExit, isTrue);
  });
}
