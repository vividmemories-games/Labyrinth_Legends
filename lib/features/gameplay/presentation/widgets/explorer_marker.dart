import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_gameplay_asset.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/board/board_geometry.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

/// Explorer avatar positioned from engine-reported [position] — no UI prediction.
class ExplorerMarker extends StatelessWidget {
  const ExplorerMarker({
    super.key,
    required this.geometry,
    required this.position,
    this.isExecuting = false,
  });

  final BoardGeometry geometry;
  final GridPosition position;
  final bool isExecuting;

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;
    final center = geometry.cellCenter(position);
    final iconSize = geometry.cellSize * 0.42;
    final ringSize = geometry.cellSize * 0.88;

    return Positioned(
      key: const Key('explorer_marker'),
      left: center.dx - ringSize / 2,
      top: center.dy - ringSize / 2,
      width: ringSize,
      height: ringSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isExecuting)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: ringSize,
              height: ringSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.pathEnergy.withValues(alpha: 0.65),
                  width: 2,
                ),
              ),
            ),
          LLGameplayAsset(
            kind: GameplayAssetKind.explorer,
            size: iconSize,
            tint: theme.pathEnergy,
            semanticLabel: 'Explorer',
          ),
        ],
      ),
    );
  }
}
