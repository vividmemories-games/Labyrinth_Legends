import 'package:labyrinth_legends/data/models/reward_result.dart';

/// Transient handoff from gameplay win flow → Victory screen (one navigation).
class LevelCompletionSnapshot {
  const LevelCompletionSnapshot({
    required this.levelId,
    required this.reward,
  });

  final String levelId;
  final RewardResult reward;
}
