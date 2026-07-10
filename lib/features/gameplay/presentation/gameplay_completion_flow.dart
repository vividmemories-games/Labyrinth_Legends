import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/core/services/completion_sync_service.dart';
import 'package:labyrinth_legends/data/mappers/gameplay_reward_mapper.dart';
import 'package:labyrinth_legends/data/models/level_completion_snapshot.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart' as engine;

/// Runs foreground celebration timing in parallel with background completion sync.
class GameplayCompletionFlow {
  GameplayCompletionFlow({
    required CompletionSyncService syncService,
    Duration minCelebrationDuration = GameConstants.victoryCelebrationMinDuration,
    Future<void> Function(Duration duration)? wait,
  })  : _syncService = syncService,
        _minCelebrationDuration = minCelebrationDuration,
        _wait = wait ?? ((duration) => Future<void>.delayed(duration));

  final CompletionSyncService _syncService;
  final Duration _minCelebrationDuration;
  final Future<void> Function(Duration duration) _wait;

  Future<LevelCompletionSnapshot> run({
    required String levelId,
    required engine.RewardResult engineReward,
  }) async {
    final dataReward = GameplayRewardMapper.toDataReward(engineReward);

    await Future.wait<void>(
      [
        _wait(_minCelebrationDuration),
        _syncService.syncLevelCompletion(levelId: levelId, reward: dataReward),
      ],
      eagerError: false,
    );

    return LevelCompletionSnapshot(levelId: levelId, reward: dataReward);
  }
}
