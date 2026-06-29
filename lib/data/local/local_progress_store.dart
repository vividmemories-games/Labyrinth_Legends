import 'dart:convert';

import 'package:labyrinth_legends/data/models/level_progress.dart';
import 'package:labyrinth_legends/data/models/player_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalProgressStore {
  LocalProgressStore(this._prefs);

  static const playerProgressKey = 'player_progress';
  static const levelProgressPrefix = 'level_progress_';

  final SharedPreferences _prefs;

  static Future<LocalProgressStore> create() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalProgressStore(prefs);
  }

  Future<PlayerProgress> loadPlayerProgress() async {
    final raw = _prefs.getString(playerProgressKey);
    if (raw == null) {
      return const PlayerProgress();
    }

    return PlayerProgress.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    );
  }

  Future<void> savePlayerProgress(PlayerProgress progress) async {
    await _prefs.setString(
      playerProgressKey,
      jsonEncode(progress.toJson()),
    );
  }

  Future<LevelProgress?> loadLevelProgress(String levelId) async {
    final raw = _prefs.getString('$levelProgressPrefix$levelId');
    if (raw == null) {
      return null;
    }

    return LevelProgress.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveLevelProgress(LevelProgress progress) async {
    await _prefs.setString(
      '$levelProgressPrefix${progress.levelId}',
      jsonEncode(progress.toJson()),
    );
  }

  Future<void> clearAll() async {
    final keys = _prefs
        .getKeys()
        .where(
          (key) =>
              key == playerProgressKey ||
              key.startsWith(levelProgressPrefix),
        )
        .toList();

    for (final key in keys) {
      await _prefs.remove(key);
    }
  }
}
