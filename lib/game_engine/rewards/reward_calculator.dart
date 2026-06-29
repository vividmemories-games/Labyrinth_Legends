import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

class RewardCalculationResult {
  const RewardCalculationResult({
    required this.stars,
    required this.gemsCollected,
    required this.pathLength,
    required this.gemBonusApplied,
  });

  final int stars;
  final int gemsCollected;
  final int pathLength;
  final bool gemBonusApplied;
}

class RewardCalculator {
  const RewardCalculator({this.gemStarBonus = 1});

  /// Extra star tiers granted when all gems are collected.
  final int gemStarBonus;

  RewardCalculationResult calculate({
    required LevelDefinition level,
    required int pathLength,
    required int gemsCollected,
    required int totalGems,
  }) {
    final thresholds = level.starThresholds;
    var stars = 0;

    if (pathLength <= thresholds.threeStars) {
      stars = 3;
    } else if (pathLength <= thresholds.twoStars) {
      stars = 2;
    } else if (pathLength <= thresholds.oneStar) {
      stars = 1;
    }

    final allGemsCollected = totalGems > 0 && gemsCollected >= totalGems;
    var gemBonusApplied = false;
    if (allGemsCollected && stars < 3) {
      stars = (stars + gemStarBonus).clamp(0, 3);
      gemBonusApplied = true;
    }

    return RewardCalculationResult(
      stars: stars,
      gemsCollected: gemsCollected,
      pathLength: pathLength,
      gemBonusApplied: gemBonusApplied,
    );
  }
}
