import 'dart:math';

import 'package:labyrinth_legends/game_engine/models/cell_edges.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Edge-carving maze generator — all cells walkable, blocked edges form walls.
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

    final edgeGrid = List.generate(
      height,
      (row) => List.generate(
        width,
        (col) => CellEdges(
          north: row > 0,
          south: row < height - 1,
          east: col < width - 1,
          west: col > 0,
        ),
      ),
    );

    final visited = List.generate(
      height,
      (_) => List.generate(width, (_) => false),
    );

    void openBetween(int rowA, int colA, int rowB, int colB) {
      if (rowB == rowA - 1) {
        edgeGrid[rowA][colA] =
            edgeGrid[rowA][colA].copyWith(north: false);
        edgeGrid[rowB][colB] =
            edgeGrid[rowB][colB].copyWith(south: false);
      } else if (rowB == rowA + 1) {
        edgeGrid[rowA][colA] =
            edgeGrid[rowA][colA].copyWith(south: false);
        edgeGrid[rowB][colB] =
            edgeGrid[rowB][colB].copyWith(north: false);
      } else if (colB == colA - 1) {
        edgeGrid[rowA][colA] =
            edgeGrid[rowA][colA].copyWith(west: false);
        edgeGrid[rowB][colB] =
            edgeGrid[rowB][colB].copyWith(east: false);
      } else if (colB == colA + 1) {
        edgeGrid[rowA][colA] =
            edgeGrid[rowA][colA].copyWith(east: false);
        edgeGrid[rowB][colB] =
            edgeGrid[rowB][colB].copyWith(west: false);
      }
    }

    void carve(int row, int col) {
      visited[row][col] = true;

      final directions = [
        (-2, 0),
        (2, 0),
        (0, -2),
        (0, 2),
      ]..shuffle(random);

      for (final (deltaRow, deltaCol) in directions) {
        final nextRow = row + deltaRow;
        final nextCol = col + deltaCol;
        final midRow = row + deltaRow ~/ 2;
        final midCol = col + deltaCol ~/ 2;

        if (nextRow <= 0 ||
            nextRow >= height - 1 ||
            nextCol <= 0 ||
            nextCol >= width - 1) {
          continue;
        }

        if (!visited[nextRow][nextCol]) {
          openBetween(row, col, midRow, midCol);
          openBetween(midRow, midCol, nextRow, nextCol);
          carve(nextRow, nextCol);
        }
      }
    }

    carve(1, 1);

    final cells = List.generate(
      height,
      (row) => List.generate(
        width,
        (col) => MazeCell(
          type: CellType.floor,
          blockedEdges: edgeGrid[row][col],
        ),
      ),
    );

    cells[1][1] = cells[1][1].copyWith(type: CellType.start);
    cells[height - 2][width - 2] =
        cells[height - 2][width - 2].copyWith(type: CellType.exit);

    return MazeGrid(width: width, height: height, cells: cells);
  }
}
