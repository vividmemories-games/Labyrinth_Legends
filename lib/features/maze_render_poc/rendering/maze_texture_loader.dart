import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/maze_theme.dart';

/// Loads a theme's optional texture assets into decoded [ui.Image]s.
///
/// Missing assets are tolerated: the renderer falls back to its procedural
/// fills, so a theme can ship color-only first and gain textures later.
abstract final class MazeTextureLoader {
  static Future<MazeThemeTextures> load(MazeTheme theme) async {
    final wall = await _tryLoad(theme.wallTexturePath);
    final floor = await _tryLoad(theme.floorTexturePath);
    return MazeThemeTextures(wall: wall, floor: floor);
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
