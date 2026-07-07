import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/painting/procedural_gameplay_painters.dart';

/// Renders a [CustomPainter] to a PNG file (sprite fallback pipeline only).
Future<void> exportPainterToPng({
  required CustomPainter painter,
  required String outputPath,
  double size = 256,
}) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final dimension = Size.square(size);
  painter.paint(canvas, dimension);
  final picture = recorder.endRecording();
  final image = await picture.toImage(size.toInt(), size.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  if (byteData == null) {
    throw StateError('Failed to encode PNG for $outputPath');
  }
  final file = File(outputPath);
  await file.parent.create(recursive: true);
  await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
  image.dispose();
}

/// Regenerates procedural **sprites** only. Environment autotiles are authored PNGs
/// (`tile_floor.png`, `tile_n.png`, …) — do not overwrite via this script.
Future<void> generateAllGameplayAssets({required String repoRoot}) async {
  final explorerRoot = '$repoRoot/assets/images/gameplay/explorer';
  final collectiblesRoot = '$repoRoot/assets/images/gameplay/collectibles';
  final puzzleRoot = '$repoRoot/assets/images/gameplay/puzzle';
  final iconsRoot = '$repoRoot/assets/images/icons/gameplay';

  final sprites = <(ProceduralSpriteKind kind, String file)>[
    (ProceduralSpriteKind.explorer, '$explorerRoot/explorer_idle.png'),
    (ProceduralSpriteKind.key, '$collectiblesRoot/key_idle.png'),
    (ProceduralSpriteKind.lockClosed, '$puzzleRoot/lock_closed.png'),
    (ProceduralSpriteKind.hudBack, '$iconsRoot/icon_back.png'),
    (ProceduralSpriteKind.hudSettings, '$iconsRoot/icon_settings.png'),
  ];

  for (final (kind, path) in sprites) {
    await exportPainterToPng(
      painter: ProceduralSpritePainter(kind),
      outputPath: path,
    );
  }
}
