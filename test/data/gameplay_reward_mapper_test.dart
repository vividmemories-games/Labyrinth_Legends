import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/data/mappers/gameplay_reward_mapper.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart' as engine;

void main() {
  test('maps engine reward to data reward with base coins', () {
    const engineReward = engine.RewardResult(
      stars: 3,
      gemsCollected: 2,
      pathNodeCount: 8,
    );

    final dataReward = GameplayRewardMapper.toDataReward(engineReward);

    expect(dataReward.stars, 3);
    expect(dataReward.gemsCollected, 2);
    expect(dataReward.pathLength, 8);
    expect(dataReward.coinsEarned, GameConstants.baseCoinsPerLevel);
  });
}
