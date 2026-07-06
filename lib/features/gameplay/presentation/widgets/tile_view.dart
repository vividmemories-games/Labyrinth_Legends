import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/ll_gameplay_asset.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/painting/maze_tile_painter.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';

/// Single maze cell tile — sprite-first with painter fallback until PNGs ship.
class TileView extends StatelessWidget {
  const TileView({
    super.key,
    required this.cell,
    required this.size,
    this.isPathTile = false,
    this.isPathEndpoint = false,
    this.isInvalidTarget = false,
    this.hideStartMarker = false,
    this.effectiveKeyIds = const {},
    this.isSelected = false,
    this.isExtensionHint = false,
    this.isTraversed = false,
    this.isExecutionFocus = false,
    this.isPressed = false,
  });

  final MazeCell cell;
  final double size;
  final bool isPathTile;
  final bool isPathEndpoint;
  final bool isInvalidTarget;
  final bool hideStartMarker;
  final Set<String> effectiveKeyIds;
  final bool isSelected;
  final bool isExtensionHint;
  final bool isTraversed;
  final bool isExecutionFocus;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;
    final isLockedGate =
        cell.lockId != null && !effectiveKeyIds.contains(cell.lockId);
    final objectSize = size * 0.42;

    Widget sprite(GameplayAssetKind kind, {double? spriteSize, Color? tint, String? label}) {
      return LLGameplayAsset(
        kind: kind,
        size: spriteSize ?? objectSize,
        tint: tint,
        semanticLabel: label,
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      width: size,
      height: size,
      child: RepaintBoundary(
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: MazeTilePainter(
                cellType: cell.type,
                isWalkable: cell.isWalkable,
              ),
            ),
            if (_overlayColor(theme: theme, isLockedGate: isLockedGate)
                case final color?)
              ColoredBox(color: color),
            if (cell.visibility != CellVisibility.visible)
              ColoredBox(color: theme.overlayVeil.withValues(alpha: 0.45)),
            if (_borderOverlay(theme: theme, isLockedGate: isLockedGate)
                case final border?)
              IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(border: border),
                ),
              ),
            if (isExtensionHint && !isPathTile && !isInvalidTarget)
              Center(
                child: sprite(
                  GameplayAssetKind.extensionHint,
                  spriteSize: size * 0.28,
                  tint: theme.pathEnergy,
                ),
              ),
            if (cell.hasGem)
              Center(child: sprite(GameplayAssetKind.gem, label: 'Gem')),
            if (cell.keyId != null && !effectiveKeyIds.contains(cell.keyId))
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(size * 0.08),
                  child: sprite(
                    GameplayAssetKind.key,
                    spriteSize: size * 0.32,
                    tint: theme.actionPrimary,
                    label: 'Key',
                  ),
                ),
              ),
            if (isLockedGate)
              Center(child: sprite(GameplayAssetKind.lockClosed, label: 'Locked gate')),
            if (cell.type == CellType.start && !hideStartMarker)
              Center(child: sprite(GameplayAssetKind.explorer, label: 'Explorer start')),
            if (cell.type == CellType.exit)
              Center(child: sprite(GameplayAssetKind.exitPortal, label: 'Exit portal')),
            if (isInvalidTarget)
              Center(
                child: sprite(
                  GameplayAssetKind.invalidBlock,
                  spriteSize: size * 0.34,
                  label: 'Invalid tile',
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color? _overlayColor({
    required LLThemeExtension theme,
    required bool isLockedGate,
  }) {
    final pathFillAlpha = isTraversed ? 0.06 : 0.14;
    if (isInvalidTarget) {
      return theme.feedbackDanger.withValues(alpha: 0.28);
    }
    if (isExecutionFocus) {
      return theme.pathEnergy.withValues(alpha: 0.24);
    }
    if (isSelected) {
      return theme.actionPrimary.withValues(alpha: 0.18);
    }
    if (isLockedGate && !isPathTile) {
      return theme.feedbackDanger.withValues(alpha: 0.12);
    }
    if (isExtensionHint) {
      return theme.pathEnergy.withValues(alpha: 0.08);
    }
    if (isPathTile) {
      return theme.pathEnergy.withValues(alpha: pathFillAlpha);
    }
    if (isPressed) {
      return Colors.black.withValues(alpha: 0.35);
    }
    return null;
  }

  Border? _borderOverlay({
    required LLThemeExtension theme,
    required bool isLockedGate,
  }) {
    Color? color;
    var width = LLSize.borderWidth;

    if (isInvalidTarget) {
      color = theme.feedbackDanger;
    } else if (isExecutionFocus) {
      color = theme.pathEnergy;
    } else if (isLockedGate) {
      color = theme.feedbackDanger.withValues(alpha: 0.7);
    } else if (isPathEndpoint) {
      color = theme.pathEnergy;
    } else if (isSelected) {
      color = theme.actionPrimary;
    } else if (isExtensionHint) {
      color = theme.pathEnergy.withValues(alpha: 0.55);
    }

    if (color == null) {
      return null;
    }

    if (isInvalidTarget || isExecutionFocus) {
      width *= 1.4;
    } else if (isLockedGate || isPathEndpoint) {
      width *= 1.35;
    } else if (isSelected || isExtensionHint) {
      width *= 1.1;
    }

    return Border.all(color: color, width: width);
  }
}
