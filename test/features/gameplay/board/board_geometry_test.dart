import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/board/board_geometry.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

MazeGrid _grid({required int width, required int height}) {
  return MazeGrid(
    width: width,
    height: height,
    cells: List.generate(
      height,
      (_) => List.generate(
        width,
        (_) => const MazeCell(type: CellType.floor),
      ),
    ),
  );
}

void main() {
  group('BoardGeometry.fromGrid', () {
    test('never exceeds available width or height', () {
      const sizes = <Size>[
        Size(240, 245),
        Size(240, 400),
        Size(256, 245),
        Size(272, 520),
      ];

      for (final maxSize in sizes) {
        final geometry = BoardGeometry.fromGrid(
          grid: _grid(width: 3, height: 3),
          maxSize: maxSize,
        );

        expect(
          geometry.boardSize.width,
          lessThanOrEqualTo(maxSize.width),
          reason: 'width overflow at $maxSize',
        );
        expect(
          geometry.boardSize.height,
          lessThanOrEqualTo(maxSize.height),
          reason: 'height overflow at $maxSize',
        );
      }
    });

    test('uses width as limiting axis on narrow boards', () {
      final geometry = BoardGeometry.fromGrid(
        grid: _grid(width: 3, height: 3),
        maxSize: const Size(240, 400),
      );

      expect(geometry.cellSize, 80);
      expect(geometry.boardSize, const Size(240, 240));
    });

    test('uses height as limiting axis on short boards', () {
      final geometry = BoardGeometry.fromGrid(
        grid: _grid(width: 3, height: 5),
        maxSize: const Size(400, 250),
      );

      expect(geometry.cellSize, 50);
      expect(geometry.boardSize, const Size(150, 250));
    });

    test('returns zero cell size for empty bounds', () {
      final geometry = BoardGeometry.fromGrid(
        grid: _grid(width: 3, height: 3),
        maxSize: Size.zero,
      );

      expect(geometry.cellSize, 0);
      expect(geometry.boardSize, Size.zero);
    });
  });
}
