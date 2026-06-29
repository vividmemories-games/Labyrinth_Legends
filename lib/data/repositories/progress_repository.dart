import 'package:labyrinth_legends/data/models/level_progress.dart';
import 'package:labyrinth_legends/data/models/player_progress.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';

abstract class ProgressRepository {
  Future<PlayerProgress> getPlayerProgress();

  Future<void> savePlayerProgress(PlayerProgress progress);

  Future<LevelProgress?> getLevelProgress(String levelId);

  Future<void> saveLevelProgress(LevelProgress progress);

  Future<void> recordLevelCompletion({
    required String levelId,
    required RewardResult reward,
  });
}
