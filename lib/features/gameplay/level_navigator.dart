import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/data/repositories/level_repository.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// Sequential level progression for production gameplay — M1 validated band only.
///
/// Uses [LevelRepository.m1ValidatedLevelIds] as the authoritative ordered list.
/// Does not implement unlock/progression systems.
abstract final class LevelNavigator {
  static const String defaultWorldId = GameConstants.defaultWorldId;

  /// Sorted sequential level IDs available for runtime navigation.
  static List<String> get sequentialLevelIds {
    final ids = LevelRepository.m1ValidatedLevelIds.toList()..sort();
    return ids;
  }

  /// Returns the next level ID after [currentLevelId], or null at the final level.
  static String? nextLevelIdAfter(String currentLevelId) {
    final ids = sequentialLevelIds;
    final index = ids.indexOf(currentLevelId);
    if (index < 0 || index >= ids.length - 1) {
      return null;
    }
    return ids[index + 1];
  }

  /// Whether a sequential next level exists after [currentLevelId].
  static bool hasNextLevel(String currentLevelId) {
    return nextLevelIdAfter(currentLevelId) != null;
  }

  /// Resolves [levelId] from the already-loaded [levels] list.
  static LevelDefinition? findLevel(
    List<LevelDefinition> levels,
    String levelId,
  ) {
    for (final level in levels) {
      if (level.id == levelId) {
        return level;
      }
    }
    return null;
  }
}
