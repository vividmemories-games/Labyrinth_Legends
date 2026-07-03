import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/validation/level_format_validator.dart';

class LevelRepository {
  LevelRepository({
    AssetBundle? bundle,
    LevelFormatValidator? validator,
  })  : _bundle = bundle ?? rootBundle,
        _validator = validator ?? const LevelFormatValidator();

  /// Per [Level_Format.md] §3 — M1 minimum validation band for `world_1`.
  ///
  /// Levels 004+ may remain bundled but are excluded from runtime world loading
  /// until they pass structural validation (e.g. `schemaVersion` alignment).
  static const Set<String> m1ValidatedLevelIds = {
    'level_001',
    'level_002',
    'level_003',
  };

  final AssetBundle _bundle;
  final LevelFormatValidator _validator;

  Future<LevelDefinition> loadLevel({
    required String worldId,
    required String levelId,
  }) async {
    final path = 'assets/levels/$worldId/$levelId.json';
    final raw = await _bundle.loadString(path);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return _validator.parse(
      json,
      expectedLevelId: levelId,
      expectedWorldId: worldId,
    );
  }

  Future<List<LevelDefinition>> loadWorld(String worldId) async {
    final manifest = await _bundle.loadString('AssetManifest.json');
    final assets = jsonDecode(manifest) as Map<String, dynamic>;
    final prefix = 'assets/levels/$worldId/';

    final levelPaths = assets.keys
        .where((key) => key.startsWith(prefix) && key.endsWith('.json'))
        .where((key) {
          final levelId = key.split('/').last.replaceAll('.json', '');
          return m1ValidatedLevelIds.contains(levelId);
        })
        .toList()
      ..sort();

    final levels = <LevelDefinition>[];
    for (final path in levelPaths) {
      final raw = await _bundle.loadString(path);
      final levelId = path.split('/').last.replaceAll('.json', '');
      levels.add(
        _validator.parse(
          jsonDecode(raw) as Map<String, dynamic>,
          expectedLevelId: levelId,
          expectedWorldId: worldId,
        ),
      );
    }
    return levels;
  }
}
