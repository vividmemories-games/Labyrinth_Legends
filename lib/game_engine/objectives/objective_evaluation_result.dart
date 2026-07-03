import 'package:labyrinth_legends/game_engine/objectives/objective_outcome.dart';

/// Factual objective assessment returned by [ObjectiveEvaluator].
///
/// [GameplaySession] applies lifecycle transitions from this result.
class ObjectiveEvaluationResult {
  const ObjectiveEvaluationResult({
    required this.outcome,
    this.reason,
  });

  const ObjectiveEvaluationResult.continueExecution()
      : this(outcome: ObjectiveOutcome.continueExecution);

  const ObjectiveEvaluationResult.won()
      : this(outcome: ObjectiveOutcome.won);

  const ObjectiveEvaluationResult.lost(String reason)
      : this(outcome: ObjectiveOutcome.lost, reason: reason);

  final ObjectiveOutcome outcome;
  final String? reason;

  bool get isContinue => outcome == ObjectiveOutcome.continueExecution;
  bool get isWon => outcome == ObjectiveOutcome.won;
  bool get isLost => outcome == ObjectiveOutcome.lost;
}
