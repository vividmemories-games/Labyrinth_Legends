import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/board_renderer.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Central world / board zone container — UI_02 + UI_03 board stage.
class GameplayBoardContainer extends StatelessWidget {
  const GameplayBoardContainer({
    super.key,
    required this.grid,
    required this.visualPath,
    required this.onTileInteraction,
    this.explorerPosition,
    this.selectedTile,
    this.invalidTarget,
    this.traversedPathPositions = const {},
    this.isExecuting = false,
    this.showDebugGrid = false,
    this.inputEnabled = true,
    this.effectiveKeyIds = const {},
    this.floorLayoutSeed = 0,
  });

  final MazeGrid grid;
  final List<GridPosition> visualPath;
  final ValueChanged<GridPosition> onTileInteraction;
  final GridPosition? explorerPosition;
  final GridPosition? selectedTile;
  final GridPosition? invalidTarget;
  final Set<GridPosition> traversedPathPositions;
  final bool isExecuting;
  final bool showDebugGrid;
  final bool inputEnabled;
  final Set<String> effectiveKeyIds;
  final int floorLayoutSeed;

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;

    final board = BoardRenderer(
      grid: grid,
      visualPath: visualPath,
      explorerPosition: explorerPosition,
      selectedTile: selectedTile,
      onTileInteraction: onTileInteraction,
      invalidTarget: invalidTarget,
      traversedPathPositions: traversedPathPositions,
      isExecuting: isExecuting,
      showDebugGrid: showDebugGrid,
      enabled: inputEnabled,
      effectiveKeyIds: effectiveKeyIds,
      floorLayoutSeed: floorLayoutSeed,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingHudInset),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: theme.radiusPanel,
          color: LLColor.templeBlack.withValues(alpha: 0.45),
          boxShadow: [
            ...LLShadow.panel,
            BoxShadow(
              color: theme.actionPrimary.withValues(alpha: 0.12),
              blurRadius: 18,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: theme.radiusPanel,
          child: board,
        ),
      ),
    );
  }
}
