import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/local/local_progress_store.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';
import 'package:labyrinth_legends/data/repositories/local_progress_repository.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('complete level 1 unlocks level 2 in progression data', () async {
    final store = await LocalProgressStore.create();
    final repo = LocalProgressRepository(store);

    final level = LevelDefinition.fromJson({
      'id': 'level_001',
      'name': 'First Steps',
      'worldId': 'world_1',
      'discoveryMode': 'full',
      'starThresholds': {'threeStars': 12, 'twoStars': 16, 'oneStar': 20},
      'objectives': {'reachExit': true},
      'grid': {
        'width': 7,
        'height': 7,
        'cells': [
          for (var r = 0; r < 7; r++)
            [
              for (var c = 0; c < 7; c++)
                {
                  'type': (r == 0 || r == 6 || c == 0 || c == 6)
                      ? 'wall'
                      : (r == 1 && c == 1)
                          ? 'start'
                          : (r == 5 && c == 5)
                              ? 'exit'
                              : 'floor',
                },
            ],
        ],
      },
    });

    final session = GameplaySession(level: level);
    session.tryAddToPath(const GridPosition(row: 1, col: 1));
    session.tryAddToPath(const GridPosition(row: 1, col: 2));
    session.tryAddToPath(const GridPosition(row: 1, col: 3));
    session.tryAddToPath(const GridPosition(row: 1, col: 4));
    session.tryAddToPath(const GridPosition(row: 1, col: 5));
    session.tryAddToPath(const GridPosition(row: 2, col: 5));
    session.tryAddToPath(const GridPosition(row: 3, col: 5));
    session.tryAddToPath(const GridPosition(row: 4, col: 5));
    session.tryAddToPath(const GridPosition(row: 5, col: 5));

    expect(session.go(), isTrue);

    await repo.recordLevelCompletion(
      levelId: 'level_001',
      reward: RewardResult(
        stars: 2,
        coinsEarned: 40,
        gemsCollected: 0,
        pathLength: session.path.length,
      ),
    );

    final reloaded = await repo.getPlayerProgress();
    expect(reloaded.completedLevelIds, contains('level_001'));
  });
}
