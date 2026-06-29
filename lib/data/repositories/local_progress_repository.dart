import 'package:labyrinth_legends/data/local/local_progress_store.dart';
import 'package:labyrinth_legends/data/models/level_progress.dart';
import 'package:labyrinth_legends/data/models/player_progress.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';
import 'package:labyrinth_legends/data/repositories/progress_repository.dart';

class LocalProgressRepository implements ProgressRepository {
  LocalProgressRepository(this._store);

  final LocalProgressStore _store;

  @override
  Future<PlayerProgress> getPlayerProgress() {
    return _store.loadPlayerProgress();
  }

  @override
  Future<void> savePlayerProgress(PlayerProgress progress) {
    return _store.savePlayerProgress(progress);
  }

  @override
  Future<LevelProgress?> getLevelProgress(String levelId) {
    return _store.loadLevelProgress(levelId);
  }

  @override
  Future<void> saveLevelProgress(LevelProgress progress) {
    return _store.saveLevelProgress(progress);
  }

  @override
  Future<void> recordLevelCompletion({
    required String levelId,
    required RewardResult reward,
  }) async {
    final existing = await getLevelProgress(levelId);
    final isNewBest = reward.stars > (existing?.bestStars ?? 0);

    final updatedLevel = (existing ?? LevelProgress(levelId: levelId)).copyWith(
      completed: true,
      bestStars: isNewBest ? reward.stars : existing?.bestStars ?? reward.stars,
      bestGems: reward.gemsCollected > (existing?.bestGems ?? 0)
          ? reward.gemsCollected
          : existing?.bestGems ?? reward.gemsCollected,
      bestPathLength: _bestPathLength(existing?.bestPathLength, reward.pathLength),
      attempts: (existing?.attempts ?? 0) + 1,
    );

    await saveLevelProgress(updatedLevel);

    final player = await getPlayerProgress();
    final relics = {...player.collectedRelicIds};
    if (reward.relicId != null) {
      relics.add(reward.relicId!);
    }

    final previousBestStars = existing?.bestStars ?? 0;
    final starDelta =
        reward.stars > previousBestStars ? reward.stars - previousBestStars : 0;

    await savePlayerProgress(
      player.copyWith(
        coins: player.coins + reward.coinsEarned,
        gems: player.gems + reward.gemsCollected,
        totalStars: player.totalStars + starDelta,
        collectedRelicIds: relics,
        completedLevelIds: {...player.completedLevelIds, levelId},
      ),
    );
  }

  int? _bestPathLength(int? existing, int latest) {
    if (existing == null) {
      return latest;
    }
    return latest < existing ? latest : existing;
  }
}
