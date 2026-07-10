import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_controller.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_feedback.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

import '../game_engine/fixtures/level_001_fixture.dart';
import 'fixtures/gem_level_fixture.dart';

Future<void> _elapseStepDelay() =>
    Future<void>.delayed(GameConstants.pathStepDuration);

Future<void> _elapseAllSteps(int stepCount) async {
  for (var i = 0; i < stepCount; i++) {
    await _elapseStepDelay();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LevelDefinition level;

  setUpAll(() async {
    final raw = await rootBundle.loadString(
      'assets/levels/world_1/level_001.json',
    );
    level = parseLevel001FromJson(jsonDecode(raw) as Map<String, dynamic>);
  });

  group('GameplayController draft path', () {
    late GameplayController controller;

    setUp(() {
      controller = GameplayController(level);
    });

    tearDown(() {
      controller.close();
    });

    test('starts at observation with empty draft path', () {
      expect(controller.state.phase, GameplayShellPhase.observation);
      expect(controller.state.draftPath, isEmpty);
      expect(controller.state.canConfirmDraft, isFalse);
    });

    test('appends from start tile on first interaction', () {
      final start = level.grid.findStart()!;

      controller.handleTileInteraction(start);

      expect(controller.state.draftPath, [start]);
      expect(controller.state.phase, GameplayShellPhase.planning);
    });

    test('rejects non-adjacent tile with feedback', () {
      final start = level.grid.findStart()!;
      controller.handleTileInteraction(start);

      controller.handleTileInteraction(const GridPosition(row: 2, col: 0));

      expect(controller.state.draftPath, [start]);
      expect(controller.state.invalidInputMessage, isNotNull);
      expect(controller.state.invalidTarget, const GridPosition(row: 2, col: 0));
    });

    test('backtracks when dragging to previous tile', () {
      final start = level.grid.findStart()!;
      const next = GridPosition(row: 1, col: 2);

      controller.handleTileInteraction(start);
      controller.handleTileInteraction(next);
      controller.handleTileInteraction(start);

      expect(controller.state.draftPath, [start]);
    });

    test('clearDraftPath shows path cleared acknowledgement', () {
      final start = level.grid.findStart()!;
      controller.handleTileInteraction(start);
      controller.clearDraftPath();

      expect(controller.state.draftPath, isEmpty);
      expect(controller.state.phase, GameplayShellPhase.observation);
      expect(controller.state.primaryStatusMessage, contains('Path cleared'));
      expect(controller.state.feedbackState, GameplayFeedbackState.pathCleared);
    });

    test('canConfirmDraft when path reaches exit', () {
      for (final position in level001CanonicalPath) {
        controller.handleTileInteraction(position);
      }

      expect(controller.state.canConfirmDraft, isTrue);
    });
  });

  group('GameplayController execution', () {
    late GameplayController controller;

    setUp(() {
      controller = GameplayController(level);
      for (final position in level001CanonicalPath) {
        controller.handleTileInteraction(position);
      }
    });

    tearDown(() {
      controller.close();
    });

    test('onPrimaryAction confirms path and enters executing shell phase', () {
      controller.onPrimaryAction();

      expect(controller.state.session.phase, GameplayPhase.executing);
      expect(controller.state.phase, GameplayShellPhase.executing);
      expect(controller.state.session.draftPath, isEmpty);
      expect(controller.state.session.confirmedPath, level001CanonicalPath);
    });

    test('locks input during execution', () {
      controller.onPrimaryAction();
      final indexBefore = controller.state.session.executionPathIndex;

      controller.handleTileInteraction(const GridPosition(row: 1, col: 2));
      controller.clearDraftPath();

      expect(controller.state.session.executionPathIndex, indexBefore);
      expect(controller.state.isInteractionLocked, isTrue);
    });

    test('advances one engine step per path step duration', () async {
      controller.onPrimaryAction();
      expect(controller.state.session.executionPathIndex, 0);

      await _elapseStepDelay();
      expect(controller.state.session.executionPathIndex, 1);
      expect(controller.state.phase, GameplayShellPhase.executing);
    });

    test('consumes visual path as execution advances', () async {
      controller.onPrimaryAction();
      final initialRemaining = controller.state.visualPath.length;
      expect(initialRemaining, level001CanonicalPath.length);

      await _elapseStepDelay();
      expect(controller.state.visualPath.length, initialRemaining - 1);
      expect(
        controller.state.visualPath.first,
        level001CanonicalPath[1],
      );
    });

    test('explorer position follows engine current position', () async {
      controller.onPrimaryAction();
      expect(
        controller.state.explorerPosition,
        level001CanonicalPath.first,
      );

      await _elapseStepDelay();
      expect(
        controller.state.explorerPosition,
        level001CanonicalPath[1],
      );
    });

    test('enters terminal won state and does not restart', () async {
      controller.onPrimaryAction();

      await _elapseAllSteps(level001CanonicalPath.length - 1);

      expect(controller.state.phase, GameplayShellPhase.terminalWon);
      expect(controller.state.session.phase, GameplayPhase.won);
      expect(controller.state.isTerminal, isTrue);
      expect(controller.state.isInteractionLocked, isTrue);
      expect(controller.state.objectiveProgressLabel, 'Objectives complete');
      expect(
        controller.state.completionStatusCue(hasNextLevel: true),
        'Victory secured — syncing progress…',
      );
      expect(controller.hasNextLevel, isTrue);
      expect(controller.nextLevelId, 'level_002');
    });

    test('reports live exit objective progress during execution', () async {
      controller.onPrimaryAction();
      expect(controller.state.objectiveProgressLabel, 'Exit pending');

      await _elapseAllSteps(level001CanonicalPath.length - 1);

      expect(controller.state.objectiveProgressLabel, 'Objectives complete');
    });

    test('debug details include execution metrics during traversal', () async {
      controller.onPrimaryAction();
      await _elapseStepDelay();

      final details = controller.debugDetailsLabel;
      expect(details, contains('Phase: executing'));
      expect(details, contains('Mode: executing'));
      expect(details, contains('Feedback: executing'));
      expect(details, contains('Level: level_001'));
    });
  });

  group('GameplayController world state', () {
    test('removes collected gem from runtime grid during execution', () async {
      final gemLevel = levelRequiringAllGems();
      final controller = GameplayController(gemLevel);

      for (final position in gemLevelWinningPath) {
        controller.handleTileInteraction(position);
      }
      controller.onPrimaryAction();

      expect(
        controller.state.session.grid.cellAt(gemTilePosition).hasGem,
        isTrue,
      );

      await _elapseStepDelay();

      expect(
        controller.state.session.grid.cellAt(gemTilePosition).hasGem,
        isFalse,
      );
      expect(controller.state.collectedGemCount, 1);
      expect(controller.state.remainingGemCount, 0);
      expect(
        controller.state.objectiveProgressLabel,
        contains('1 collected'),
      );

      controller.close();
    });

    test('enters terminal lost when required gems are missed', () async {
      final gemLevel = levelRequiringAllGems();
      final controller = GameplayController(gemLevel);

      for (final position in gemLevelLosingPath) {
        controller.handleTileInteraction(position);
      }
      controller.onPrimaryAction();

      await _elapseAllSteps(gemLevelLosingPath.length - 1);

      expect(controller.state.phase, GameplayShellPhase.terminalLost);
      expect(controller.state.session.phase, GameplayPhase.lost);
      expect(controller.state.objectiveProgressLabel, contains('gems'));
      expect(
        controller.state.completionStatusCue(hasNextLevel: true),
        contains('try again when ready'),
      );

      controller.close();
    });

    test('debug overlay reports gem and terminal flags after completion', () async {
      final controller = GameplayController(level);
      for (final position in level001CanonicalPath) {
        controller.handleTileInteraction(position);
      }
      controller.onPrimaryAction();
      await _elapseAllSteps(level001CanonicalPath.length - 1);

      final details = controller.debugDetailsLabel;
      expect(details, contains('Phase: won'));
      expect(details, contains('Terminal: won'));
      expect(details, contains('Feedback: terminalWon'));
      expect(details, contains('Next: level_002'));

      controller.close();
    });
  });

  group('GameplayController terminal flow', () {
    test('tryAgain resets session and returns to observation', () async {
      final gemLevel = levelRequiringAllGems();
      final controller = GameplayController(gemLevel);
      final start = gemLevel.grid.findStart()!;

      for (final position in gemLevelLosingPath) {
        controller.handleTileInteraction(position);
      }
      controller.onPrimaryAction();
      await _elapseAllSteps(gemLevelLosingPath.length - 1);

      expect(controller.state.phase, GameplayShellPhase.terminalLost);

      controller.tryAgain();

      expect(controller.state.phase, GameplayShellPhase.observation);
      expect(controller.state.session.phase, GameplayPhase.drawing);
      expect(controller.state.draftPath, isEmpty);
      expect(controller.state.isInteractionLocked, isFalse);
      expect(controller.state.explorerPosition, start);
      expect(controller.state.retryCount, 1);
      expect(controller.state.collectedGemCount, 0);

      controller.close();
    });

    test('tryAgain is ignored when not terminal lost', () async {
      final controller = GameplayController(level);
      for (final position in level001CanonicalPath) {
        controller.handleTileInteraction(position);
      }
      controller.onPrimaryAction();
      await _elapseAllSteps(level001CanonicalPath.length - 1);

      expect(controller.state.phase, GameplayShellPhase.terminalWon);

      controller.tryAgain();

      expect(controller.state.phase, GameplayShellPhase.terminalWon);
      expect(controller.state.retryCount, 0);

      controller.close();
    });

    test('hasNextLevel is false for final validated level', () {
      final rawLevel = LevelDefinition.fromJson({
        'schemaVersion': 1,
        'id': 'level_010',
        'name': 'Tenth',
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
        'grid': level.grid.toJson(),
      });
      final controller = GameplayController(rawLevel);

      expect(controller.hasNextLevel, isFalse);
      expect(controller.nextLevelId, isNull);

      controller.close();
    });

    test('completionStatusCue for final level win', () {
      final terminalWon = GameplayShellState(
        session: GameplaySession(level: level),
        phase: GameplayShellPhase.terminalWon,
      );

      expect(
        terminalWon.completionStatusCue(hasNextLevel: false),
        'Final chamber cleared — syncing progress…',
      );
    });
  });
}
