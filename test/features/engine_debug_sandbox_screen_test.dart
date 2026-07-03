import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/data/repositories/level_repository.dart';
import 'package:labyrinth_legends/features/engine_debug_sandbox/presentation/engine_debug_sandbox_screen.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

void main() {
  testWidgets('Engine debug sandbox can load, draw, step, and complete',
      (tester) async {
    final level = _testLevel();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          levelRepositoryProvider.overrideWithValue(_FakeLevelRepository(level)),
        ],
        child: const MaterialApp(
          home: EngineDebugSandboxScreen(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('engineSandboxLoadLevel001')));
    await tester.pumpAndSettle();

    expect(find.textContaining('drawing'), findsWidgets);

    await tester.tap(find.byKey(const Key('engineSandboxDrawPath')));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const Key('engineSandboxCell-1-2')));
    await tester.tap(find.byKey(const Key('engineSandboxCell-1-2')));
    await tester.ensureVisible(find.byKey(const Key('engineSandboxCell-1-3')));
    await tester.tap(find.byKey(const Key('engineSandboxCell-1-3')));
    await tester.ensureVisible(find.byKey(const Key('engineSandboxCell-2-3')));
    await tester.tap(find.byKey(const Key('engineSandboxCell-2-3')));
    await tester.ensureVisible(find.byKey(const Key('engineSandboxCell-3-3')));
    await tester.tap(find.byKey(const Key('engineSandboxCell-3-3')));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const Key('engineSandboxConfirmPath')));
    await tester.tap(find.byKey(const Key('engineSandboxConfirmPath')));
    await tester.pumpAndSettle();

    expect(find.text('executing'), findsOneWidget);

    await tester.ensureVisible(
      find.byKey(const Key('engineSandboxExecuteNextStep')),
    );
    await tester.tap(find.byKey(const Key('engineSandboxExecuteNextStep')));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsWidgets);

    await tester.ensureVisible(
      find.byKey(const Key('engineSandboxRunToCompletion')),
    );
    await tester.tap(find.byKey(const Key('engineSandboxRunToCompletion')));
    await tester.pumpAndSettle();

    expect(find.text('won'), findsWidgets);
    expect(find.text('3 star(s), nodes 5, gems 0'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const Key('engineSandboxResetSession')));
    await tester.tap(find.byKey(const Key('engineSandboxResetSession')));
    await tester.pumpAndSettle();

    expect(find.text('drawing'), findsOneWidget);
    expect(find.textContaining('Session reset'), findsOneWidget);
  });

  testWidgets('Engine debug sandbox shows engine validation feedback',
      (tester) async {
    final level = _testLevel();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          levelRepositoryProvider.overrideWithValue(_FakeLevelRepository(level)),
        ],
        child: const MaterialApp(
          home: EngineDebugSandboxScreen(),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('engineSandboxLoadLevel001')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('engineSandboxDrawPath')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('engineSandboxConfirmPath')));
    await tester.pumpAndSettle();

    expect(find.text('Path must end at the exit'), findsOneWidget);
    expect(find.text('drawing'), findsOneWidget);
  });
}

class _FakeLevelRepository extends LevelRepository {
  _FakeLevelRepository(this.level);

  final LevelDefinition level;

  @override
  Future<LevelDefinition> loadLevel({
    required String worldId,
    required String levelId,
  }) async {
    return level;
  }
}

LevelDefinition _testLevel() {
  return LevelDefinition.fromJson({
    'schemaVersion': 1,
    'id': 'level_001',
    'name': 'Sandbox Test Level',
    'worldId': 'world_1',
    'discoveryMode': 'full',
    'moveLimit': null,
    'starThresholds': {
      'threeStars': 6,
      'twoStars': 8,
      'oneStar': 10,
    },
    'objectives': {
      'reachExit': true,
      'collectAllGems': false,
      'minGems': 0,
    },
    'grid': {
      'width': 5,
      'height': 5,
      'cells': [
        [
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'wall'},
        ],
        [
          {'type': 'wall'},
          {'type': 'start'},
          {'type': 'floor'},
          {'type': 'floor'},
          {'type': 'wall'},
        ],
        [
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'floor'},
          {'type': 'wall'},
        ],
        [
          {'type': 'wall'},
          {'type': 'floor'},
          {'type': 'floor'},
          {'type': 'exit'},
          {'type': 'wall'},
        ],
        [
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'wall'},
          {'type': 'wall'},
        ],
      ],
    },
  });
}
