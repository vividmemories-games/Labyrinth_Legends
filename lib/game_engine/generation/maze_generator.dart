import 'dart:math';

import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

class MazeGenerator {
  MazeGenerator({Random? random}) : _random = random ?? Random();

  final Random _random;

  MazeGrid generate({
    required int width,
    required int height,
    int? seed,
  }) {
    final random = seed != null ? Random(seed) : _random;

    if (width < 3 || height < 3 || width.isOdd == false || height.isOdd == false) {
      throw ArgumentError('Width and height must be odd and at least 3');
    }

    final cells = List.generate(
      height,
      (_) => List.generate(width, (_) => const MazeCell(type: CellType.wall)),
    );

    _carvePassages(cells, random, 1, 1);

    cells[1][1] = const MazeCell(type: CellType.start);
    cells[height - 2][width - 2] = const MazeCell(type: CellType.exit);

    return MazeGrid(width: width, height: height, cells: cells);
  }

  void _carvePassages(
    List<List<MazeCell>> cells,
    Random random,
    int row,
    int col,
  ) {
    cells[row][col] = const MazeCell(type: CellType.floor);

    final directions = [
      (-2, 0),
      (2, 0),
      (0, -2),
      (0, 2),
    ]..shuffle(random);

    for (final (deltaRow, deltaCol) in directions) {
      final nextRow = row + deltaRow;
      final nextCol = col + deltaCol;

      if (nextRow <= 0 ||
          nextRow >= cells.length - 1 ||
          nextCol <= 0 ||
          nextCol >= cells[0].length - 1) {
        continue;
      }

      if (cells[nextRow][nextCol].type == CellType.wall) {
        cells[row + deltaRow ~/ 2][col + deltaCol ~/ 2] =
            const MazeCell(type: CellType.floor);
        _carvePassages(cells, random, nextRow, nextCol);
      }
    }
  }
}
