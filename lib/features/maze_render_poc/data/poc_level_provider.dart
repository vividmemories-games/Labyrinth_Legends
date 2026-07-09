import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// POC-only level loader.
///
/// Loads any bundled `world_1` level JSON directly by id — bypassing
/// `LevelRepository.loadWorld`, which filters to the M1-validated set.
/// Defaults missing `schemaVersion` so older fixtures still parse.
final pocLevelProvider =
    FutureProvider.family<LevelDefinition, String>((ref, levelId) async {
  final raw =
      await rootBundle.loadString('assets/levels/world_1/$levelId.json');
  final json = jsonDecode(raw) as Map<String, dynamic>;
  json.putIfAbsent('schemaVersion', () => 2);
  return LevelDefinition.fromJson(json);
});
