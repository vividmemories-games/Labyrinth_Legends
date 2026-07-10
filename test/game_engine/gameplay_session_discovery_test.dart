import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

void main() {
  group('GameplaySession discovery wiring', () {
    test('fog mode reveals cells along the draft path', () {
      final session = GameplaySession(level: _fogLevel());
      session.appendDraftPosition(const GridPosition(row: 0, col: 0));
      session.appendDraftPosition(const GridPosition(row: 0, col: 1));

      expect(
        session.grid.cellAt(const GridPosition(row: 0, col: 1)).visibility,
        CellVisibility.visible,
      );
      expect(
        session.grid.cellAt(const GridPosition(row: 4, col: 6)).visibility,
        CellVisibility.fogged,
      );
    });

    test('relic gated mode reveals hidden cells after relic is on draft path', () {
      final session = GameplaySession(level: _relicLevel());
      session.appendDraftPosition(const GridPosition(row: 1, col: 0));
      session.appendDraftPosition(const GridPosition(row: 1, col: 1));
      session.appendDraftPosition(const GridPosition(row: 1, col: 2));

      expect(
        session.grid.cellAt(const GridPosition(row: 1, col: 3)).visibility,
        CellVisibility.visible,
      );
      expect(session.validateDraftPath().isValid, isFalse);

      session.appendDraftPosition(const GridPosition(row: 1, col: 3));
      session.appendDraftPosition(const GridPosition(row: 1, col: 4));

      expect(session.validateDraftPath().isValid, isTrue);
    });

    test('relic collection during execution reveals hidden passage', () {
      final session = GameplaySession(level: _relicLevel());
      final path = const [
        GridPosition(row: 1, col: 0),
        GridPosition(row: 1, col: 1),
        GridPosition(row: 1, col: 2),
        GridPosition(row: 1, col: 3),
        GridPosition(row: 1, col: 4),
      ];
      session.updateDraftPath(path);
      session.confirmPath();

      while (session.phase == GameplayPhase.executing) {
        session.executeNextStep();
      }

      expect(session.phase, GameplayPhase.won);
      expect(session.context.collectedRelics, contains('ancient_lens'));
      expect(
        session.grid.cellAt(const GridPosition(row: 1, col: 3)).visibility,
        CellVisibility.visible,
      );
    });
  });
}

LevelDefinition _fogLevel() {
  return LevelDefinition.fromJson({
    'schemaVersion': 2,
    'id': 'level_fog_test',
    'name': 'Fog Test',
    'worldId': 'world_1',
    'discoveryMode': 'fog',
    'moveLimit': null,
    'starThresholds': {
      'threeStars': 20,
      'twoStars': 24,
      'oneStar': 30,
    },
    'objectives': {
      'reachExit': true,
      'collectAllGems': false,
      'minGems': 0,
    },
    'grid': {
      'width': 7,
      'height': 5,
      'cells': [
        for (var row = 0; row < 5; row++)
          [
            for (var col = 0; col < 7; col++)
              if (row == 0 && col == 0)
                {'type': 'start'}
              else if (row == 4 && col == 6)
                {'type': 'exit'}
              else
                {'type': 'floor'},
          ],
      ],
    },
  });
}

LevelDefinition _relicLevel() {
  return LevelDefinition.fromJson({
    'schemaVersion': 2,
    'id': 'level_relic_test',
    'name': 'Relic Test',
    'worldId': 'world_1',
    'discoveryMode': 'relicGated',
    'moveLimit': null,
    'starThresholds': {
      'threeStars': 8,
      'twoStars': 10,
      'oneStar': 14,
    },
    'objectives': {
      'reachExit': true,
      'collectAllGems': false,
      'minGems': 0,
    },
    'grid': {
      'width': 5,
      'height': 3,
      'cells': [
        for (var row = 0; row < 3; row++)
          [
            for (var col = 0; col < 5; col++)
              if (row == 1 && col == 0)
                {
                  'type': 'start',
                  'edges': {'north': true, 'south': true, 'west': true},
                }
              else if (row == 1 && col == 1)
                {'type': 'floor'}
              else if (row == 1 && col == 2)
                {
                  'type': 'floor',
                  'hasRelic': true,
                  'relicId': 'ancient_lens',
                }
              else if (row == 1 && col == 3)
                {
                  'type': 'floor',
                  'hiddenUntilRelicId': 'ancient_lens',
                  'visibility': 'hidden',
                }
              else if (row == 1 && col == 4)
                {
                  'type': 'exit',
                  'edges': {'north': true, 'south': true, 'east': true},
                }
              else
                {
                  'type': 'floor',
                  'edges': {
                    'north': true,
                    'south': true,
                    'east': true,
                    'west': true,
                  },
                },
          ],
      ],
    },
  });
}
