import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/validation/level_format_validation_error.dart';
import 'package:labyrinth_legends/game_engine/validation/level_format_validator.dart';

void main() {
  const validator = LevelFormatValidator();

  TestWidgetsFlutterBinding.ensureInitialized();

  group('valid level fixtures', () {
    test('validates and parses level_001.json from assets', () async {
      final raw = await rootBundle.loadString(
        'assets/levels/world_1/level_001.json',
      );
      final json = jsonDecode(raw) as Map<String, dynamic>;

      final result = validator.validate(
        json,
        expectedLevelId: 'level_001',
        expectedWorldId: 'world_1',
      );

      expect(result.isValid, isTrue, reason: result.errors.toString());
      final level = validator.parse(
        json,
        expectedLevelId: 'level_001',
        expectedWorldId: 'world_1',
      );
      expect(level.schemaVersion, 1);
      expect(level.id, 'level_001');
      expect(level.grid.findStart(), isNotNull);
      expect(level.grid.findExit(), isNotNull);
    });

    test('validates level_002 and level_003', () async {
      for (final id in ['level_002', 'level_003']) {
        final raw = await rootBundle.loadString(
          'assets/levels/world_1/$id.json',
        );
        final json = jsonDecode(raw) as Map<String, dynamic>;
        final result = validator.validate(
          json,
          expectedLevelId: id,
          expectedWorldId: 'world_1',
        );
        expect(result.isValid, isTrue, reason: '$id: ${result.errors}');
      }
    });

    test('parses minimal valid inline level', () {
      final json = _minimalValidLevel();
      final level = validator.parse(json);
      expect(level.objectives.reachExit, isTrue);
      expect(level.grid.cellAt(level.grid.findStart()!).type, CellType.start);
    });
  });

  group('LV-01 schemaVersion', () {
    test('rejects missing schemaVersion', () {
      final json = _minimalValidLevel()..remove('schemaVersion');
      final result = validator.validate(json);
      expect(result.isValid, isFalse);
      expect(result.errors.single.ruleId, 'LV-01');
    });

    test('rejects non-integer schemaVersion', () {
      final json = _minimalValidLevel()..['schemaVersion'] = '1';
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-01'), isTrue);
    });
  });

  group('LV-02 id', () {
    test('rejects invalid id pattern', () {
      final json = _minimalValidLevel()..['id'] = 'bad_id';
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-02'), isTrue);
    });

    test('rejects id mismatch with expectedLevelId', () {
      final json = _minimalValidLevel();
      final result = validator.validate(
        json,
        expectedLevelId: 'level_999',
      );
      expect(result.errors.any((e) => e.ruleId == 'LV-02'), isTrue);
    });
  });

  group('LV-03 worldId', () {
    test('rejects worldId mismatch', () {
      final json = _minimalValidLevel();
      final result = validator.validate(
        json,
        expectedWorldId: 'world_2',
      );
      expect(result.errors.any((e) => e.ruleId == 'LV-03'), isTrue);
    });
  });

  group('LV-09 starThresholds', () {
    test('rejects unordered thresholds', () {
      final json = _minimalValidLevel()
        ..['starThresholds'] = {
          'threeStars': 20,
          'twoStars': 15,
          'oneStar': 10,
        };
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-09'), isTrue);
    });
  });

  group('LV-10 reachExit', () {
    test('rejects reachExit false', () {
      final json = _minimalValidLevel()
        ..['objectives'] = {
          'reachExit': false,
          'collectAllGems': false,
          'minGems': 0,
        };
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-10'), isTrue);
    });
  });

  group('LV-11 collectAllGems', () {
    test('rejects collectAllGems without gem cells', () {
      final json = _minimalValidLevel()
        ..['objectives'] = {
          'reachExit': true,
          'collectAllGems': true,
          'minGems': 0,
        };
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-11'), isTrue);
    });
  });

  group('LV-13 perimeter walls', () {
    test('rejects non-wall perimeter cell', () {
      final json = _minimalValidLevel();
      final grid = Map<String, dynamic>.from(json['grid'] as Map);
      final cells = (grid['cells'] as List)
          .map((row) => List<dynamic>.from(row as List))
          .toList();
      cells[0] = List<dynamic>.from(cells[0]);
      cells[0][0] = {'type': 'floor'};
      grid['cells'] = cells;
      json['grid'] = grid;
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-13'), isTrue);
    });
  });

  group('LV-14 moveLimit', () {
    test('rejects non-null moveLimit', () {
      final json = _minimalValidLevel()..['moveLimit'] = 5;
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-14'), isTrue);
    });
  });

  group('LV-15 unknown keys', () {
    test('rejects unknown top-level key', () {
      final json = _minimalValidLevel()..['typoField'] = true;
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-15'), isTrue);
    });

    test('rejects misspelled starThresholds key', () {
      final json = _minimalValidLevel()
        ..remove('starThresholds')
        ..['starThreshholds'] = {
          'threeStars': 10,
          'twoStars': 12,
          'oneStar': 14,
        };
      final result = validator.validate(json);
      expect(result.isValid, isFalse);
    });
  });

  group('LV-07 / LV-08 start and exit', () {
    test('rejects missing start', () {
      final json = _minimalValidLevel();
      final grid = Map<String, dynamic>.from(json['grid'] as Map);
      final cells = (grid['cells'] as List)
          .map((row) => List<dynamic>.from(row as List))
          .toList();
      cells[1] = List<dynamic>.from(cells[1]);
      cells[1][1] = {'type': 'floor'};
      grid['cells'] = cells;
      json['grid'] = grid;
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.ruleId == 'LV-07'), isTrue);
    });
  });

  group('parse', () {
    test('throws LevelFormatValidationException on invalid json', () {
      final json = _minimalValidLevel()..remove('schemaVersion');
      expect(
        () => validator.parse(json),
        throwsA(isA<LevelFormatValidationException>()),
      );
    });
  });

  group('LV-12 warnings', () {
    test('warns when keyId has no matching lockId', () {
      final json = _minimalValidLevel();
      final grid = Map<String, dynamic>.from(json['grid'] as Map);
      final cells = (grid['cells'] as List)
          .map((row) => List<dynamic>.from(row as List))
          .toList();
      cells[1] = List<dynamic>.from(cells[1]);
      cells[1][2] = {'type': 'floor', 'keyId': 'orphan_key'};
      grid['cells'] = cells;
      json['grid'] = grid;
      final result = validator.validate(json);
      expect(result.isValid, isTrue);
      expect(result.warnings.any((w) => w.ruleId == 'LV-12'), isTrue);
    });
  });

  group('required top-level fields', () {
    test('rejects missing name', () {
      final json = _minimalValidLevel()..remove('name');
      final result = validator.validate(json);
      expect(result.isValid, isFalse);
      expect(
        result.errors.any((e) => e.path == 'name' && e.ruleId == 'LV-15'),
        isTrue,
      );
    });

    test('rejects empty name', () {
      final json = _minimalValidLevel()..['name'] = '';
      final result = validator.validate(json);
      expect(result.errors.any((e) => e.path == 'name'), isTrue);
    });
  });

  group('cell modifier types', () {
    test('rejects hasGem string instead of boolean', () {
      final json = _minimalValidLevel();
      _setCell(json, row: 1, col: 2, cell: {'type': 'floor', 'hasGem': 'true'});
      final result = validator.validate(json);
      expect(result.isValid, isFalse);
      expect(
        result.errors.any((e) => e.path == 'grid.cells[1][2].hasGem'),
        isTrue,
      );
    });

    test('rejects numeric keyId', () {
      final json = _minimalValidLevel();
      _setCell(json, row: 1, col: 2, cell: {'type': 'floor', 'keyId': 3});
      final result = validator.validate(json);
      expect(
        result.errors.any((e) => e.path == 'grid.cells[1][2].keyId'),
        isTrue,
      );
    });

    test('rejects invalid visibility value', () {
      final json = _minimalValidLevel();
      _setCell(
        json,
        row: 1,
        col: 2,
        cell: {'type': 'floor', 'visibility': 'invisible'},
      );
      final result = validator.validate(json);
      expect(
        result.errors.any((e) => e.path == 'grid.cells[1][2].visibility'),
        isTrue,
      );
    });
  });

  group('tutorial metadata types', () {
    test('rejects malformed tutorial fields', () {
      final json = _minimalValidLevel()
        ..['tutorial'] = {
          'band': 1,
          'sequence': 'one',
          'teaches': 'draw_path',
          'hintId': 42,
        };
      final result = validator.validate(json);
      expect(result.isValid, isFalse);
      expect(result.errors.any((e) => e.path == 'tutorial.band'), isTrue);
      expect(result.errors.any((e) => e.path == 'tutorial.sequence'), isTrue);
      expect(result.errors.any((e) => e.path == 'tutorial.teaches'), isTrue);
      expect(result.errors.any((e) => e.path == 'tutorial.hintId'), isTrue);
    });

    test('parse does not throw on valid tutorial block', () {
      final json = _minimalValidLevel()
        ..['tutorial'] = {
          'band': 'world_1_tutorial',
          'sequence': 1,
          'teaches': ['draw_path'],
        };
      expect(() => validator.parse(json), returnsNormally);
    });
  });
}

Map<String, dynamic> _minimalValidLevel() {
  return {
    'schemaVersion': 1,
    'id': 'level_001',
    'name': 'Minimal',
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
  };
}

void _setCell(
  Map<String, dynamic> json, {
  required int row,
  required int col,
  required Map<String, dynamic> cell,
}) {
  final grid = Map<String, dynamic>.from(json['grid'] as Map);
  final cells = (grid['cells'] as List)
      .map((rowData) => List<dynamic>.from(rowData as List))
      .toList();
  cells[row] = List<dynamic>.from(cells[row]);
  cells[row][col] = cell;
  grid['cells'] = cells;
  json['grid'] = grid;
}
