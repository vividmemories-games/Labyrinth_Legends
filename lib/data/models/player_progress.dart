class PlayerProgress {
  const PlayerProgress({
    this.coins = 100,
    this.gems = 10,
    this.totalStars = 0,
    this.selectedSkinId = 'explorer',
    this.collectedRelicIds = const {},
    this.completedLevelIds = const {},
    this.soundEnabled = true,
    this.musicEnabled = true,
    this.hapticsEnabled = true,
    this.hintsRemaining = 3,
  });

  final int coins;
  final int gems;
  final int totalStars;
  final String selectedSkinId;
  final Set<String> collectedRelicIds;
  final Set<String> completedLevelIds;
  final bool soundEnabled;
  final bool musicEnabled;
  final bool hapticsEnabled;
  final int hintsRemaining;

  PlayerProgress copyWith({
    int? coins,
    int? gems,
    int? totalStars,
    String? selectedSkinId,
    Set<String>? collectedRelicIds,
    Set<String>? completedLevelIds,
    bool? soundEnabled,
    bool? musicEnabled,
    bool? hapticsEnabled,
    int? hintsRemaining,
  }) {
    return PlayerProgress(
      coins: coins ?? this.coins,
      gems: gems ?? this.gems,
      totalStars: totalStars ?? this.totalStars,
      selectedSkinId: selectedSkinId ?? this.selectedSkinId,
      collectedRelicIds: collectedRelicIds ?? this.collectedRelicIds,
      completedLevelIds: completedLevelIds ?? this.completedLevelIds,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      musicEnabled: musicEnabled ?? this.musicEnabled,
      hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled,
      hintsRemaining: hintsRemaining ?? this.hintsRemaining,
    );
  }

  Map<String, dynamic> toJson() => {
        'coins': coins,
        'gems': gems,
        'totalStars': totalStars,
        'selectedSkinId': selectedSkinId,
        'collectedRelicIds': collectedRelicIds.toList(),
        'completedLevelIds': completedLevelIds.toList(),
        'soundEnabled': soundEnabled,
        'musicEnabled': musicEnabled,
        'hapticsEnabled': hapticsEnabled,
        'hintsRemaining': hintsRemaining,
      };

  factory PlayerProgress.fromJson(Map<String, dynamic> json) {
    return PlayerProgress(
      coins: json['coins'] as int? ?? 100,
      gems: json['gems'] as int? ?? 10,
      totalStars: json['totalStars'] as int? ?? 0,
      selectedSkinId: json['selectedSkinId'] as String? ?? 'explorer',
      collectedRelicIds:
          (json['collectedRelicIds'] as List<dynamic>? ?? const [])
              .map((id) => id as String)
              .toSet(),
      completedLevelIds:
          (json['completedLevelIds'] as List<dynamic>? ?? const [])
              .map((id) => id as String)
              .toSet(),
      soundEnabled: json['soundEnabled'] as bool? ?? true,
      musicEnabled: json['musicEnabled'] as bool? ?? true,
      hapticsEnabled: json['hapticsEnabled'] as bool? ?? true,
      hintsRemaining: json['hintsRemaining'] as int? ?? 3,
    );
  }
}
