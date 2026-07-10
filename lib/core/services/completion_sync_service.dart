import 'package:labyrinth_legends/data/models/reward_result.dart';

/// Persists level completion — local today; Firebase sync hook point later.
abstract interface class CompletionSyncService {
  Future<void> syncLevelCompletion({
    required String levelId,
    required RewardResult reward,
  });
}

/// MVP: writes via [ProgressRepository]. Replace/extend for Firebase without UI changes.
class LocalCompletionSyncService implements CompletionSyncService {
  LocalCompletionSyncService({
    required Future<void> Function({
      required String levelId,
      required RewardResult reward,
    }) recordCompletion,
  }) : _recordCompletion = recordCompletion;

  final Future<void> Function({
    required String levelId,
    required RewardResult reward,
  }) _recordCompletion;

  @override
  Future<void> syncLevelCompletion({
    required String levelId,
    required RewardResult reward,
  }) {
    return _recordCompletion(levelId: levelId, reward: reward);
  }
}
