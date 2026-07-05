import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

/// Integration hook between gameplay UI and the pure Dart engine.
///
/// M2.1 holds a [GameplaySession] reference only — path drawing, validation,
/// and execution wiring belong to later milestones.
class GameplayController extends StateNotifier<GameplayShellState> {
  GameplayController(LevelDefinition level)
      : super(
          GameplayShellState(
            session: GameplaySession(level: level),
            phase: GameplayShellPhase.settling,
          ),
        ) {
    _initializeShell();
  }

  GameplaySession get session => state.session;

  void _initializeShell() {
    state = state.copyWith(phase: GameplayShellPhase.observation);
  }

  void pause() {
    if (state.phase == GameplayShellPhase.observation) {
      state = state.copyWith(
        phase: GameplayShellPhase.paused,
        isPausedOverlayVisible: true,
      );
    }
  }

  void resume() {
    if (state.phase == GameplayShellPhase.paused) {
      state = state.copyWith(
        phase: GameplayShellPhase.observation,
        isPausedOverlayVisible: false,
      );
    }
  }

  String get engineStatusLabel {
    return switch (state.phase) {
      GameplayShellPhase.settling => 'Settling',
      GameplayShellPhase.observation => 'Ready',
      GameplayShellPhase.paused => 'Paused',
    };
  }
}

final gameplayControllerProvider = StateNotifierProvider.autoDispose
    .family<GameplayController, GameplayShellState, LevelDefinition>(
  (ref, level) => GameplayController(level),
);
