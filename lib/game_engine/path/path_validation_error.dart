import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

/// Typed path validation failure per [Level_Format.md] §16 PV rules and GP2.
class PathValidationError {
  const PathValidationError({
    required this.code,
    required this.message,
    this.stepIndex,
    this.position,
  });

  /// Concrete failure reason — authoritative for callers.
  final PathValidationErrorCode code;

  /// PV rule identifier derived from [code] for Level_Format cross-reference.
  String get ruleId => code.ruleId;

  final String message;
  final int? stepIndex;
  final GridPosition? position;

  @override
  String toString() => 'PathValidationError(${code.name}, $ruleId: $message)';
}

/// Failure reason codes for [PathValidationResult] per GP2 / Level_Format §16.
enum PathValidationErrorCode {
  emptyPath,
  missingStartCell,
  notAtStart,
  outOfBounds,
  notWalkable,
  hiddenCell,
  notAdjacent,
  lockedWithoutKey,
  missingExitCell,
  notAtExit,
}

extension PathValidationErrorCodeIds on PathValidationErrorCode {
  String get ruleId => switch (this) {
        PathValidationErrorCode.emptyPath => 'PV-01',
        PathValidationErrorCode.missingStartCell => 'PV-02',
        PathValidationErrorCode.notAtStart => 'PV-02',
        PathValidationErrorCode.outOfBounds => 'PV-04',
        PathValidationErrorCode.notWalkable => 'PV-06',
        PathValidationErrorCode.hiddenCell => 'PV-06',
        PathValidationErrorCode.notAdjacent => 'PV-04',
        PathValidationErrorCode.lockedWithoutKey => 'PV-07',
        PathValidationErrorCode.missingExitCell => 'PV-03',
        PathValidationErrorCode.notAtExit => 'PV-03',
      };
}
