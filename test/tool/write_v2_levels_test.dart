import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/generation/maze_generator.dart';
import 'package:labyrinth_legends/game_engine/migration/level_v1_to_v2_converter.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// Writes schema v2 level JSON files when env var is set.
///
/// ```bash
/// WRITE_V2_LEVELS=1 fvm flutter test test/tool/write_v2_levels_test.dart
/// ```
void main() {
  final shouldWrite = Platform.environment['WRITE_V2_LEVELS'] == '1';

  test(
    'write v2 edge-test levels to assets/levels/world_1',
    () {
      final outDir = Directory('assets/levels/world_1');
      const converter = LevelV1ToV2Converter();
      final encoder = const JsonEncoder.withIndent('  ');

      final shimmeringBackup =
          File('assets/levels/world_1/.level_002_v1_backup.json');
      final shimmeringSource = File('assets/levels/world_1/level_002.json');
      if (!shimmeringBackup.existsSync() && shimmeringSource.existsSync()) {
        final raw = shimmeringSource.readAsStringSync();
        if ((jsonDecode(raw) as Map)['schemaVersion'] == 1) {
          shimmeringBackup.writeAsStringSync(raw);
        }
      }

      final edgeTests = <String, Map<String, dynamic>>{
        'level_001': _baseLevel(
          id: 'level_001',
          name: 'Open Chamber',
          width: 3,
          height: 3,
          cells: [
            [
              {'type': 'start'},
              {'type': 'floor'},
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {'type': 'floor'},
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {'type': 'floor'},
              {'type': 'exit'},
            ],
          ],
        ),
        'level_002': _baseLevel(
          id: 'level_002',
          name: 'North South Corridor',
          width: 3,
          height: 5,
          cells: _verticalCorridorCells(),
        ),
        'level_003': _baseLevel(
          id: 'level_003',
          name: 'East West Corridor',
          width: 5,
          height: 3,
          cells: _horizontalCorridorCells(),
        ),
        'level_004': _baseLevel(
          id: 'level_004',
          name: 'L Turn',
          width: 3,
          height: 3,
          cells: [
            [
              {'type': 'start'},
              {'type': 'floor'},
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {
                'type': 'floor',
                'edges': {'south': true, 'east': true},
              },
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {'type': 'floor'},
              {'type': 'exit'},
            ],
          ],
        ),
        'level_005': _baseLevel(
          id: 'level_005',
          name: 'T Junction',
          width: 3,
          height: 3,
          cells: [
            [
              {'type': 'start'},
              {'type': 'floor'},
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {
                'type': 'floor',
                'edges': {'north': true, 'south': true, 'east': true},
              },
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {'type': 'floor'},
              {'type': 'exit'},
            ],
          ],
        ),
        'level_006': _baseLevel(
          id: 'level_006',
          name: 'Inner Corner Pocket',
          width: 4,
          height: 4,
          cells: [
            [
              {'type': 'start'},
              {'type': 'floor'},
              {'type': 'floor'},
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {
                'type': 'floor',
                'edges': {'north': true, 'west': true},
              },
              {
                'type': 'floor',
                'edges': {'north': true, 'east': true},
              },
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {
                'type': 'floor',
                'edges': {'south': true, 'west': true},
              },
              {
                'type': 'floor',
                'edges': {'south': true, 'east': true},
              },
              {'type': 'floor'},
            ],
            [
              {'type': 'floor'},
              {'type': 'floor'},
              {'type': 'floor'},
              {'type': 'exit'},
            ],
          ],
        ),
        'level_007': _baseLevel(
          id: 'level_007',
          name: 'Stone Room',
          width: 5,
          height: 5,
          cells: List.generate(
            5,
            (row) => List.generate(
              5,
              (col) => {
                'type': row == 0 && col == 0
                    ? 'start'
                    : row == 4 && col == 4
                        ? 'exit'
                        : 'floor',
              },
            ),
          ),
        ),
        'level_008': _baseLevel(
          id: 'level_008',
          name: 'Central Pillar',
          width: 5,
          height: 5,
          cells: [
            for (var row = 0; row < 5; row++)
              [
                for (var col = 0; col < 5; col++)
                  if (row == 0 && col == 0)
                    {'type': 'start'}
                  else if (row == 4 && col == 4)
                    {'type': 'exit'}
                  else if (row == 1 && col == 2)
                    {'type': 'floor', 'edges': {'south': true}}
                  else if (row == 2 && col == 1)
                    {'type': 'floor', 'edges': {'east': true}}
                  else if (row == 2 && col == 3)
                    {'type': 'floor', 'edges': {'west': true}}
                  else if (row == 3 && col == 2)
                    {'type': 'floor', 'edges': {'north': true}}
                  else
                    {'type': 'floor'},
              ],
          ],
        ),
      };

      for (final entry in edgeTests.entries) {
        File('${outDir.path}/${entry.key}.json')
            .writeAsStringSync('${encoder.convert(entry.value)}\n');
      }

      if (shimmeringBackup.existsSync()) {
        final converted = converter.convertLevelJson(
          jsonDecode(shimmeringBackup.readAsStringSync()) as Map<String, dynamic>,
        );
        converted['id'] = 'level_009';
        converted['name'] = 'Shimmering Stones';
        converted['objectives'] = {
          'reachExit': true,
          'collectAllGems': true,
          'minGems': 0,
        };
        converted['starThresholds'] = {
          'threeStars': 14,
          'twoStars': 18,
          'oneStar': 24,
        };
        File('${outDir.path}/level_009.json')
            .writeAsStringSync('${encoder.convert(converted)}\n');
      }

      final generated =
          MazeGenerator().generate(width: 7, height: 7, seed: 42);
      final level010 = LevelDefinition(
        schemaVersion: 2,
        id: 'level_010',
        name: 'Carved Passages',
        worldId: 'world_1',
        grid: generated,
        objectives: const LevelObjectives(
          reachExit: true,
          collectAllGems: false,
          minGems: 0,
        ),
        discoveryMode: DiscoveryMode.full,
        starThresholds: const StarThresholds(
          threeStars: 20,
          twoStars: 28,
          oneStar: 36,
        ),
      );
      File('${outDir.path}/level_010.json')
          .writeAsStringSync('${encoder.convert(level010.toJson())}\n');

      for (final file in outDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.endsWith('.json'))) {
        final name = file.uri.pathSegments.last;
        if (!RegExp(r'level_\d{3}\.json').hasMatch(name)) {
          continue;
        }
        final id = name.replaceAll('.json', '');
        final levelNumber = int.parse(id.split('_').last);
        final raw = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
        if (levelNumber > 10) {
          if ((raw['schemaVersion'] as int? ?? 1) < 2) {
            final converted = converter.convertLevelJson(raw);
            converted['id'] = id;
            file.writeAsStringSync('${encoder.convert(converted)}\n');
          } else if (_containsWallCells(raw)) {
            final sanitized = converter.sanitizeWallCellsInLevelJson(raw);
            sanitized['id'] = id;
            file.writeAsStringSync('${encoder.convert(sanitized)}\n');
          }
        }
      }
    },
    skip: shouldWrite ? false : 'Set WRITE_V2_LEVELS=1 to write levels',
  );
}

