import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/design_system/components/components.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

void main() {
  testWidgets('LLButton primary renders label', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LLButton(label: 'Play', onPressed: () {}),
        ),
      ),
    );
    expect(find.text('Play'), findsOneWidget);
  });

  testWidgets('LLCurrencyChip renders amount', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LLCurrencyChip(type: LLCurrencyType.coins, amount: 99),
        ),
      ),
    );
    expect(find.text('99'), findsOneWidget);
  });

  testWidgets('LLBadge locked variant', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LLBadge(label: 'Locked', variant: LLBadgeVariant.locked),
        ),
      ),
    );
    expect(find.text('Locked'), findsOneWidget);
  });

  test('LLColor tokens match design spec hex', () {
    expect(LLColor.ancientGold, const Color(0xFFD4A63A));
    expect(LLColor.energyCyan, const Color(0xFF00D9FF));
    expect(LLColor.templeBlack, const Color(0xFF080B12));
    expect(LLColor.emberRed, const Color(0xFFE85D5D));
    expect(LLColor.successGreen, const Color(0xFF4CD964));
  });

  test('LLAnimation duration tokens', () {
    expect(LLAnimation.fast, const Duration(milliseconds: 150));
    expect(LLAnimation.portalPulse, const Duration(milliseconds: 2000));
  });
}
