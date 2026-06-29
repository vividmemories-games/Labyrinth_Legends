import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/app/app.dart';

void main() {
  testWidgets('App boots to home screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: LabyrinthLegendsApp()),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Labyrinth'), findsWidgets);
    expect(find.text('Play'), findsOneWidget);
  });
}
