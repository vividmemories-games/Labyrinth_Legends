import 'package:labyrinth_legends/game_engine/generation/maze_generator.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// Builds a seeded procedural maze for the daily challenge.
LevelDefinition buildDailyLevel(int seed) {
  final grid = MazeGenerator().generate(width: 11, height: 11, seed: seed);
  return LevelDefinition(
    id: 'daily_$seed',
    name: 'Daily Labyrinth',
    worldId: 'daily',
    grid: grid,
    objectives: const LevelObjectives(reachExit: true),
    discoveryMode: DiscoveryMode.full,
    starThresholds: const StarThresholds(
      threeStars: 28,
      twoStars: 40,
      oneStar: 55,
    ),
  );
}

int dailySeedForDate(DateTime date) =>
    date.year * 10000 + date.month * 100 + date.day;

String dailyLevelIdForDate(DateTime date) => 'daily_${dailySeedForDate(date)}';
