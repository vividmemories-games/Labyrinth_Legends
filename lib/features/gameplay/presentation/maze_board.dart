import 'package:flutter/material.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_provider.dart';

class MazeBoard extends StatelessWidget {
  const MazeBoard({
    super.key,
    required this.state,
    this.onCellTap,
  });

  final GameplayUiState state;
  final void Function(GridPosition position)? onCellTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        return GestureDetector(
          onPanUpdate: (details) => _handleTouch(details.localPosition, size),
          onTapUp: (details) => _handleTouch(details.localPosition, size),
          child: CustomPaint(
            size: size,
            painter: _MazePainter(state: state),
          ),
        );
      },
    );
  }

  void _handleTouch(Offset local, Size size) {
    final point = _MazePainter.localToGrid(
      local,
      size,
      state.level.grid.width,
      state.level.grid.height,
    );
    if (point != null) onCellTap?.call(point);
  }
}

class _MazePainter extends CustomPainter {
  _MazePainter({required this.state});

  final GameplayUiState state;

  @override
  void paint(Canvas canvas, Size size) {
    final grid = state.level.grid;
    final tileW = size.width / (grid.width + 0.5);
    final tileH = tileW * GameConstants.tileAspectRatio;
    final origin = Offset(
      (size.width - grid.width * tileW) / 2,
      (size.height - grid.height * tileH) / 2 + tileH * 0.15,
    );

    canvas.save();
    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    canvas.scale(1.0, GameConstants.mazeScale);
    canvas.skew(0, -GameConstants.mazeSkewRadians * 0.15);
    canvas.translate(-center.dx, -center.dy);

    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final position = GridPosition(row: row, col: col);
        final cell = grid.cellAt(position);
        if (cell.visibility == CellVisibility.hidden) {
          _paintFog(canvas, origin, tileW, tileH, col, row);
          continue;
        }
        _paintCell(canvas, origin, tileW, tileH, cell, col, row);
      }
    }

    _paintPath(canvas, origin, tileW, tileH);
    _paintCharacter(canvas, origin, tileW, tileH);
    canvas.restore();
  }

  void _paintCell(
    Canvas canvas,
    Offset origin,
    double tileW,
    double tileH,
    MazeCell cell,
    int col,
    int row,
  ) {
    final rect = _tileRect(origin, tileW, tileH, col, row);
    final isWall = cell.type == CellType.wall;
    final basePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = isWall ? AppColors.wall : AppColors.floor;

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect.deflate(1.5), const Radius.circular(4)),
      basePaint,
    );

    if (isWall) return;

    if (cell.type == CellType.start) {
      _paintGlow(canvas, rect, AppColors.cyanGlow.withValues(alpha: 0.25));
    }
    if (cell.type == CellType.exit) {
      _paintPortal(canvas, rect);
    }
    if (cell.hasGem) {
      _paintGem(canvas, rect);
    }
    if (cell.keyId != null) {
      _paintKey(canvas, rect);
    }
    if (cell.hasRelic) {
      _paintRelic(canvas, rect);
    }
    if (cell.lockId != null) {
      _paintLock(canvas, rect);
    }
  }

  void _paintFog(
    Canvas canvas,
    Offset origin,
    double tileW,
    double tileH,
    int col,
    int row,
  ) {
    final rect = _tileRect(origin, tileW, tileH, col, row);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect.deflate(1), const Radius.circular(4)),
      Paint()..color = AppColors.voidBlack.withValues(alpha: 0.92),
    );
  }

  void _paintPath(Canvas canvas, Offset origin, double tileW, double tileH) {
    if (state.path.length < 2) return;
    final paint = Paint()
      ..color = AppColors.cyanGlow.withValues(alpha: 0.85)
      ..strokeWidth = tileW * 0.18
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    for (var i = 0; i < state.path.length; i++) {
      final p = state.path[i];
      final center = _tileCenter(origin, tileW, tileH, p.col, p.row);
      if (i == 0) {
        path.moveTo(center.dx, center.dy);
      } else {
        path.lineTo(center.dx, center.dy);
      }
    }
    canvas.drawPath(path, paint);
  }

  void _paintCharacter(Canvas canvas, Offset origin, double tileW, double tileH) {
    final pos = state.characterPosition;
    if (pos == null) return;
    final center = _tileCenter(origin, tileW, tileH, pos.col, pos.row);
    final glow = Paint()
      ..color = AppColors.cyanGlow.withValues(alpha: 0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(center, tileW * 0.28, glow);
    canvas.drawCircle(
      center,
      tileW * 0.2,
      Paint()..color = AppColors.cyanGlow,
    );
  }

  void _paintPortal(Canvas canvas, Rect rect) {
    final center = rect.center;
    final radius = rect.shortestSide * 0.32;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.cyanDeep.withValues(alpha: 0.35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
    canvas.drawCircle(
      center,
      radius * 0.7,
      Paint()
        ..color = AppColors.cyanGlow
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  void _paintGem(Canvas canvas, Rect rect) {
    final path = Path()
      ..moveTo(rect.center.dx, rect.top + 6)
      ..lineTo(rect.right - 6, rect.center.dy)
      ..lineTo(rect.center.dx, rect.bottom - 6)
      ..lineTo(rect.left + 6, rect.center.dy)
      ..close();
    canvas.drawPath(path, Paint()..color = AppColors.mysticPurple);
  }

  void _paintKey(Canvas canvas, Rect rect) {
    canvas.drawCircle(
      Offset(rect.center.dx - 3, rect.center.dy - 2),
      4,
      Paint()..color = AppColors.gold,
    );
    canvas.drawRect(
      Rect.fromLTWH(rect.center.dx, rect.center.dy - 1, 8, 3),
      Paint()..color = AppColors.gold,
    );
  }

  void _paintRelic(Canvas canvas, Rect rect) {
    canvas.drawCircle(
      rect.center,
      rect.shortestSide * 0.22,
      Paint()..color = AppColors.gold.withValues(alpha: 0.9),
    );
  }

  void _paintLock(Canvas canvas, Rect rect) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: rect.center, width: 10, height: 8),
        const Radius.circular(2),
      ),
      Paint()..color = AppColors.danger,
    );
  }

  void _paintGlow(Canvas canvas, Rect rect, Color color) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect.deflate(4), const Radius.circular(6)),
      Paint()..color = color,
    );
  }

  static Rect _tileRect(
    Offset origin,
    double tileW,
    double tileH,
    int col,
    int row,
  ) {
    return Rect.fromLTWH(
      origin.dx + col * tileW,
      origin.dy + row * tileH,
      tileW,
      tileH,
    );
  }

  static Offset _tileCenter(
    Offset origin,
    double tileW,
    double tileH,
    int col,
    int row,
  ) {
    final rect = _tileRect(origin, tileW, tileH, col, row);
    return rect.center;
  }

  static GridPosition? localToGrid(
    Offset local,
    Size size,
    int width,
    int height,
  ) {
    final tileW = size.width / (width + 0.5);
    final tileH = tileW * GameConstants.tileAspectRatio;
    final origin = Offset(
      (size.width - width * tileW) / 2,
      (size.height - height * tileH) / 2 + tileH * 0.15,
    );

    GridPosition? closest;
    var minDistance = double.infinity;
    final hitRadius = tileW * 0.55;

    for (var row = 0; row < height; row++) {
      for (var col = 0; col < width; col++) {
        final center = _transformPoint(
          _tileCenter(origin, tileW, tileH, col, row),
          size,
        );
        final distance = (center - local).distance;
        if (distance < minDistance && distance <= hitRadius) {
          minDistance = distance;
          closest = GridPosition(row: row, col: col);
        }
      }
    }

    return closest;
  }

  static Offset _transformPoint(Offset point, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const skew = -GameConstants.mazeSkewRadians * 0.15;

    var x = point.dx - center.dx;
    var y = point.dy - center.dy;
    y *= GameConstants.mazeScale;
    y = skew * x + y;

    return Offset(x + center.dx, y + center.dy);
  }

  @override
  bool shouldRepaint(covariant _MazePainter oldDelegate) =>
      oldDelegate.state != state;
}
