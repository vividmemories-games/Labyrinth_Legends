import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/app/app.dart';
import 'package:labyrinth_legends/data/daily_level_builder.dart';
import 'package:labyrinth_legends/data/providers.dart';

void main() {
  testWidgets('App boots through splash into gameplay shell', (tester) async {
    final level = buildDailyLevel(1);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          levelByIdProvider('level_001').overrideWith((ref) async => level),
        ],
        child: const LabyrinthLegendsApp(),
      ),
    );
    await tester.pump();

    expect(find.text('Labyrinth Legends'), findsOneWidget);
    expect(find.text('Awakening the temple…'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1300));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Draw'), findsOneWidget);
    expect(find.text('Path drawing arrives in M2.2'), findsOneWidget);
  });
}
