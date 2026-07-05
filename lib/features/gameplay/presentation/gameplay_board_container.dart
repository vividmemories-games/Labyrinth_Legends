import 'package:flutter/material.dart';
import 'package:labyrinth_legends/core/debug/debug_config.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Central world / board zone container — UI_02 + UI_03 structural stage.
///
/// Gameplay rendering is intentionally absent in M2.1.
class GameplayBoardContainer extends StatelessWidget {
  const GameplayBoardContainer({
    super.key,
    this.showDebugGrid = false,
  });

  final bool showDebugGrid;

  @override
  Widget build(BuildContext context) {
    final theme = context.llTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingHudInset),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: theme.radiusPanel,
          gradient: LLGradient.stonePanel,
          border: Border.all(
            color: theme.borderSubtle,
            width: LLSize.borderWidth,
          ),
          boxShadow: LLShadow.soft,
        ),
        child: ClipRRect(
          borderRadius: theme.radiusPanel,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (showDebugGrid) const _DebugGrid(),
              Center(
                child: Icon(
                  Icons.grid_view_rounded,
                  size: LLSize.iconLg * 2,
                  color: theme.textSecondary.withValues(alpha: 0.35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DebugGrid extends StatelessWidget {
  const _DebugGrid();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(
        color: context.llTheme.pathEnergy.withValues(alpha: 0.15),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (!DebugConfig.showGrid) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const divisions = 8;
    final cellW = size.width / divisions;
    final cellH = size.height / divisions;

    for (var i = 1; i < divisions; i++) {
      final x = cellW * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      final y = cellH * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
