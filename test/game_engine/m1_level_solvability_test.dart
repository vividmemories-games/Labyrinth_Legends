import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/repositories/level_repository.dart';
import 'package:labyrinth_legends/game_engine/hints/hint_solver.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/validation/level_format_validator.dart';

Set<GridPosition> _reachableFrom(MazeGrid grid, GridPosition start) {
  final visited = <GridPosition>{start};
  final queue = <GridPosition>[start];

  while (queue.isNotEmpty) {
    final current = queue.removeAt(0);
    for (final neighbor in current.orthogonalNeighbors()) {
      if (!grid.isInBounds(neighbor) || visited.contains(neighbor)) {
        continue;
      }
      if (!grid.canTraverse(current, neighbor)) {
        continue;
      }
      visited.add(neighbor);
      queue.add(neighbor);
    }
  }

  return visited;
}

void _expectLevelSolvable(String levelId, {bool requireGems = false}) {
  test('$levelId is reachable from start and solvable to exit', () async {
    final raw = await rootBundle.loadString('assets/levels/world_1/$levelId.json');
    final level = const LevelFormatValidator().parse(
      jsonDecode(raw) as Map<String, dynamic>,
      expectedLevelId: levelId,
      expectedWorldId: 'world_1',
    );
    final grid = level.grid;
    final start = grid.findStart()!;
    final exit = grid.findExit()!;
    final reachable = _reachableFrom(grid, start);

    final exitsFromStart = start.orthogonalNeighbors().where((neighbor) {
      return grid.isInBounds(neighbor) && grid.canTraverse(start, neighbor);
    });
    expect(
      exitsFromStart,
      isNotEmpty,
      reason: '$levelId start must have at least one move',
    );

    expect(
      reachable,
      contains(exit),
      reason: '$levelId exit must be reachable from start',
    );

    if (requireGems) {
      for (var row = 0; row < grid.height; row++) {
        for (var col = 0; col < grid.width; col++) {
          final position = GridPosition(row: row, col: col);
          if (grid.cellAt(position).hasGem) {
            expect(
              reachable,
              contains(position),
              reason: '$levelId gem at $position must be reachable',
            );
          }
        }
      }
    }

    final path = HintSolver().findShortestPath(
      grid: grid,
      start: start,
      goal: exit,
    );
    expect(path, isNotNull, reason: '$levelId must have a path to exit');
  });
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('M1 validated band solvability', () {
    for (final levelId in LevelRepository.m1ValidatedLevelIds.toList()..sort()) {
      final requireGems = levelId == 'level_002' || levelId == 'level_009';
      _expectLevelSolvable(levelId, requireGems: requireGems);
    }
  });
}
