import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

/// Test/tooling helper — runs confirm → execute until terminal phase.
///
/// Production UI must drive [GameplaySession.executeNextStep] directly.
void runConfirmedPathToCompletion(
  GameplaySession session,
  List<GridPosition> path,
) {
  session.updateDraftPath(path);
  session.confirmPath();
  while (session.phase == GameplayPhase.executing) {
    session.executeNextStep();
  }
}
