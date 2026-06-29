import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_validator.dart';

void main() {
  late PathValidator validator;

  setUp(() {
    validator = PathValidator();
  });

  MazeGrid buildKeyLockGrid() {
    return MazeGrid(
      width: 3,
      height: 3,
      cells: [
        [
          const MazeCell(type: CellType.start),
          const MazeCell(type: CellType.floor, keyId: 'key_a'),
          const MazeCell(type: CellType.floor),
        ],
        [
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.floor, lockId: 'key_a'),
        ],
        [
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.exit),
        ],
      ],
    );
  }

  test('accepts a valid path from start to exit', () {
    final grid = buildKeyLockGrid();
    final path = [
      const GridPosition(row: 0, col: 0),
      const GridPosition(row: 0, col: 1),
      const GridPosition(row: 0, col: 2),
      const GridPosition(row: 1, col: 2),
      const GridPosition(row: 2, col: 2),
    ];

    final result = validator.validate(grid: grid, path: path, requireExit: true);

    expect(result.isValid, isTrue);
  });

  test('rejects non-adjacent moves', () {
    final grid = buildKeyLockGrid();
    final path = [
      const GridPosition(row: 0, col: 0),
      const GridPosition(row: 2, col: 2),
    ];

    final result = validator.validate(grid: grid, path: path);

    expect(result.isValid, isFalse);
    expect(result.message, contains('adjacent'));
  });

  test('rejects revisiting a cell', () {
    final grid = buildKeyLockGrid();
    final path = [
      const GridPosition(row: 0, col: 0),
      const GridPosition(row: 0, col: 1),
      const GridPosition(row: 0, col: 0),
    ];

    final result = validator.validate(grid: grid, path: path);

    expect(result.isValid, isFalse);
    expect(result.message, contains('revisits'));
  });

  test('rejects crossing walls', () {
    final grid = buildKeyLockGrid();
    final path = [
      const GridPosition(row: 0, col: 0),
      const GridPosition(row: 1, col: 1),
    ];

    final result = validator.validate(grid: grid, path: path);

    expect(result.isValid, isFalse);
    expect(result.message, contains('wall'));
  });

  test('rejects locked gates without the matching key', () {
    final grid = MazeGrid(
      width: 3,
      height: 2,
      cells: [
        [
          const MazeCell(type: CellType.start),
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.floor, lockId: 'key_a'),
        ],
        [
          const MazeCell(type: CellType.floor, keyId: 'key_a'),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.exit),
        ],
      ],
    );
    final path = [
      const GridPosition(row: 0, col: 0),
      const GridPosition(row: 0, col: 1),
      const GridPosition(row: 0, col: 2),
    ];

    final result = validator.validate(grid: grid, path: path);

    expect(result.isValid, isFalse);
    expect(result.message, contains('locked gate'));
  });

  test('rejects hidden cells', () {
    final grid = MazeGrid(
      width: 2,
      height: 2,
      cells: [
        [
          const MazeCell(type: CellType.start),
          const MazeCell(
            type: CellType.floor,
            visibility: CellVisibility.hidden,
          ),
        ],
        [
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.exit),
        ],
      ],
    );

    final path = [
      const GridPosition(row: 0, col: 0),
      const GridPosition(row: 0, col: 1),
    ];

    final result = validator.validate(grid: grid, path: path);

    expect(result.isValid, isFalse);
    expect(result.message, contains('hidden'));
  });
}
