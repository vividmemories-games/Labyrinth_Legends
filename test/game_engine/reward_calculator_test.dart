import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_calculator.dart';

void main() {
  final level = LevelDefinition(
    id: 'test_level',
    name: 'Test',
    worldId: 'world_1',
    grid: MazeGrid(
      width: 1,
      height: 1,
      cells: [
        [MazeCell(type: CellType.floor)],
      ],
    ),
    objectives: LevelObjectives(),
    discoveryMode: DiscoveryMode.full,
    starThresholds: StarThresholds(
      threeStars: 10,
      twoStars: 15,
      oneStar: 20,
    ),
  );

  const calculator = RewardCalculator();

  test('awards three stars for short efficient paths', () {
    final result = calculator.calculate(
      level: level,
      pathLength: 8,
      gemsCollected: 0,
      totalGems: 0,
    );

    expect(result.stars, 3);
    expect(result.gemBonusApplied, isFalse);
  });

  test('awards fewer stars for longer paths', () {
    final result = calculator.calculate(
      level: level,
      pathLength: 17,
      gemsCollected: 0,
      totalGems: 0,
    );

    expect(result.stars, 1);
  });

  test('applies gem bonus when all gems are collected', () {
    final result = calculator.calculate(
      level: level,
      pathLength: 17,
      gemsCollected: 3,
      totalGems: 3,
    );

    expect(result.stars, 2);
    expect(result.gemBonusApplied, isTrue);
  });
}
