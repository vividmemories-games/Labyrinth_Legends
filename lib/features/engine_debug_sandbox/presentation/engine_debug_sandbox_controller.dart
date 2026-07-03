import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_exception.dart';

class EngineDebugSandboxState {
  const EngineDebugSandboxState({
    this.isLoadingLevel = false,
    this.session,
    this.message,
    this.loadError,
  });

  final bool isLoadingLevel;
  final GameplaySession? session;
  final String? message;
  final String? loadError;

  LevelDefinition? get level => session?.level;
  RewardResult? get reward => session?.reward;

  GridPosition? get playerPosition {
    final currentSession = session;
    if (currentSession == null) {
      return null;
    }

    if (currentSession.phase == GameplayPhase.drawing) {
      if (currentSession.path.isNotEmpty) {
        return currentSession.path.last;
      }
      return currentSession.grid.findStart();
    }

    return currentSession.currentPosition ?? currentSession.grid.findStart();
  }

  String get sessionResult => switch (session?.phase) {
        GameplayPhase.won => 'won',
        GameplayPhase.lost => 'lost',
        GameplayPhase.executing => 'in progress',
        GameplayPhase.drawing => 'not started',
        null => 'not loaded',
      };

  EngineDebugSandboxState copyWith({
    bool? isLoadingLevel,
    GameplaySession? session,
    bool clearSession = false,
    String? message,
    bool clearMessage = false,
    String? loadError,
    bool clearLoadError = false,
  }) {
    return EngineDebugSandboxState(
      isLoadingLevel: isLoadingLevel ?? this.isLoadingLevel,
      session: clearSession ? null : (session ?? this.session),
      message: clearMessage ? null : (message ?? this.message),
      loadError: clearLoadError ? null : (loadError ?? this.loadError),
    );
  }
}

class EngineDebugSandboxController
    extends StateNotifier<EngineDebugSandboxState> {
  EngineDebugSandboxController(this._ref)
      : super(const EngineDebugSandboxState());

  final Ref _ref;

  Future<void> loadLevel001() async {
    state = state.copyWith(
      isLoadingLevel: true,
      clearLoadError: true,
      clearMessage: true,
    );

    try {
      final level = await _ref.read(levelRepositoryProvider).loadLevel(
            worldId: 'world_1',
            levelId: 'level_001',
          );
      state = EngineDebugSandboxState(
        session: GameplaySession(level: level),
        message: 'Loaded level_001',
      );
    } catch (error) {
      state = state.copyWith(
        isLoadingLevel: false,
        loadError: 'Failed to load level_001: $error',
        message: 'Level load failed',
      );
    }
  }

  void seedDraftPath() {
    final session = state.session;
    if (session == null) {
      return;
    }

    final start = session.grid.findStart();
    if (start == null) {
      state = state.copyWith(message: 'Loaded level has no start tile');
      return;
    }

    try {
      session.updateDraftPath([start]);
      state = state.copyWith(session: session, message: 'Draft reset to start');
    } on GameplaySessionException catch (error) {
      state = state.copyWith(session: session, message: error.message);
    }
  }

  void appendDraftPoint(GridPosition position) {
    final session = state.session;
    if (session == null) {
      return;
    }

    if (session.phase != GameplayPhase.drawing) {
      state = state.copyWith(message: 'Reset the session to draw a new path');
      return;
    }

    if (session.path.isEmpty && position != session.grid.findStart()) {
      state = state.copyWith(
        message: 'Press Draw Path or tap the start tile first',
      );
      return;
    }

    try {
      session.appendDraftPosition(position);
      state = state.copyWith(session: session, clearMessage: true);
    } on GameplaySessionException catch (error) {
      state = state.copyWith(session: session, message: error.message);
    }
  }

  void confirmPath() {
    final session = state.session;
    if (session == null) {
      return;
    }

    try {
      session.confirmPath();
      state = state.copyWith(
        session: session,
        message: 'Path confirmed',
        clearLoadError: true,
      );
    } on GameplaySessionException catch (error) {
      state = state.copyWith(
        session: session,
        message: session.statusMessage ?? error.message,
      );
    }
  }

  void executeNextStep() {
    final session = state.session;
    if (session == null) {
      return;
    }

    try {
      session.executeNextStep();
      state = state.copyWith(
        session: session,
        message: _runtimeMessage(session),
      );
    } on GameplaySessionException catch (error) {
      state = state.copyWith(
        session: session,
        message: session.statusMessage ?? error.message,
      );
    }
  }

  void runToCompletion() {
    final session = state.session;
    if (session == null) {
      return;
    }

    try {
      while (session.phase == GameplayPhase.executing) {
        session.executeNextStep();
      }
      state = state.copyWith(
        session: session,
        message: _runtimeMessage(session),
      );
    } on GameplaySessionException catch (error) {
      state = state.copyWith(
        session: session,
        message: session.statusMessage ?? error.message,
      );
    }
  }

  void resetSession() {
    final level = state.level;
    if (level == null) {
      return;
    }

    state = state.copyWith(
      session: GameplaySession(level: level),
      message: 'Session reset',
      clearLoadError: true,
    );
  }

  String _runtimeMessage(GameplaySession session) {
    final reward = session.reward;
    if (reward != null) {
      return 'Won with ${reward.stars} star(s)';
    }

    return session.statusMessage ??
        switch (session.phase) {
          GameplayPhase.won => 'Session won',
          GameplayPhase.lost => 'Session lost',
          GameplayPhase.executing => 'Step executed',
          GameplayPhase.drawing => 'Ready to draw path',
        };
  }
}

final engineDebugSandboxControllerProvider = StateNotifierProvider.autoDispose<
    EngineDebugSandboxController, EngineDebugSandboxState>(
  EngineDebugSandboxController.new,
);
