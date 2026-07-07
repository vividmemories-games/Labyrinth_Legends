import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// POC-only level loader.
///
/// Loads any bundled `world_1` level JSON directly by id — bypassing
/// `LevelRepository.loadWorld`, which depends on `AssetManifest.json` and
/// filters to the M1-validated set (`level_001`–`level_003`). The renderer
/// POC needs a variety of layouts, including levels that predate the
/// `schemaVersion` field, so that field is defaulted here when absent.
final pocLevelProvider =
    FutureProvider.family<LevelDefinition, String>((ref, levelId) async {
  final raw =
      await rootBundle.loadString('assets/levels/world_1/$levelId.json');
  final json = jsonDecode(raw) as Map<String, dynamic>;
  json.putIfAbsent('schemaVersion', () => 1);
  return LevelDefinition.fromJson(json);
});
