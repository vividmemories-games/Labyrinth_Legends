class PathValidationResult {
  const PathValidationResult({
    required this.isValid,
    this.message,
    this.invalidIndex,
  });

  final bool isValid;
  final String? message;
  final int? invalidIndex;

  static const valid = PathValidationResult(isValid: true);
}
