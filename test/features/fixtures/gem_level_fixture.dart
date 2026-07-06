import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// Minimal level requiring gem collection — mirrors gameplay_session_test fixture.
LevelDefinition levelRequiringAllGems() {
  return LevelDefinition.fromJson({
    'schemaVersion': 1,
    'id': 'level_gems',
    'name': 'Gem Level',
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
      'collectAllGems': true,
      'minGems': 0,
    },
    'grid': {
      'width': 5,
      'height': 5,
      'cells': [
        for (var row = 0; row < 5; row++)
          [
            for (var col = 0; col < 5; col++)
              if (row == 0 || row == 4 || col == 0 || col == 4)
                {'type': 'wall'}
              else if (row == 1 && col == 1)
                {'type': 'start'}
              else if (row == 2 && col == 1)
                {'type': 'floor', 'hasGem': true}
              else if (row == 3 && col == 3)
                {'type': 'exit'}
              else
                {'type': 'floor'},
          ],
      ],
    },
  });
}

/// Collects the required gem and reaches exit.
const gemLevelWinningPath = <GridPosition>[
  GridPosition(row: 1, col: 1),
  GridPosition(row: 2, col: 1),
  GridPosition(row: 3, col: 1),
  GridPosition(row: 3, col: 2),
  GridPosition(row: 3, col: 3),
];

/// Reaches exit without collecting the required gem.
const gemLevelLosingPath = <GridPosition>[
  GridPosition(row: 1, col: 1),
  GridPosition(row: 1, col: 2),
  GridPosition(row: 1, col: 3),
  GridPosition(row: 2, col: 3),
  GridPosition(row: 3, col: 3),
];

const gemTilePosition = GridPosition(row: 2, col: 1);
