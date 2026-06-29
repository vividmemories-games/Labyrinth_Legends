import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

class LevelRepository {
  LevelRepository({AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  final AssetBundle _bundle;

  Future<LevelDefinition> loadLevel({
    required String worldId,
    required String levelId,
  }) async {
    final path = 'assets/levels/$worldId/$levelId.json';
    final raw = await _bundle.loadString(path);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return LevelDefinition.fromJson(json);
  }

  Future<List<LevelDefinition>> loadWorld(String worldId) async {
    final manifest = await _bundle.loadString('AssetManifest.json');
    final assets = jsonDecode(manifest) as Map<String, dynamic>;
    final prefix = 'assets/levels/$worldId/';

    final levelPaths = assets.keys
        .where((key) => key.startsWith(prefix) && key.endsWith('.json'))
        .toList()
      ..sort();

    final levels = <LevelDefinition>[];
    for (final path in levelPaths) {
      final raw = await _bundle.loadString(path);
      levels.add(
        LevelDefinition.fromJson(jsonDecode(raw) as Map<String, dynamic>),
      );
    }
    return levels;
  }
}
