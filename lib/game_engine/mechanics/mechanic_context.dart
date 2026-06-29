import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

class MechanicContext {
  MechanicContext({
    Set<String>? collectedKeys,
    Set<String>? collectedRelics,
    Set<GridPosition>? collectedGemPositions,
    this.reachedExit = false,
    this.failed = false,
    this.failureReason,
  })  : collectedKeys = Set<String>.unmodifiable(
          collectedKeys ?? const {},
        ),
        collectedRelics = Set<String>.unmodifiable(
          collectedRelics ?? const {},
        ),
        collectedGemPositions = Set<GridPosition>.unmodifiable(
          collectedGemPositions ?? const {},
        );

  final Set<String> collectedKeys;
  final Set<String> collectedRelics;
  final Set<GridPosition> collectedGemPositions;
  final bool reachedExit;
  final bool failed;
  final String? failureReason;

  int get gemsCollected => collectedGemPositions.length;

  bool hasKey(String keyId) => collectedKeys.contains(keyId);

  bool hasRelic(String relicId) => collectedRelics.contains(relicId);

  MechanicContext copyWith({
    Set<String>? collectedKeys,
    Set<String>? collectedRelics,
    Set<GridPosition>? collectedGemPositions,
    bool? reachedExit,
    bool? failed,
    String? failureReason,
    bool clearFailureReason = false,
  }) {
    return MechanicContext(
      collectedKeys: collectedKeys ?? this.collectedKeys,
      collectedRelics: collectedRelics ?? this.collectedRelics,
      collectedGemPositions:
          collectedGemPositions ?? this.collectedGemPositions,
      reachedExit: reachedExit ?? this.reachedExit,
      failed: failed ?? this.failed,
      failureReason:
          clearFailureReason ? null : (failureReason ?? this.failureReason),
    );
  }
}
