import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/maze_render_poc/presentation/maze_render_poc_screen.dart';

void main() {
  testWidgets('maze render POC screen renders the board for level_001',
      (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: MazeRenderPocScreen()),
      ),
    );

    // Let the level asset load and the frame settle.
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.byKey(const Key('mazePocBoard')), findsOneWidget);
    expect(find.text('Failed to load level_001:'), findsNothing);

    // Theme swap keeps the board rendered.
    await tester.tap(find.byKey(const Key('mazePocTheme-amazon_jungle')));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));
    expect(find.byKey(const Key('mazePocBoard')), findsOneWidget);

    // Level switch keeps the board rendered.
    await tester.tap(find.byKey(const Key('mazePocLevel-level_010')));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));
    expect(find.byKey(const Key('mazePocBoard')), findsOneWidget);
  });
}
