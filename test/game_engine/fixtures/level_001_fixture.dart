import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/validation/level_format_validator.dart';

/// Canonical authored path for [level_001.json] — shortest valid route to exit.
///
/// Path node count: 9 → 3 stars (threshold threeStars: 12).
const level001CanonicalPath = <GridPosition>[
  GridPosition(row: 0, col: 0),
  GridPosition(row: 0, col: 1),
  GridPosition(row: 0, col: 2),
  GridPosition(row: 1, col: 2),
  GridPosition(row: 2, col: 2),
];

const level001ExpectedPathNodeCount = 5;
const level001ExpectedStars = 3;

LevelDefinition parseLevel001FromJson(Map<String, dynamic> json) {
  const validator = LevelFormatValidator();
  return validator.parse(
    json,
    expectedLevelId: 'level_001',
    expectedWorldId: 'world_1',
  );
}
