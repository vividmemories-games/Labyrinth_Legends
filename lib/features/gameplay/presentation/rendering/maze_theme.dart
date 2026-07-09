import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// A world "skin" for the maze renderer.
///
/// The maze structure (wall silhouette, raised edges, corners) is drawn in
/// code by [MazePainter]; a theme only supplies colors and optional seamless
/// textures. Re-theming a world means swapping this data bundle — no tileset
/// PNGs are ever produced per theme.
class MazeTheme {
  const MazeTheme({
    required this.id,
    required this.name,
    required this.backgroundTop,
    required this.backgroundBottom,
    required this.floorBase,
    required this.floorSpeckle,
    required this.wallTop,
    required this.wallSide,
    required this.wallEdgeHighlight,
    required this.accent,
    this.wallTexturePath,
    this.floorTexturePath,
    this.floorTilePath,
    this.floorTileVariantPaths = const [],
    this.wallTextureOpacity = 0.90,
    this.floorTextureOpacity = 0.45,
  });

  final String id;
  final String name;

  final Color backgroundTop;
  final Color backgroundBottom;

  final Color floorBase;

  /// Procedural noise dots drawn on floor cells (works with no texture asset).
  final Color floorSpeckle;

  /// Top face of the extruded wall block.
  final Color wallTop;

  /// Vertical face revealed by the fake 3D extrusion offset.
  final Color wallSide;

  /// Thin light stroke along the wall's upper silhouette (raised look).
  final Color wallEdgeHighlight;

  /// Start/exit/path marker accent.
  final Color accent;

  /// Optional seamless texture assets, blended over the flat fills. When
  /// null the renderer stays fully procedural, so the POC works without any
  /// image files present.
  final String? wallTexturePath;
  final String? floorTexturePath;

  /// Authored per-cell floor slab fallback (e.g. `tile_floor.png`).
  final String? floorTilePath;

  /// Randomized floor slab pool (e.g. `tile_floor_1` … `tile_floor_4`).
  final List<String> floorTileVariantPaths;
  final double wallTextureOpacity;
  final double floorTextureOpacity;

  static const MazeTheme ancientRuins = MazeTheme(
    id: 'ancient_ruins',
    name: 'Ancient Ruins',
    backgroundTop: Color(0xFF10161C),
    backgroundBottom: Color(0xFF06090C),
    floorBase: Color(0xFF2C3238),
    floorSpeckle: Color(0xFF3A4048),
    wallTop: Color(0xFF3D4349),
    wallSide: Color(0xFF23282E),
    wallEdgeHighlight: Color(0xFF6A7178),
    accent: Color(0xFFD4A63A),
    wallTexturePath: 'assets/images/textures/ruins_wall.jpg',
    floorTexturePath: 'assets/images/textures/ruins_floor.jpg',
    floorTilePath: 'assets/images/gameplay/environment/tile_floor.png',
    floorTileVariantPaths: [
      'assets/images/gameplay/environment/tile_floor_1.png',
      'assets/images/gameplay/environment/tile_floor_2.png',
      'assets/images/gameplay/environment/tile_floor_3.png',
      'assets/images/gameplay/environment/tile_floor_4.png',
    ],
  );

  static const MazeTheme amazonJungle = MazeTheme(
    id: 'amazon_jungle',
    name: 'Amazon Jungle',
    backgroundTop: Color(0xFF12241A),
    backgroundBottom: Color(0xFF07110B),
    floorBase: Color(0xFF32452C),
    floorSpeckle: Color(0xFF445C3B),
    wallTop: Color(0xFF4E7A3A),
    wallSide: Color(0xFF2C4620),
    wallEdgeHighlight: Color(0xFF7FA85E),
    accent: Color(0xFFF2C14E),
    wallTexturePath: 'assets/images/textures/jungle_wall.jpg',
    floorTexturePath: 'assets/images/textures/jungle_floor.jpg',
  );

  static const List<MazeTheme> all = [ancientRuins, amazonJungle];
}

/// Decoded texture images for one theme, loaded asynchronously by the UI
/// layer and handed to the painter (painters cannot await asset loads).
class MazeThemeTextures {
  const MazeThemeTextures({
    this.wall,
    this.floor,
    this.floorTile,
    this.floorTileVariants = const [],
  });

  static const MazeThemeTextures none = MazeThemeTextures();

  final ui.Image? wall;
  final ui.Image? floor;
  final ui.Image? floorTile;
  final List<ui.Image> floorTileVariants;
}
