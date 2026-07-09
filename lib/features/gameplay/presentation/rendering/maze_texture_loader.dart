import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/maze_theme.dart';

/// Loads a theme's optional texture assets into decoded [ui.Image]s.
///
/// Missing assets are tolerated: the renderer falls back to its procedural
/// fills, so a theme can ship color-only first and gain textures later.
abstract final class MazeTextureLoader {
  static Future<MazeThemeTextures> load(MazeTheme theme) async {
    final wall = await _tryLoad(theme.wallTexturePath);
    final floor = await _tryLoad(theme.floorTexturePath);
    final floorTile = await _tryLoad(theme.floorTilePath);
    final floorTileVariants = <ui.Image>[];
    for (final path in theme.floorTileVariantPaths) {
      final image = await _tryLoad(path);
      if (image != null) {
        floorTileVariants.add(image);
      }
    }
    return MazeThemeTextures(
      wall: wall,
      floor: floor,
      floorTile: floorTile,
      floorTileVariants: floorTileVariants,
    );
  }

  static Future<ui.Image?> _tryLoad(String? assetPath) async {
    if (assetPath == null) {
      return null;
    }
    final ByteData data;
    try {
      data = await rootBundle.load(assetPath);
    } catch (_) {
      return null;
    }
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}
