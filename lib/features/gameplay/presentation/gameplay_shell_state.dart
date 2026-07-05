import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

/// Shell lifecycle phases for M2.1 — gameplay interaction arrives in later milestones.
enum GameplayShellPhase {
  settling,
  observation,
  paused,
}

/// UI shell state bound to [GameplaySession] without gameplay execution.
class GameplayShellState {
  const GameplayShellState({
    required this.session,
    this.phase = GameplayShellPhase.settling,
    this.isPausedOverlayVisible = false,
  });

  final GameplaySession session;
  final GameplayShellPhase phase;
  final bool isPausedOverlayVisible;

  LevelDefinition get level => session.level;

  GameplayShellState copyWith({
    GameplaySession? session,
    GameplayShellPhase? phase,
    bool? isPausedOverlayVisible,
  }) {
    return GameplayShellState(
      session: session ?? this.session,
      phase: phase ?? this.phase,
      isPausedOverlayVisible:
          isPausedOverlayVisible ?? this.isPausedOverlayVisible,
    );
  }
}

String objectiveLabelForLevel(LevelDefinition level) {
  final parts = <String>[];
  if (level.objectives.reachExit) {
    parts.add('Reach the exit');
  }
  if (level.objectives.collectAllGems) {
    parts.add('Collect all gems');
  } else if (level.objectives.minGems > 0) {
    parts.add('Collect at least ${level.objectives.minGems} gems');
  }
  return parts.isEmpty ? 'Complete the chamber' : parts.join(' · ');
}
