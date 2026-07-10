import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/objective_card.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/resource_display.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_feedback.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_error.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

import 'fixtures/gem_level_fixture.dart';

LevelDefinition _simpleLevel() => levelRequiringAllGems();

GameplayShellState _shell({
  required LevelDefinition level,
  GameplayShellPhase phase = GameplayShellPhase.observation,
  GameplaySession? session,
  String? invalidInputMessage,
  String? primaryStatusMessage,
}) {
  return GameplayShellState(
    session: session ?? GameplaySession(level: level),
    phase: phase,
    invalidInputMessage: invalidInputMessage,
    primaryStatusMessage: primaryStatusMessage,
  );
}

void main() {
  group('GameplayShellFeedback', () {
    late LevelDefinition level;

    setUp(() {
      level = _simpleLevel();
    });

    test('planning feedback state when draft exists', () {
      final session = GameplaySession(level: level);
      session.updateDraftPath([const GridPosition(row: 1, col: 1)]);
      final shell = _shell(
        level: level,
        phase: GameplayShellPhase.planning,
        session: session,
      );

      expect(shell.feedbackState, GameplayFeedbackState.planning);
      expect(shell.interactionMode, GameplayInteractionMode.planning);
      expect(shell.objectiveCardState, ObjectiveCardState.focused);
    });

    test('path ready feedback when draft validates', () {
      final session = GameplaySession(level: level);
      session.updateDraftPath(gemLevelWinningPath);
      final shell = _shell(
        level: level,
        phase: GameplayShellPhase.planning,
        session: session,
      );

      expect(shell.canConfirmDraft, isTrue);
      expect(shell.feedbackState, GameplayFeedbackState.pathReady);
    });

    test('invalid input feedback state', () {
      final shell = _shell(
        level: level,
        invalidInputMessage: 'Move one tile at a time',
      );

      expect(shell.feedbackState, GameplayFeedbackState.invalidInput);
    });

    test('execution feedback state and traversed tiles', () {
      final session = GameplaySession(level: level);
      session.updateDraftPath(gemLevelWinningPath);
      session.confirmPath();
      session.executeNextStep();

      final shell = _shell(
        level: level,
        phase: GameplayShellPhase.executing,
        session: session,
      );

      expect(shell.feedbackState, GameplayFeedbackState.executing);
      expect(shell.interactionMode, GameplayInteractionMode.executing);
      expect(shell.objectiveCardState, ObjectiveCardState.updating);
      expect(
        shell.traversedPathPositions,
        contains(gemLevelWinningPath.first),
      );

      session.executeNextStep();
      final advanced = _shell(
        level: level,
        phase: GameplayShellPhase.executing,
        session: session,
      );
      expect(
        advanced.traversedPathPositions.length,
        greaterThanOrEqualTo(2),
      );
    });

    test('terminal won and lost feedback states', () {
      final won = _shell(
        level: level,
        phase: GameplayShellPhase.terminalWon,
      );
      final lost = _shell(
        level: level,
        phase: GameplayShellPhase.terminalLost,
      );

      expect(won.feedbackState, GameplayFeedbackState.terminalWon);
      expect(won.objectiveCardState, ObjectiveCardState.completed);
      expect(lost.feedbackState, GameplayFeedbackState.terminalLost);
      expect(lost.objectiveCardState, ObjectiveCardState.failed);
    });

    test('path cleared feedback state', () {
      final shell = _shell(
        level: level,
        primaryStatusMessage: 'Path cleared — plan a new route',
      );

      expect(shell.feedbackState, GameplayFeedbackState.pathCleared);
    });

    test('resource display emphasizes collected gems during execution', () {
      final session = GameplaySession(level: level);
      session.updateDraftPath(gemLevelWinningPath);
      session.confirmPath();
      session.executeNextStep();

      final shell = _shell(
        level: level,
        phase: GameplayShellPhase.executing,
        session: session,
      );

      if (shell.collectedGemCount > 0) {
        expect(shell.resourceDisplayState, ResourceDisplayState.updating);
      } else {
        expect(shell.resourceDisplayState, ResourceDisplayState.idle);
      }
    });

    test('board input disabled in terminal state', () {
      final shell = _shell(
        level: level,
        phase: GameplayShellPhase.terminalWon,
      );

      expect(shell.isBoardInputEnabled, isFalse);
    });

    test('lock blocked without key in draft path', () {
      final lockLevel = LevelDefinition.fromJson({
        'schemaVersion': 1,
        'id': 'level_lock',
        'name': 'Lock Level',
        'worldId': 'world_1',
        'discoveryMode': 'full',
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
          'width': 3,
          'height': 3,
          'cells': [
            [
              {'type': 'wall'},
              {'type': 'start'},
              {'type': 'wall'},
            ],
            [
              {'type': 'wall'},
              {'type': 'floor', 'keyId': 'bronze_key'},
              {'type': 'wall'},
            ],
            [
              {'type': 'wall'},
              {'type': 'floor', 'lockId': 'bronze_key'},
              {'type': 'wall'},
            ],
          ],
        },
      });

      final session = GameplaySession(level: lockLevel);
      session.updateDraftPath([
        const GridPosition(row: 0, col: 1),
      ]);
      final shell = _shell(
        level: lockLevel,
        phase: GameplayShellPhase.planning,
        session: session,
      );

      expect(shell.isLockBlockedAt(const GridPosition(row: 2, col: 1)), isTrue);

      session.updateDraftPath([
        const GridPosition(row: 0, col: 1),
        const GridPosition(row: 1, col: 1),
      ]);
      final withKey = _shell(
        level: lockLevel,
        phase: GameplayShellPhase.planning,
        session: session,
      );

      expect(
        withKey.isLockBlockedAt(const GridPosition(row: 2, col: 1)),
        isFalse,
      );
      expect(withKey.effectiveKeyIds, contains('bronze_key'));
    });

    test('draft path validation message when crossing locked gate', () {
      final lockLevel = LevelDefinition.fromJson({
        'schemaVersion': 1,
        'id': 'level_lock',
        'name': 'Lock Level',
        'worldId': 'world_1',
        'discoveryMode': 'full',
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
          'width': 4,
          'height': 3,
          'cells': [
            [
              {'type': 'wall'},
              {'type': 'start'},
              {'type': 'floor'},
              {'type': 'wall'},
            ],
            [
              {'type': 'wall'},
              {'type': 'floor'},
              {'type': 'floor', 'lockId': 'bronze_key'},
              {'type': 'wall'},
            ],
            [
              {'type': 'wall'},
              {'type': 'wall'},
              {'type': 'exit'},
              {'type': 'wall'},
            ],
          ],
        },
      });

      final session = GameplaySession(level: lockLevel);
      session.updateDraftPath([
        const GridPosition(row: 0, col: 1),
        const GridPosition(row: 1, col: 1),
        const GridPosition(row: 1, col: 2),
      ]);
      final shell = _shell(
        level: lockLevel,
        phase: GameplayShellPhase.planning,
        session: session,
      );

      expect(shell.canConfirmDraft, isFalse);
      expect(shell.draftPathValidationMessage, isNotNull);
      expect(shell.draftPathValidationMessage, contains('locked'));
      expect(
        shell.draftPathActionableValidationCode,
        PathValidationErrorCode.lockedWithoutKey,
      );
    });

    test('partial path without exit does not surface draft validation warning', () {
      final session = GameplaySession(level: level);
      session.updateDraftPath([
        const GridPosition(row: 1, col: 1),
        const GridPosition(row: 1, col: 2),
      ]);
      final shell = _shell(
        level: level,
        phase: GameplayShellPhase.planning,
        session: session,
      );

      expect(shell.canConfirmDraft, isFalse);
      expect(shell.draftPathValidationMessage, isNull);
      expect(shell.draftPathActionableValidationCode, isNull);
    });
  });
}
