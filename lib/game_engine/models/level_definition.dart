import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/models/tutorial_metadata.dart';

class LevelObjectives {
  const LevelObjectives({
    required this.reachExit,
    required this.collectAllGems,
    required this.minGems,
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
      reachExit: json['reachExit'] as bool,
      collectAllGems: json['collectAllGems'] as bool,
      minGems: json['minGems'] as int,
    );
  }
}

class StarThresholds {
  const StarThresholds({
    required this.threeStars,
    required this.twoStars,
    required this.oneStar,
  });

  /// Inclusive upper bounds on path node count per [Level_Format.md] §14.
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

/// Immutable level definition parsed from schema version 1 JSON.
///
/// Call [LevelFormatValidator.parse] — not [fromJson] directly — for authored
/// level files so structural rules in [Level_Format.md] §16 are enforced.
class LevelDefinition {
  const LevelDefinition({
    required this.schemaVersion,
    required this.id,
    required this.name,
    required this.worldId,
    required this.grid,
    required this.objectives,
    required this.discoveryMode,
    required this.starThresholds,
    this.moveLimit,
    this.tutorial,
  });

  final int schemaVersion;
  final String id;
  final String name;
  final String worldId;
  final MazeGrid grid;
  final LevelObjectives objectives;
  final DiscoveryMode discoveryMode;
  final StarThresholds starThresholds;
  final int? moveLimit;
  final TutorialMetadata? tutorial;

  Map<String, dynamic> toJson() => {
        'schemaVersion': schemaVersion,
        'id': id,
        'name': name,
        'worldId': worldId,
        'discoveryMode': discoveryMode.toJson(),
        'moveLimit': moveLimit,
        'objectives': objectives.toJson(),
        'starThresholds': starThresholds.toJson(),
        if (tutorial != null) 'tutorial': tutorial!.toJson(),
        'grid': grid.toJson(),
      };

  factory LevelDefinition.fromJson(Map<String, dynamic> json) {
    return LevelDefinition(
      schemaVersion: json['schemaVersion'] as int,
      id: json['id'] as String,
      name: json['name'] as String,
      worldId: json['worldId'] as String,
      grid: MazeGrid.fromJson(json['grid'] as Map<String, dynamic>),
      objectives: LevelObjectives.fromJson(
        json['objectives'] as Map<String, dynamic>,
      ),
      discoveryMode: DiscoveryMode.fromJson(json['discoveryMode'] as String),
      starThresholds: StarThresholds.fromJson(
        json['starThresholds'] as Map<String, dynamic>,
      ),
      moveLimit: json['moveLimit'] as int?,
      tutorial: json['tutorial'] == null
          ? null
          : TutorialMetadata.fromJson(
              json['tutorial'] as Map<String, dynamic>,
            ),
    );
  }
}
