/// Star outcome for a won level attempt per [Level_Format.md] §14.
///
/// Produced by [RewardCalculator] from terminal session state only.
/// Stars are derived exclusively from path node count vs `starThresholds`.
class RewardResult {
  const RewardResult({
    required this.stars,
    required this.gemsCollected,
    required this.pathNodeCount,
  });

  final int stars;
  final int gemsCollected;
  final int pathNodeCount;

  @override
  bool operator ==(Object other) {
    return other is RewardResult &&
        other.stars == stars &&
        other.gemsCollected == gemsCollected &&
        other.pathNodeCount == pathNodeCount;
  }

  @override
  int get hashCode => Object.hash(stars, gemsCollected, pathNodeCount);
}
