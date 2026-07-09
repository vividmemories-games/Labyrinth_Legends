import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/app/app.dart';

void main() {
  testWidgets('App boots through splash into home shell', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: LabyrinthLegendsApp()),
    );
    await tester.pump();

    expect(find.text('Labyrinth Legends'), findsOneWidget);
    expect(find.text('Awakening the temple…'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1300));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('PLAY'), findsOneWidget);
    expect(find.text('DAILY CHALLENGE'), findsOneWidget);
    expect(find.text('SHOP'), findsOneWidget);
  });
}
