import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/daily_level_builder.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_provider.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_screen.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

void main() {
  testWidgets('GameplayScreen hides control bar during execution', (tester) async {
    final level = buildDailyLevel(42);
    final executingState = GameplayUiState(
      session: GameplaySession(level: level),
      uiPhase: GameplayUiPhase.executing,
      executionIndex: 0,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          levelByIdProvider('daily_42').overrideWith((ref) async => level),
          gameplayControllerProvider(level).overrideWith(
            (ref) => _FixedGameplayController(ref, executingState),
          ),
        ],
        child: const MaterialApp(
          home: GameplayScreen(levelId: 'daily_42'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Undo'), findsNothing);
    expect(find.text('Go'), findsNothing);
  });

  testWidgets('GameplayScreen shows control bar while drawing', (tester) async {
    final level = buildDailyLevel(42);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          levelByIdProvider('daily_42').overrideWith((ref) async => level),
        ],
        child: const MaterialApp(
          home: GameplayScreen(levelId: 'daily_42'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Undo'), findsOneWidget);
    expect(find.text('Go'), findsOneWidget);
  });
}

class _FixedGameplayController extends GameplayController {
  _FixedGameplayController(Ref ref, GameplayUiState initial)
      : super(ref, initial.level) {
    state = initial;
  }
}
