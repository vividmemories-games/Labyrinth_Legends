import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_execution_step_result.dart';
import 'package:labyrinth_legends/game_engine/path/path_executor.dart';
import 'package:labyrinth_legends/game_engine/session/step_resolution_result.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_exception.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_state.dart';

void main() {
  group('GameplaySession creation', () {
    test('starts in drawing with empty draft path', () {
      final session = GameplaySession(level: _testLevel());

      expect(session.phase, GameplayPhase.drawing);
      expect(session.state, isA<GameplaySessionState>());
      expect(session.draftPath, isEmpty);
      expect(session.confirmedPath, isNull);
      expect(session.path, isEmpty);
      expect(session.context.gemsCollected, 0);
    });
  });

  group('draft path', () {
    test('updateDraftPath replaces draft in drawing phase', () {
      final session = GameplaySession(level: _testLevel());
      final path = [
        const GridPosition(row: 1, col: 1),
        const GridPosition(row: 1, col: 2),
      ];

      session.updateDraftPath(path);

      expect(session.draftPath, path);
      expect(session.path, path);
    });

    test('appendDraftPosition adds to draft', () {
      final session = GameplaySession(level: _testLevel());
      session.appendDraftPosition(const GridPosition(row: 1, col: 1));
      session.appendDraftPosition(const GridPosition(row: 1, col: 2));

      expect(session.draftPath, hasLength(2));
    });

    test('resetDraftPath clears draft', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath([const GridPosition(row: 1, col: 1)]);

      session.resetDraftPath();

      expect(session.draftPath, isEmpty);
    });

    test('undoDraftPath removes last position', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath([
        const GridPosition(row: 1, col: 1),
        const GridPosition(row: 1, col: 2),
      ]);

      session.undoDraftPath();

      expect(session.draftPath, [const GridPosition(row: 1, col: 1)]);
    });

    test('undoDraftPath is no-op when draft is empty', () {
      final session = GameplaySession(level: _testLevel());

      expect(() => session.undoDraftPath(), returnsNormally);
      expect(session.draftPath, isEmpty);
    });

    test('draft mutations throw when not in drawing phase', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath(_validPathToExit());
      session.confirmPath();

      expect(
        () => session.updateDraftPath([const GridPosition(row: 1, col: 1)]),
        throwsA(isA<GameplaySessionException>()),
      );
      expect(() => session.resetDraftPath(), throwsA(isA<GameplaySessionException>()));
      expect(
        () => session.appendDraftPosition(const GridPosition(row: 1, col: 1)),
        throwsA(isA<GameplaySessionException>()),
      );
      expect(() => session.undoDraftPath(), throwsA(isA<GameplaySessionException>()));
    });
  });

  group('confirm path', () {
    test('confirmPath moves to executing and freezes path', () {
      final session = GameplaySession(level: _testLevel());
      final path = _validPathToExit();
      session.updateDraftPath(path);

      session.confirmPath();

      expect(session.phase, GameplayPhase.executing);
      expect(session.confirmedPath, path);
      expect(session.draftPath, isEmpty);
      expect(session.path, path);
    });

    test('confirmed path list is immutable via session state', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath(_validPathToExit());
      session.confirmPath();

      final confirmed = session.confirmedPath!;
      expect(
        () => confirmed.add(const GridPosition(row: 2, col: 2)),
        throwsA(isA<UnsupportedError>()),
      );
    });

    test('confirmPath rejects empty draft', () {
      final session = GameplaySession(level: _testLevel());

      expect(
        () => session.confirmPath(),
        throwsA(
          predicate<GameplaySessionException>(
            (e) => e.code == GameplaySessionExceptionCode.confirmPath,
          ),
        ),
      );
    });

    test('confirmPath rejects when not in drawing phase', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath(_validPathToExit());
      session.confirmPath();

      expect(() => session.confirmPath(), throwsA(isA<GameplaySessionException>()));
    });

    test('confirmPath rejects invalid path and stays in drawing', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath([
        const GridPosition(row: 1, col: 1),
        const GridPosition(row: 1, col: 2),
      ]);

      expect(() => session.confirmPath(), throwsA(isA<GameplaySessionException>()));

      expect(session.phase, GameplayPhase.drawing);
      expect(session.confirmedPath, isNull);
      expect(session.statusMessage, contains('exit'));
    });

    test('validateDraftPath delegates to PathValidator', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath(_validPathToExit());

      expect(session.validateDraftPath().isValid, isTrue);
    });
  });

  group('execution', () {
    test('executeNextStep advances one tile at a time', () {
      final session = GameplaySession(level: _testLevel());
      final path = _validPathToExit();
      session.updateDraftPath(path);
      session.confirmPath();

      expect(session.currentPosition, path.first);
      expect(session.executionPathIndex, 0);

      final step1 = session.executeNextStep();
      expect(step1.pathComplete, isFalse);
      expect(step1.position, path[1]);
      expect(session.executionPathIndex, 1);
      expect(session.phase, GameplayPhase.executing);

      final step2 = session.executeNextStep();
      expect(step2.position, path[2]);
      expect(session.executionPathIndex, 2);
    });

    test('executeNextStep stops cleanly at end of path', () {
      final session = GameplaySession(level: _testLevel());
      final path = _validPathToExit();
      session.updateDraftPath(path);
      session.confirmPath();

      // Each call moves one tile; the call that reaches the final node completes.
      for (var i = 0; i < path.length - 2; i++) {
        final step = session.executeNextStep();
        expect(step.pathComplete, isFalse);
        expect(session.executionComplete, isFalse);
      }

      final finalStep = session.executeNextStep();
      expect(finalStep.pathComplete, isTrue);
      expect(finalStep.from, path[path.length - 2]);
      expect(finalStep.position, path.last);
      expect(session.executionPathIndex, path.length - 1);
      expect(session.executionComplete, isTrue);
      expect(session.phase, GameplayPhase.won);
      expect(session.context.reachedExit, isTrue);

      expect(
        () => session.executeNextStep(),
        throwsA(isA<GameplaySessionException>()),
      );
    });

    test('final movement step marks complete without extra tick', () {
      final session = GameplaySession(level: _testLevel());
      final path = _validPathToExit();
      session.updateDraftPath(path);
      session.confirmPath();

      // Advance to the penultimate node.
      for (var i = 0; i < path.length - 2; i++) {
        session.executeNextStep();
      }

      expect(session.executionComplete, isFalse);
      expect(session.executionPathIndex, path.length - 2);

      final lastMove = session.executeNextStep();
      expect(lastMove.pathComplete, isTrue);
      expect(session.executionComplete, isTrue);
      expect(session.phase, GameplayPhase.won);
    });

    test('deterministic step-by-step execution', () {
      final sessionA = GameplaySession(level: _testLevel());
      final sessionB = GameplaySession(level: _testLevel());
      final path = _validPathToExit();

      for (final s in [sessionA, sessionB]) {
        s.updateDraftPath(path);
        s.confirmPath();
      }

      while (!sessionA.executionComplete) {
        final a = sessionA.executeNextStep();
        final b = sessionB.executeNextStep();
        expect(a.pathIndex, b.pathIndex);
        expect(a.position, b.position);
        expect(a.pathComplete, b.pathComplete);
        expect(a.from, b.from);
        expect(a.attemptContext, b.attemptContext);
      }

      expect(sessionA.executionPathIndex, sessionB.executionPathIndex);
      expect(sessionA.executionComplete, sessionB.executionComplete);
      expect(sessionA.context, sessionB.context);
      expect(sessionA.phase, sessionB.phase);
    });

    test('executeNextStep rejects when not executing', () {
      final session = GameplaySession(level: _testLevel());

      expect(
        () => session.executeNextStep(),
        throwsA(
          predicate<GameplaySessionException>(
            (e) => e.code == GameplaySessionExceptionCode.executeNextStep,
          ),
        ),
      );
    });

    test('transitions to won when exit reached and objectives met', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath(_validPathToExit());
      session.confirmPath();

      while (session.phase == GameplayPhase.executing) {
        session.executeNextStep();
      }

      expect(session.context.reachedExit, isTrue);
      expect(session.phase, GameplayPhase.won);
      expect(session.reward, isNotNull);
      expect(session.reward!.pathNodeCount, _validPathToExit().length);
      expect(session.reward!.stars, greaterThan(0));
    });

    test('transitions to lost when execution records failure', () {
      final session = GameplaySession(
        level: _testLevel(),
        pathExecutor: _FailingPathExecutor(),
      );
      session.updateDraftPath(_validPathToExit());
      session.confirmPath();

      final step = session.executeNextStep();

      expect(step.pathComplete, isFalse);
      expect(session.phase, GameplayPhase.lost);
      expect(session.statusMessage, isNotNull);
    });

    test('transitions to lost when path completes without required gems', () {
      final session = GameplaySession(level: _levelRequiringAllGems());
      session.updateDraftPath(_pathSkippingGem());
      session.confirmPath();

      while (session.phase == GameplayPhase.executing) {
        session.executeNextStep();
      }

      expect(session.phase, GameplayPhase.lost);
      expect(session.statusMessage, contains('gems'));
    });
  });

  group('restart', () {
    test('restart returns session to initial drawing state', () {
      final session = GameplaySession(level: _testLevel());
      session.updateDraftPath(_validPathToExit());
      session.confirmPath();

      session.restart();

      expect(session.phase, GameplayPhase.drawing);
      expect(session.draftPath, isEmpty);
      expect(session.confirmedPath, isNull);
    });
  });

  group('immutable snapshots', () {
    test('state reference changes after mutations', () {
      final session = GameplaySession(level: _testLevel());
      final initial = session.state;

      session.appendDraftPosition(const GridPosition(row: 1, col: 1));

      expect(session.state, isNot(same(initial)));
      expect(initial.draftPath, isEmpty);
      expect(session.state.draftPath, isNotEmpty);
    });

    test('attempt context collections cannot be mutated externally', () {
      final mutableKeys = {'bronze_key'};
      final context = GameplayAttemptContext(collectedKeys: mutableKeys);
      mutableKeys.add('silver_key');

      expect(context.collectedKeys, {'bronze_key'});
      expect(
        () => context.collectedKeys.add('gold_key'),
        throwsA(isA<UnsupportedError>()),
      );

      final session = GameplaySession(level: _testLevel());
      final stateContext = session.context;
      expect(
        () => stateContext.collectedKeys.add('orphan'),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}

List<GridPosition> _validPathToExit() {
  return const [
    GridPosition(row: 1, col: 1),
    GridPosition(row: 1, col: 2),
    GridPosition(row: 1, col: 3),
    GridPosition(row: 2, col: 3),
    GridPosition(row: 3, col: 3),
  ];
}

List<GridPosition> _pathSkippingGem() {
  return const [
    GridPosition(row: 1, col: 1),
    GridPosition(row: 1, col: 2),
    GridPosition(row: 1, col: 3),
    GridPosition(row: 2, col: 3),
    GridPosition(row: 3, col: 3),
  ];
}

class _FailingPathExecutor extends PathExecutor {
  const _FailingPathExecutor();

  @override
  PathExecutionStepResult executeStep({
    required MazeGrid grid,
    required List<GridPosition> path,
    required int currentPathIndex,
    required GameplayAttemptContext attemptContext,
  }) {
    final step = super.executeStep(
      grid: grid,
      path: path,
      currentPathIndex: currentPathIndex,
      attemptContext: attemptContext,
    );
    if (step.pathComplete || step.resolution == null) {
      return step;
    }
    return PathExecutionStepResult.moved(
      from: step.from!,
      to: step.position,
      pathIndex: step.pathIndex,
      resolution: StepResolutionResult(
        attemptContext: step.resolution!.attemptContext.copyWith(
          failed: true,
          failureReason: 'Locked gate requires key: bronze_key',
        ),
        grid: step.resolution!.grid,
      ),
    );
  }
}

LevelDefinition _levelRequiringAllGems() {
  return LevelDefinition.fromJson({
    'schemaVersion': 1,
    'id': 'level_gems',
    'name': 'Gem Level',
    'worldId': 'world_1',
    'discoveryMode': 'full',
    'moveLimit': null,
    'starThresholds': {
      'threeStars': 10,
      'twoStars': 12,
      'oneStar': 14,
    },
    'objectives': {
      'reachExit': true,
      'collectAllGems': true,
      'minGems': 0,
    },
    'grid': {
      'width': 5,
      'height': 5,
      'cells': [
        for (var row = 0; row < 5; row++)
          [
            for (var col = 0; col < 5; col++)
              if (row == 0 || row == 4 || col == 0 || col == 4)
                {'type': 'wall'}
              else if (row == 1 && col == 1)
                {'type': 'start'}
              else if (row == 2 && col == 1)
                {'type': 'floor', 'hasGem': true}
              else if (row == 3 && col == 3)
                {'type': 'exit'}
              else
                {'type': 'floor'},
          ],
      ],
    },
  });
}

LevelDefinition _testLevel() {
  return LevelDefinition.fromJson({
    'schemaVersion': 1,
    'id': 'level_001',
    'name': 'Test Level',
    'worldId': 'world_1',
    'discoveryMode': 'full',
    'moveLimit': null,
    'starThresholds': {
      'threeStars': 10,
      'twoStars': 12,
      'oneStar': 14,
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
        for (var row = 0; row < 5; row++)
          [
            for (var col = 0; col < 5; col++)
              if (row == 0 || row == 4 || col == 0 || col == 4)
                {'type': 'wall'}
              else if (row == 1 && col == 1)
                {'type': 'start'}
              else if (row == 3 && col == 3)
                {'type': 'exit'}
              else
                {'type': 'floor'},
          ],
      ],
    },
  });
}
