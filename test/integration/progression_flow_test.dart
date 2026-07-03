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

  test('complete level 1 unlocks level 2 in progression data', () async {
    final store = await LocalProgressStore.create();
    final repo = LocalProgressRepository(store);

    await repo.recordLevelCompletion(
      levelId: 'level_001',
      reward: const RewardResult(
        stars: 2,
        coinsEarned: 40,
        gemsCollected: 0,
        pathLength: 9,
      ),
    );

    final reloaded = await repo.getPlayerProgress();
    expect(reloaded.completedLevelIds, contains('level_001'));
  });
}
