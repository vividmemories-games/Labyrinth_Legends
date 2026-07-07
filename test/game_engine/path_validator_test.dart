import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/migration/level_v1_to_v2_converter.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_error.dart';
import 'package:labyrinth_legends/game_engine/path/path_validator.dart';

void main() {
  const validator = PathValidator();

  MazeGrid buildKeyLockGrid() {
    return const LevelV1ToV2Converter().convertGrid(
      MazeGrid(
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
      ),
    );
  }

  group('valid paths', () {
    test('accepts a valid path from start to exit', () {
      final grid = buildKeyLockGrid();
      final path = [
        const GridPosition(row: 0, col: 0),
        const GridPosition(row: 0, col: 1),
        const GridPosition(row: 0, col: 2),
        const GridPosition(row: 1, col: 2),
        const GridPosition(row: 2, col: 2),
      ];

      final result = validator.validate(
        grid: grid,
        path: path,
        requireExit: true,
      );

      expect(result.isValid, isTrue);
      expect(result.errors, isEmpty);
    });

    test('allows revisiting a cell when path explicitly includes it (GP2-L09)', () {
      final grid = MazeGrid(
        width: 3,
        height: 2,
        cells: [
          [
            const MazeCell(type: CellType.start),
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.exit),
          ],
          [
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
          ],
        ],
      );
      final path = [
        const GridPosition(row: 0, col: 0),
        const GridPosition(row: 0, col: 1),
        const GridPosition(row: 0, col: 0),
        const GridPosition(row: 0, col: 1),
        const GridPosition(row: 0, col: 2),
      ];

      final result = validator.validate(grid: grid, path: path, requireExit: true);

      expect(result.isValid, isTrue);
    });
  });

  group('PV-01 empty path', () {
    test('rejects empty path with typed error', () {
      final result = validator.validate(
        grid: buildKeyLockGrid(),
        path: const [],
      );

      expect(result.isValid, isFalse);
      expect(result.firstError?.ruleId, 'PV-01');
      expect(result.errorCode, PathValidationErrorCode.emptyPath);
    });
  });

  group('PV-02 start', () {
    test('rejects path not starting at start tile', () {
      final grid = buildKeyLockGrid();
      final path = [
        const GridPosition(row: 0, col: 1),
        const GridPosition(row: 0, col: 2),
      ];

      final result = validator.validate(grid: grid, path: path);

      expect(result.isValid, isFalse);
      expect(result.firstError?.ruleId, 'PV-02');
      expect(result.errorCode, PathValidationErrorCode.notAtStart);
      expect(result.invalidIndex, 0);
    });
  });

  group('errorCode disambiguation', () {
    test('notAtStart is not reported as missingStartCell', () {
      final grid = buildKeyLockGrid();
      final result = validator.validate(
        grid: grid,
        path: [const GridPosition(row: 0, col: 1)],
      );
      expect(result.errorCode, PathValidationErrorCode.notAtStart);
      expect(result.errorCode, isNot(PathValidationErrorCode.missingStartCell));
    });

    test('notAdjacent is not reported as outOfBounds', () {
      final grid = buildKeyLockGrid();
      final result = validator.validate(
        grid: grid,
        path: [
          const GridPosition(row: 0, col: 0),
          const GridPosition(row: 2, col: 2),
        ],
      );
      expect(result.errorCode, PathValidationErrorCode.notAdjacent);
      expect(result.errorCode, isNot(PathValidationErrorCode.outOfBounds));
    });

    test('outOfBounds is not reported as notAdjacent', () {
      final grid = buildKeyLockGrid();
      final result = validator.validate(
        grid: grid,
        path: [
          const GridPosition(row: 0, col: 0),
          const GridPosition(row: 5, col: 5),
        ],
      );
      expect(result.errorCode, PathValidationErrorCode.outOfBounds);
      expect(result.errorCode, isNot(PathValidationErrorCode.notAdjacent));
    });

    test('hiddenCell is not reported as notWalkable', () {
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
      final result = validator.validate(
        grid: grid,
        path: [
          const GridPosition(row: 0, col: 0),
          const GridPosition(row: 0, col: 1),
        ],
      );
      expect(result.errorCode, PathValidationErrorCode.hiddenCell);
      expect(result.errorCode, isNot(PathValidationErrorCode.notWalkable));
    });

    test('notWalkable is not reported as hiddenCell', () {
      final grid = buildKeyLockGrid();
      final result = validator.validate(
        grid: grid,
        path: [
          const GridPosition(row: 0, col: 0),
          const GridPosition(row: 0, col: 1),
          const GridPosition(row: 1, col: 1),
        ],
      );
      expect(result.errorCode, PathValidationErrorCode.notWalkable);
      expect(result.errorCode, isNot(PathValidationErrorCode.hiddenCell));
    });

    test('notAtExit is not reported as missingExitCell', () {
      final grid = buildKeyLockGrid();
      final result = validator.validate(
        grid: grid,
        path: [
          const GridPosition(row: 0, col: 0),
          const GridPosition(row: 0, col: 1),
        ],
        requireExit: true,
      );
      expect(result.errorCode, PathValidationErrorCode.notAtExit);
      expect(result.errorCode, isNot(PathValidationErrorCode.missingExitCell));
    });
  });

  group('PV-04 movement', () {
    test('rejects non-adjacent moves', () {
      final grid = buildKeyLockGrid();
      final path = [
        const GridPosition(row: 0, col: 0),
        const GridPosition(row: 2, col: 2),
      ];

      final result = validator.validate(grid: grid, path: path);

      expect(result.isValid, isFalse);
      expect(result.firstError?.ruleId, 'PV-04');
      expect(result.errorCode, PathValidationErrorCode.notAdjacent);
      expect(result.message, contains('adjacent'));
    });

    test('rejects out of bounds steps', () {
      final grid = buildKeyLockGrid();
      final path = [
        const GridPosition(row: 0, col: 0),
        const GridPosition(row: 5, col: 5),
      ];

      final result = validator.validate(grid: grid, path: path);

      expect(result.isValid, isFalse);
      expect(result.firstError?.ruleId, 'PV-04');
      expect(result.errorCode, PathValidationErrorCode.outOfBounds);
    });
  });

  group('PV-06 walls and hidden', () {
    test('rejects crossing blocked edges', () {
      final grid = buildKeyLockGrid();
      final path = [
        const GridPosition(row: 0, col: 0),
        const GridPosition(row: 0, col: 1),
        const GridPosition(row: 1, col: 1),
      ];

      final result = validator.validate(grid: grid, path: path);

      expect(result.isValid, isFalse);
      expect(result.firstError?.ruleId, 'PV-06');
      expect(result.errorCode, PathValidationErrorCode.notWalkable);
      expect(result.message, contains('blocked edge'));
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
      expect(result.firstError?.ruleId, 'PV-06');
      expect(result.errorCode, PathValidationErrorCode.hiddenCell);
      expect(result.message, contains('hidden'));
    });
  });

  group('PV-07 locks', () {
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
      expect(result.firstError?.ruleId, 'PV-07');
      expect(result.message, contains('locked gate'));
    });
  });

  group('PV-03 exit', () {
    test('rejects path not ending at exit when required', () {
      final grid = buildKeyLockGrid();
      final path = [
        const GridPosition(row: 0, col: 0),
        const GridPosition(row: 0, col: 1),
      ];

      final result = validator.validate(
        grid: grid,
        path: path,
        requireExit: true,
      );

      expect(result.isValid, isFalse);
      expect(result.firstError?.ruleId, 'PV-03');
      expect(result.errorCode, PathValidationErrorCode.notAtExit);
    });
  });
}
