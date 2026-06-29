class RewardResult {
  const RewardResult({
    required this.stars,
    required this.coinsEarned,
    required this.gemsCollected,
    required this.pathLength,
    this.relicId,
    this.gemBonusApplied = false,
    this.isNewBest = false,
  });

  final int stars;
  final int coinsEarned;
  final int gemsCollected;
  final int pathLength;
  final String? relicId;
  final bool gemBonusApplied;
  final bool isNewBest;

  RewardResult copyWith({
    int? stars,
    int? coinsEarned,
    int? gemsCollected,
    int? pathLength,
    String? relicId,
    bool? gemBonusApplied,
    bool? isNewBest,
  }) {
    return RewardResult(
      stars: stars ?? this.stars,
      coinsEarned: coinsEarned ?? this.coinsEarned,
      gemsCollected: gemsCollected ?? this.gemsCollected,
      pathLength: pathLength ?? this.pathLength,
      relicId: relicId ?? this.relicId,
      gemBonusApplied: gemBonusApplied ?? this.gemBonusApplied,
      isNewBest: isNewBest ?? this.isNewBest,
    );
  }
}
