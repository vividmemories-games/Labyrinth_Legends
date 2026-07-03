import 'package:labyrinth_legends/game_engine/validation/level_format_validation_error.dart';

/// Outcome of [LevelFormatValidator.validate].
class LevelFormatValidationResult {
  const LevelFormatValidationResult({
    required this.errors,
    this.warnings = const [],
  });

  final List<LevelFormatValidationError> errors;
  final List<LevelFormatValidationWarning> warnings;

  bool get isValid => errors.isEmpty;

  LevelFormatValidationResult merge(LevelFormatValidationResult other) {
    return LevelFormatValidationResult(
      errors: [...errors, ...other.errors],
      warnings: [...warnings, ...other.warnings],
    );
  }
}
