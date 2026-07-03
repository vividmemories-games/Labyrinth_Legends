import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

/// Attempt facts owned by [GameplaySession] for one level run.
///
/// M1.2 skeleton: initial empty context. Execution workers update this in
/// later milestones via session-orchestrated [copyWith] transitions.
class GameplayAttemptContext {
  GameplayAttemptContext({
    Set<String>? collectedKeys,
    Set<String>? collectedRelics,
    Set<GridPosition>? collectedGemPositions,
    this.reachedExit = false,
    this.failed = false,
    this.failureReason,
  })  : collectedKeys = Set<String>.unmodifiable(collectedKeys ?? const {}),
        collectedRelics = Set<String>.unmodifiable(collectedRelics ?? const {}),
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

  GameplayAttemptContext copyWith({
    Set<String>? collectedKeys,
    Set<String>? collectedRelics,
    Set<GridPosition>? collectedGemPositions,
    bool? reachedExit,
    bool? failed,
    String? failureReason,
    bool clearFailureReason = false,
  }) {
    return GameplayAttemptContext(
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

  @override
  bool operator ==(Object other) {
    return other is GameplayAttemptContext &&
        _setEquals(other.collectedKeys, collectedKeys) &&
        _setEquals(other.collectedRelics, collectedRelics) &&
        _setEquals(other.collectedGemPositions, collectedGemPositions) &&
        other.reachedExit == reachedExit &&
        other.failed == failed &&
        other.failureReason == failureReason;
  }

  @override
  int get hashCode => Object.hash(
        Object.hashAllUnordered(collectedKeys),
        Object.hashAllUnordered(collectedRelics),
        Object.hashAllUnordered(collectedGemPositions),
        reachedExit,
        failed,
        failureReason,
      );
}

bool _setEquals<T>(Set<T> a, Set<T> b) {
  if (a.length != b.length) return false;
  for (final value in a) {
    if (!b.contains(value)) return false;
  }
  return true;
}
