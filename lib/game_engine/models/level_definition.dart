import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class LevelObjectives {
  const LevelObjectives({
    this.reachExit = true,
    this.collectAllGems = false,
    this.minGems = 0,
  });

  final bool reachExit;
  final bool collectAllGems;
  final int minGems;

  Map<String, dynamic> toJson() => {
        'reachExit': reachExit,
        'collectAllGems': collectAllGems,
        'minGems': minGems,
      };

  factory LevelObjectives.fromJson(Map<String, dynamic> json) {
    return LevelObjectives(
      reachExit: json['reachExit'] as bool? ?? true,
      collectAllGems: json['collectAllGems'] as bool? ?? false,
      minGems: json['minGems'] as int? ?? 0,
    );
  }
}

class StarThresholds {
  const StarThresholds({
    required this.threeStars,
    required this.twoStars,
    required this.oneStar,
  });

  /// Maximum path length (inclusive) for each star tier. Lower is better.
  final int threeStars;
  final int twoStars;
  final int oneStar;

  Map<String, dynamic> toJson() => {
        'threeStars': threeStars,
        'twoStars': twoStars,
        'oneStar': oneStar,
      };

  factory StarThresholds.fromJson(Map<String, dynamic> json) {
    return StarThresholds(
      threeStars: json['threeStars'] as int,
      twoStars: json['twoStars'] as int,
      oneStar: json['oneStar'] as int,
    );
  }
}

class LevelDefinition {
  const LevelDefinition({
    required this.id,
    required this.name,
    required this.worldId,
    required this.grid,
    required this.objectives,
    required this.discoveryMode,
    required this.starThresholds,
    this.moveLimit,
  });

  final String id;
  final String name;
  final String worldId;
  final MazeGrid grid;
  final LevelObjectives objectives;
  final DiscoveryMode discoveryMode;
  final StarThresholds starThresholds;
  final int? moveLimit;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'worldId': worldId,
        'grid': grid.toJson(),
        'objectives': objectives.toJson(),
        'discoveryMode': discoveryMode.toJson(),
        'starThresholds': starThresholds.toJson(),
        if (moveLimit != null) 'moveLimit': moveLimit,
      };

  factory LevelDefinition.fromJson(Map<String, dynamic> json) {
    return LevelDefinition(
      id: json['id'] as String,
      name: json['name'] as String,
      worldId: json['worldId'] as String,
      grid: MazeGrid.fromJson(json['grid'] as Map<String, dynamic>),
      objectives: LevelObjectives.fromJson(
        json['objectives'] as Map<String, dynamic>,
      ),
      discoveryMode: DiscoveryMode.fromJson(
        json['discoveryMode'] as String? ?? 'full',
      ),
      starThresholds: StarThresholds.fromJson(
        json['starThresholds'] as Map<String, dynamic>,
      ),
      moveLimit: json['moveLimit'] as int?,
    );
  }
}
