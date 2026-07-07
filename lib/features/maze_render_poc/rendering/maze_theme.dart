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
    this.wallTextureOpacity = 0.55,
    this.floorTextureOpacity = 0.35,
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
  final double wallTextureOpacity;
  final double floorTextureOpacity;

  static const MazeTheme ancientRuins = MazeTheme(
    id: 'ancient_ruins',
    name: 'Ancient Ruins',
    backgroundTop: Color(0xFF10161C),
    backgroundBottom: Color(0xFF06090C),
    floorBase: Color(0xFF1A222A),
    floorSpeckle: Color(0xFF27313B),
    wallTop: Color(0xFF5D5F4E),
    wallSide: Color(0xFF33352A),
    wallEdgeHighlight: Color(0xFF8B8A6C),
    accent: Color(0xFFD4A63A),
    wallTexturePath: 'assets/images/textures/ruins_wall.jpg',
    floorTexturePath: 'assets/images/textures/ruins_floor.jpg',
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
  const MazeThemeTextures({this.wall, this.floor});

  static const MazeThemeTextures none = MazeThemeTextures();

  final ui.Image? wall;
  final ui.Image? floor;
}
