/// Thrown when a [GameplaySession] lifecycle operation is invalid for the
/// current phase or not yet supported by the engine.
class GameplaySessionException implements Exception {
  const GameplaySessionException(this.message, {this.code});

  final String message;
  final GameplaySessionExceptionCode? code;

  factory GameplaySessionException.invalidPhase({
    required GameplaySessionExceptionCode operation,
    required String currentPhase,
  }) {
    return GameplaySessionException(
      'Cannot ${operation.label} while phase is $currentPhase',
      code: operation,
    );
  }

  @override
  String toString() => 'GameplaySessionException: $message';
}

enum GameplaySessionExceptionCode {
  updateDraftPath,
  resetDraftPath,
  appendDraftPath,
  undoDraftPath,
  confirmPath,
  executeNextStep;

  String get label => switch (this) {
        updateDraftPath => 'update draft path',
        resetDraftPath => 'reset draft path',
        appendDraftPath => 'append to draft path',
        undoDraftPath => 'undo draft path',
        confirmPath => 'confirm path',
        executeNextStep => 'execute next step',
      };
}
