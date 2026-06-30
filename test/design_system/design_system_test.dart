import 'dart:ui' show Tristate;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/design_system/components/components.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

void main() {
  testWidgets('LLIconButton disabled is not tappable', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LLIconButton(
            icon: Icons.settings,
            tooltip: 'Settings',
            enabled: false,
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();
    expect(tapped, isFalse);
  });

  testWidgets('LLIconButton exposes semantics label from tooltip', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LLIconButton(
            icon: Icons.settings,
            tooltip: 'Settings',
            onPressed: () {},
          ),
        ),
      ),
    );

    final handle = tester.ensureSemantics();
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('Settings'), findsOneWidget);
    handle.dispose();
  });

  testWidgets('LLButton disabled is not tappable', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LLButton(
            label: 'Play',
            enabled: false,
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );
    await tester.tap(find.text('Play'));
    await tester.pump();
    expect(tapped, isFalse);
  });

  testWidgets('LLButton null onPressed reports disabled semantics', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LLButton(label: 'Play', onPressed: null),
        ),
      ),
    );

    final handle = tester.ensureSemantics();
    await tester.pumpAndSettle();

    final semantics = tester.getSemantics(find.bySemanticsLabel('Play'));
    expect(semantics.label, 'Play');
    expect(semantics.flagsCollection.isButton, isTrue);
    expect(semantics.flagsCollection.isEnabled, Tristate.isFalse);
    handle.dispose();
  });

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

  testWidgets('LLCurrencyChip tappable exposes button semantics', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LLCurrencyChip(
            type: LLCurrencyType.gems,
            amount: 12,
            onTap: () {},
          ),
        ),
      ),
    );

    final handle = tester.ensureSemantics();
    await tester.pumpAndSettle();

    final semantics = tester.getSemantics(find.bySemanticsLabel('12 gems'));
    expect(semantics.label, '12 gems');
    expect(semantics.flagsCollection.isButton, isTrue);
    expect(semantics.flagsCollection.isEnabled, Tristate.isTrue);
    handle.dispose();
  });

  testWidgets('LLCard tappable exposes button semantics', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LLCard(
            semanticsLabel: 'World pack',
            onTap: () {},
            child: const Text('Pack'),
          ),
        ),
      ),
    );

    final handle = tester.ensureSemantics();
    await tester.pumpAndSettle();

    final semantics = tester.getSemantics(find.bySemanticsLabel('World pack'));
    expect(semantics.label, 'World pack');
    expect(semantics.flagsCollection.isButton, isTrue);
    expect(semantics.flagsCollection.isEnabled, Tristate.isTrue);
    handle.dispose();
  });

  testWidgets('LLBottomBar disabled item reports disabled semantics', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LLBottomBar(
            items: [
              LLBottomBarItem(
                icon: Icons.home,
                label: 'Home',
                onTap: null,
              ),
            ],
          ),
        ),
      ),
    );

    final handle = tester.ensureSemantics();
    await tester.pumpAndSettle();

    final semantics = tester.getSemantics(find.bySemanticsLabel('Home'));
    expect(semantics.label, 'Home');
    expect(semantics.flagsCollection.isButton, isTrue);
    expect(semantics.flagsCollection.isEnabled, Tristate.isFalse);
    handle.dispose();
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
