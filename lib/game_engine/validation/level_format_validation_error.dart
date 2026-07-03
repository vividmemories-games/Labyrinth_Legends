/// Structural validation failure for [Level_Format.md] §16 rules.
class LevelFormatValidationError {
  const LevelFormatValidationError({
    required this.ruleId,
    required this.message,
    this.path,
  });

  /// Rule identifier from Level_Format.md (e.g. `LV-01`).
  final String ruleId;

  final String message;

  /// JSON path to the offending value (e.g. `grid.cells[0][1]`).
  final String? path;

  @override
  String toString() {
    final location = path == null ? '' : ' at $path';
    return '$ruleId$location: $message';
  }

  @override
  bool operator ==(Object other) {
    return other is LevelFormatValidationError &&
        other.ruleId == ruleId &&
        other.message == message &&
        other.path == path;
  }

  @override
  int get hashCode => Object.hash(ruleId, message, path);
}

/// Non-fatal validation note (e.g. LV-12 key/lock pairing).
class LevelFormatValidationWarning {
  const LevelFormatValidationWarning({
    required this.ruleId,
    required this.message,
    this.path,
  });

  final String ruleId;
  final String message;
  final String? path;

  @override
  String toString() {
    final location = path == null ? '' : ' at $path';
    return '$ruleId$location: $message';
  }
}

/// Thrown when [LevelFormatValidator.parse] receives invalid level JSON.
class LevelFormatValidationException implements Exception {
  LevelFormatValidationException(this.errors);

  final List<LevelFormatValidationError> errors;

  @override
  String toString() {
    return 'LevelFormatValidationException(${errors.map((e) => e.toString()).join('; ')})';
  }
}
