class LevelProgress {
  const LevelProgress({
    required this.levelId,
    this.completed = false,
    this.bestStars = 0,
    this.bestGems = 0,
    this.bestPathLength,
    this.attempts = 0,
  });

  final String levelId;
  final bool completed;
  final int bestStars;
  final int bestGems;
  final int? bestPathLength;
  final int attempts;

  LevelProgress copyWith({
    bool? completed,
    int? bestStars,
    int? bestGems,
    int? bestPathLength,
    int? attempts,
  }) {
    return LevelProgress(
      levelId: levelId,
      completed: completed ?? this.completed,
      bestStars: bestStars ?? this.bestStars,
      bestGems: bestGems ?? this.bestGems,
      bestPathLength: bestPathLength ?? this.bestPathLength,
      attempts: attempts ?? this.attempts,
    );
  }

  Map<String, dynamic> toJson() => {
        'levelId': levelId,
        'completed': completed,
        'bestStars': bestStars,
        'bestGems': bestGems,
        if (bestPathLength != null) 'bestPathLength': bestPathLength,
        'attempts': attempts,
      };

  factory LevelProgress.fromJson(Map<String, dynamic> json) {
    return LevelProgress(
      levelId: json['levelId'] as String,
      completed: json['completed'] as bool? ?? false,
      bestStars: json['bestStars'] as int? ?? 0,
      bestGems: json['bestGems'] as int? ?? 0,
      bestPathLength: json['bestPathLength'] as int?,
      attempts: json['attempts'] as int? ?? 0,
    );
  }
}
