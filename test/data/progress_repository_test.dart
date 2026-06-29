import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/local/local_progress_store.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';
import 'package:labyrinth_legends/data/repositories/local_progress_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('unlock chain persists across reload', () async {
    final store = await LocalProgressStore.create();
    final repo = LocalProgressRepository(store);

    await repo.recordLevelCompletion(
      levelId: 'level_001',
      reward: const RewardResult(
        stars: 3,
        coinsEarned: 50,
        gemsCollected: 2,
        pathLength: 10,
      ),
    );

    final player = await repo.getPlayerProgress();
    expect(player.completedLevelIds, contains('level_001'));
    expect(player.coins, greaterThan(100));
    expect(player.totalStars, 3);

    final levelProgress = await repo.getLevelProgress('level_001');
    expect(levelProgress?.completed, isTrue);
    expect(levelProgress?.bestStars, 3);
  });

  test('replay does not inflate total stars', () async {
    final store = await LocalProgressStore.create();
    final repo = LocalProgressRepository(store);

    const reward = RewardResult(
      stars: 3,
      coinsEarned: 50,
      gemsCollected: 1,
      pathLength: 10,
    );

    await repo.recordLevelCompletion(levelId: 'level_001', reward: reward);
    await repo.recordLevelCompletion(levelId: 'level_001', reward: reward);

    final player = await repo.getPlayerProgress();
    expect(player.totalStars, 3);

    await repo.recordLevelCompletion(
      levelId: 'level_001',
      reward: const RewardResult(
        stars: 2,
        coinsEarned: 40,
        gemsCollected: 0,
        pathLength: 12,
      ),
    );
    expect((await repo.getPlayerProgress()).totalStars, 3);

    await repo.recordLevelCompletion(
      levelId: 'level_001',
      reward: const RewardResult(
        stars: 5,
        coinsEarned: 60,
        gemsCollected: 0,
        pathLength: 8,
      ),
    );
    expect((await repo.getPlayerProgress()).totalStars, 5);
  });
}
