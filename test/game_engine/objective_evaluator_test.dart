import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/objectives/objective_evaluator.dart';
import 'package:labyrinth_legends/game_engine/objectives/objective_outcome.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';

void main() {
  const evaluator = ObjectiveEvaluator();

  group('continue', () {
    test('mid-execution with no failure and exit not reached', () {
      final result = evaluator.evaluate(
        level: _level(),
        attemptContext: GameplayAttemptContext(),
        executionComplete: false,
      );

      expect(result.outcome, ObjectiveOutcome.continueExecution);
    });

    test('exit reached but collectAllGems not satisfied and path continues', () {
      final grid = _gridWithGems(gemPositions: [const GridPosition(row: 1, col: 2)]);
      final result = evaluator.evaluate(
        level: _level(
          collectAllGems: true,
          grid: grid,
        ),
        attemptContext: GameplayAttemptContext(reachedExit: true),
        executionComplete: false,
      );

      expect(result.outcome, ObjectiveOutcome.continueExecution);
    });
  });

  group('won', () {
    test('reachExit only when exit reached at path end', () {
      final result = evaluator.evaluate(
        level: _level(),
        attemptContext: GameplayAttemptContext(reachedExit: true),
        executionComplete: true,
      );

      expect(result.isWon, isTrue);
    });

    test('collectAllGems when every gem collected and exit reached', () {
      final grid = _gridWithGems(gemPositions: [const GridPosition(row: 1, col: 2)]);
      final result = evaluator.evaluate(
        level: _level(collectAllGems: true, grid: grid),
        attemptContext: GameplayAttemptContext(
          reachedExit: true,
          collectedGemPositions: {const GridPosition(row: 1, col: 2)},
        ),
        executionComplete: true,
      );

      expect(result.isWon, isTrue);
    });

    test('minGems threshold satisfied', () {
      final result = evaluator.evaluate(
        level: _level(minGems: 2),
        attemptContext: GameplayAttemptContext(
          reachedExit: true,
          collectedGemPositions: {
            const GridPosition(row: 1, col: 2),
            const GridPosition(row: 2, col: 2),
          },
        ),
        executionComplete: true,
      );

      expect(result.isWon, isTrue);
    });

    test('wins immediately when objectives satisfied before path end', () {
      final result = evaluator.evaluate(
        level: _level(),
        attemptContext: GameplayAttemptContext(reachedExit: true),
        executionComplete: false,
      );

      expect(result.isWon, isTrue);
    });
  });

  group('lost', () {
    test('execution failure fact transitions to lost immediately', () {
      final result = evaluator.evaluate(
        level: _level(),
        attemptContext: GameplayAttemptContext(
          failed: true,
          failureReason: 'Locked gate requires key: bronze_key',
        ),
        executionComplete: false,
      );

      expect(result.isLost, isTrue);
      expect(result.reason, contains('bronze_key'));
    });

    test('path complete without exit reached', () {
      final result = evaluator.evaluate(
        level: _level(),
        attemptContext: GameplayAttemptContext(),
        executionComplete: true,
      );

      expect(result.isLost, isTrue);
      expect(result.reason, contains('Exit'));
    });

    test('path complete without all gems when collectAllGems required', () {
      final grid = _gridWithGems(gemPositions: [const GridPosition(row: 1, col: 2)]);
      final result = evaluator.evaluate(
        level: _level(collectAllGems: true, grid: grid),
        attemptContext: GameplayAttemptContext(reachedExit: true),
        executionComplete: true,
      );

      expect(result.isLost, isTrue);
      expect(result.reason, contains('gems'));
    });

    test('path complete without minGems threshold', () {
      final result = evaluator.evaluate(
        level: _level(minGems: 2),
        attemptContext: GameplayAttemptContext(reachedExit: true),
        executionComplete: true,
      );

      expect(result.isLost, isTrue);
      expect(result.reason, contains('gem'));
    });
  });
}

LevelDefinition _level({
  bool collectAllGems = false,
  int minGems = 0,
  MazeGrid? grid,
}) {
  return LevelDefinition.fromJson({
    'schemaVersion': 1,
    'id': 'level_test',
    'name': 'Objective Test Level',
    'worldId': 'world_1',
    'discoveryMode': 'full',
    'moveLimit': null,
    'starThresholds': {
      'threeStars': 10,
      'twoStars': 12,
      'oneStar': 14,
    },
    'objectives': {
      'reachExit': true,
      'collectAllGems': collectAllGems,
      'minGems': minGems,
    },
    'grid': (grid ?? _defaultGrid()).toJson(),
  });
}

MazeGrid _defaultGrid() {
  return MazeGrid(
    width: 5,
    height: 5,
    cells: [
      for (var row = 0; row < 5; row++)
        [
          for (var col = 0; col < 5; col++)
            if (row == 0 || row == 4 || col == 0 || col == 4)
              const MazeCell(type: CellType.wall)
            else if (row == 1 && col == 1)
              const MazeCell(type: CellType.start)
            else if (row == 3 && col == 3)
              const MazeCell(type: CellType.exit)
            else
              const MazeCell(type: CellType.floor),
        ],
    ],
  );
}

MazeGrid _gridWithGems({required List<GridPosition> gemPositions}) {
  final grid = _defaultGrid();
  var current = grid;
  for (final position in gemPositions) {
    current = current.withCellAt(
      position,
      current.cellAt(position).copyWith(hasGem: true),
    );
  }
  return current;
}