Map<String, dynamic> _baseLevel({
  required String id,
  required String name,
  required int width,
  required int height,
  required List<List<Map<String, dynamic>>> cells,
}) {
  return {
    'schemaVersion': 2,
    'id': id,
    'name': name,
    'worldId': 'world_1',
    'discoveryMode': 'full',
    'moveLimit': null,
    'starThresholds': {
      'threeStars': 12,
      'twoStars': 16,
      'oneStar': 20,
    },
    'objectives': {
      'reachExit': true,
      'collectAllGems': false,
      'minGems': 0,
    },
    'grid': {
      'width': width,
      'height': height,
      'cells': cells,
    },
  };
}

List<List<Map<String, dynamic>>> _verticalCorridorCells() {
  return [
    [
      {'type': 'start'},
      {'type': 'floor'},
      {'type': 'floor'},
    ],
    for (var row = 0; row < 3; row++)
      [
        {'type': 'floor', 'edges': {'east': true, 'west': true}},
        {'type': 'floor', 'edges': {'east': true, 'west': true}},
        {'type': 'floor', 'edges': {'east': true, 'west': true}},
      ],
    [
      {'type': 'floor'},
      {'type': 'floor'},
      {'type': 'exit'},
    ],
  ];
}

List<List<Map<String, dynamic>>> _horizontalCorridorCells() {
  return [
    [
      {'type': 'start'},
      {'type': 'floor', 'edges': {'north': true, 'south': true}},
      {'type': 'floor', 'edges': {'north': true, 'south': true}},
      {'type': 'floor', 'edges': {'north': true, 'south': true}},
      {'type': 'exit'},
    ],
    [
      {'type': 'floor'},
      {'type': 'floor', 'edges': {'north': true, 'south': true}},
      {'type': 'floor', 'edges': {'north': true, 'south': true}},
      {'type': 'floor', 'edges': {'north': true, 'south': true}},
      {'type': 'floor'},
    ],
    [
      {'type': 'floor'},
      {'type': 'floor'},
      {'type': 'floor'},
      {'type': 'floor'},
      {'type': 'floor'},
    ],
  ];
}

bool _containsWallCells(Map<String, dynamic> json) {
  final cells = (json['grid'] as Map)['cells'] as List<dynamic>;
  for (final row in cells) {
    for (final cell in row as List<dynamic>) {
      if ((cell as Map)['type'] == 'wall') {
        return true;
      }
    }
  }
  return false;
}
