import 'package:labyrinth_legends/game_engine/path/path_validation_error.dart';

/// Result of [PathValidator.validate] — facts only; session owns confirm outcome.
class PathValidationResult {
  const PathValidationResult({
    required this.isValid,
    this.errors = const [],
  });

  factory PathValidationResult.failure(PathValidationError error) {
    return PathValidationResult(isValid: false, errors: [error]);
  }

  final bool isValid;
  final List<PathValidationError> errors;

  static const valid = PathValidationResult(isValid: true);

  PathValidationError? get firstError => errors.isEmpty ? null : errors.first;

  /// Primary human-readable message for UI feedback (GP6 downstream).
  String? get message => firstError?.message;

  /// Index of the first invalid step, if applicable.
  int? get invalidIndex => firstError?.stepIndex;

  /// Concrete typed failure code — not inferred from [PathValidationError.ruleId].
  PathValidationErrorCode? get errorCode => firstError?.code;
}
