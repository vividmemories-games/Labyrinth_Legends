import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/path/path_validator.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

import 'helpers/session_test_helpers.dart';
import 'fixtures/level_001_fixture.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LevelDefinition level;

  setUpAll(() async {
    final raw = await rootBundle.loadString(
      'assets/levels/world_1/level_001.json',
    );
    level = parseLevel001FromJson(jsonDecode(raw) as Map<String, dynamic>);
  });

  group('level_001 fixture', () {
    test('canonical path validates against level grid', () {
      const validator = PathValidator();
      final result = validator.validate(
        grid: level.grid,
        path: level001CanonicalPath,
        requireExit: level.objectives.reachExit,
      );

      expect(result.isValid, isTrue, reason: result.message);
    });
  });

  group('end-to-end pipeline', () {
    test('confirm → execute → evaluate → reward completes level_001', () {
      final session = GameplaySession(level: level);
      runConfirmedPathToCompletion(session, level001CanonicalPath);

      expect(session.phase, GameplayPhase.won);
      expect(session.context.reachedExit, isTrue);
      expect(session.executionComplete, isTrue);
      expect(session.reward, isNotNull);
      expect(session.reward!.stars, level001ExpectedStars);
      expect(session.reward!.pathNodeCount, level001ExpectedPathNodeCount);
      expect(session.reward!.gemsCollected, 0);
    });
  });

  group('deterministic replay', () {
    test('identical inputs produce identical terminal session snapshots', () {
      final sessionA = GameplaySession(level: level);
      final sessionB = GameplaySession(level: level);

      runConfirmedPathToCompletion(sessionA, level001CanonicalPath);
      runConfirmedPathToCompletion(sessionB, level001CanonicalPath);

      expect(sessionA.phase, sessionB.phase);
      expect(sessionA.context, sessionB.context);
      expect(sessionA.executionPathIndex, sessionB.executionPathIndex);
      expect(sessionA.executionComplete, sessionB.executionComplete);
      expect(sessionA.reward, sessionB.reward);
      expect(sessionA.confirmedPath, sessionB.confirmedPath);
    });

    test('step-by-step replay matches batch completion', () {
      final batch = GameplaySession(level: level);
      runConfirmedPathToCompletion(batch, level001CanonicalPath);

      final stepped = GameplaySession(level: level);
      stepped.updateDraftPath(level001CanonicalPath);
      stepped.confirmPath();

      final stepSnapshots = <GameplayPhase>[];
      while (stepped.phase == GameplayPhase.executing) {
        stepped.executeNextStep();
        stepSnapshots.add(stepped.phase);
      }

      expect(stepped.phase, batch.phase);
      expect(stepped.reward, batch.reward);
      expect(stepped.context, batch.context);
    });
  });
}
