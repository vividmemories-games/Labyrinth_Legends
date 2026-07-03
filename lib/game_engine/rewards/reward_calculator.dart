import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_state.dart';

/// Evaluates star outcome from terminal won session state per [Level_Format.md] §14.
///
/// Stars are derived exclusively from [confirmedPath] node count vs `starThresholds`.
/// Stateless — consumes session facts only; does not evaluate objectives.
class RewardCalculator {
  const RewardCalculator();

  /// Derives rewards from a terminal [GameplayPhase.won] session snapshot.
  RewardResult calculateFromTerminalSession(GameplaySessionState session) {
    if (session.phase != GameplayPhase.won) {
      throw ArgumentError(
        'Reward calculation requires phase won, got ${session.phase.name}',
      );
    }

    final confirmedPath = session.confirmedPath;
    if (confirmedPath == null || confirmedPath.isEmpty) {
      throw ArgumentError('Reward calculation requires a confirmed path');
    }

    final pathNodeCount = confirmedPath.length;
    final gemsCollected = session.attemptContext.gemsCollected;
    final thresholds = session.level.starThresholds;

    var stars = 0;
    if (pathNodeCount <= thresholds.threeStars) {
      stars = 3;
    } else if (pathNodeCount <= thresholds.twoStars) {
      stars = 2;
    } else if (pathNodeCount <= thresholds.oneStar) {
      stars = 1;
    }

    return RewardResult(
      stars: stars,
      gemsCollected: gemsCollected,
      pathNodeCount: pathNodeCount,
    );
  }
}
