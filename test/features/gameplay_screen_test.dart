import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/daily_level_builder.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/theme/app_theme.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_controller.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_screen.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

void main() {
  testWidgets('GameplayScreen renders board and draft path controls',
      (tester) async {
    final level = buildDailyLevel(42);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          levelByIdProvider('daily_42').overrideWith((ref) async => level),
        ],
        child: MaterialApp(
          theme: buildLLAppTheme(),
          home: const GameplayScreen(levelId: 'daily_42'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Draw Path'), findsOneWidget);
    expect(find.text('UNDO'), findsOneWidget);
    expect(find.text('ERASE'), findsOneWidget);
    expect(find.text('HINT'), findsOneWidget);
    expect(find.text('MOVES'), findsOneWidget);
    expect(
        find.textContaining('Tap or drag from the explorer'), findsOneWidget);
    expect(find.byKey(const Key('explorer_marker')), findsOneWidget);
  });

  testWidgets('GameplayScreen shows paused overlay when shell is paused',
      (tester) async {
    final level = buildDailyLevel(42);
    final pausedState = GameplayShellState(
      session: GameplaySession(level: level),
      phase: GameplayShellPhase.paused,
      isPausedOverlayVisible: true,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          levelByIdProvider('daily_42').overrideWith((ref) async => level),
          gameplayControllerProvider(level).overrideWith(
            (ref) => _FixedGameplayController(level, pausedState),
          ),
        ],
        child: MaterialApp(
          theme: buildLLAppTheme(),
          home: const GameplayScreen(levelId: 'daily_42'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Paused'), findsOneWidget);
    expect(find.text('Resume'), findsOneWidget);
  });
}

class _FixedGameplayController extends GameplayController {
  _FixedGameplayController(super.level, GameplayShellState initial) {
    state = initial;
  }
}
