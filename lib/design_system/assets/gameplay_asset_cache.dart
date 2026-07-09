import 'package:flutter/services.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';

/// Lightweight bundle presence cache — avoids repeated decode attempts.
abstract final class GameplayAssetCache {
  static final _presence = <String, bool>{};

  static Future<bool> hasAsset(String assetPath) async {
    final cached = _presence[assetPath];
    if (cached != null) {
      return cached;
    }

    try {
      await rootBundle.load(assetPath);
      _presence[assetPath] = true;
    } on Object {
      _presence[assetPath] = false;
    }
    return _presence[assetPath]!;
  }

  static Future<bool> hasGameplayAsset(GameplayAssetKind kind) =>
      hasAsset(LLGameplayAssets.path(kind));

  static Future<bool> hasHudIcon(GameplayHudIconKind kind) =>
      hasAsset(LLGameplayAssets.hudIconPath(kind));

  static void clear() => _presence.clear();
}
