import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/core/services/completion_sync_service.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_completion_flow.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart' as engine;

void main() {
  test('waits for celebration duration and sync before returning snapshot', () async {
    var syncCalls = 0;
    Duration? waited;

    final service = _RecordingSyncService(() => syncCalls++);

    final flow = GameplayCompletionFlow(
      syncService: service,
      minCelebrationDuration: const Duration(milliseconds: 40),
      wait: (duration) async {
        waited = duration;
      },
    );

    const engineReward = engine.RewardResult(
      stars: 2,
      gemsCollected: 1,
      pathNodeCount: 10,
    );

    final snapshot = await flow.run(
      levelId: 'level_001',
      engineReward: engineReward,
    );

    expect(waited, const Duration(milliseconds: 40));
    expect(syncCalls, 1);
    expect(snapshot.levelId, 'level_001');
    expect(snapshot.reward.stars, 2);
    expect(snapshot.reward.gemsCollected, 1);
    expect(snapshot.reward.pathLength, 10);
  });

  test('waits for celebration even when sync fails quickly', () async {
    var celebrationCompleted = false;

    final flow = GameplayCompletionFlow(
      syncService: _FailingSyncService(),
      minCelebrationDuration: const Duration(milliseconds: 50),
      wait: (duration) async {
        await Future<void>.delayed(duration);
        celebrationCompleted = true;
      },
    );

    await expectLater(
      flow.run(
        levelId: 'level_001',
        engineReward: const engine.RewardResult(
          stars: 3,
          gemsCollected: 0,
          pathNodeCount: 4,
        ),
      ),
      throwsA(isA<StateError>()),
    );

    expect(celebrationCompleted, isTrue);
  });
}

class _FailingSyncService implements CompletionSyncService {
  @override
  Future<void> syncLevelCompletion({
    required String levelId,
    required RewardResult reward,
  }) async {
    throw StateError('sync failed');
  }
}

class _RecordingSyncService implements CompletionSyncService {
  _RecordingSyncService(this._onSync);

  final void Function() _onSync;

  @override
  Future<void> syncLevelCompletion({
    required String levelId,
    required RewardResult reward,
  }) async {
    _onSync();
  }
}
