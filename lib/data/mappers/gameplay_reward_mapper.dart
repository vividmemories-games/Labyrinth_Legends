import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart' as data;
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart' as engine;

/// Maps engine terminal rewards into persistence-layer [data.RewardResult].
abstract final class GameplayRewardMapper {
  static data.RewardResult toDataReward(engine.RewardResult engineReward) {
    return data.RewardResult(
      stars: engineReward.stars,
      coinsEarned: GameConstants.baseCoinsPerLevel,
      gemsCollected: engineReward.gemsCollected,
      pathLength: engineReward.pathNodeCount,
    );
  }
}
