import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/painting/premium_path_overlay_painter.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/board/board_geometry.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

/// Draft path linework between tile centers — cyan route per MVP master mockup.
class PathOverlay extends StatelessWidget {
  const PathOverlay({
    super.key,
    required this.geometry,
    required this.path,
  });

  final BoardGeometry geometry;
  final List<GridPosition> path;

  @override
  Widget build(BuildContext context) {
    if (path.length < 2) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;

    return RepaintBoundary(
      child: CustomPaint(
        size: geometry.boardSize,
        painter: PremiumPathOverlayPainter(
          geometry: geometry,
          path: path,
          pathColor: theme.pathEnergy,
          endpointColor: theme.actionPrimary,
        ),
      ),
    );
  }
}
