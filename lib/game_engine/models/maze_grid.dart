import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

class MazeGrid {
  MazeGrid({
    required this.width,
    required this.height,
    required List<List<MazeCell>> cells,
  }) : cells = List<List<MazeCell>>.unmodifiable(
          cells.map((row) => List<MazeCell>.unmodifiable(row)).toList(),
        );

  final int width;
  final int height;
  final List<List<MazeCell>> cells;

  bool isInBounds(GridPosition position) {
    return position.row >= 0 &&
        position.row < height &&
        position.col >= 0 &&
        position.col < width;
  }

  MazeCell cellAt(GridPosition position) {
    if (!isInBounds(position)) {
      throw RangeError('Position out of bounds: $position');
    }
    return cells[position.row][position.col];
  }

  MazeCell? cellAtOrNull(GridPosition position) {
    if (!isInBounds(position)) {
      return null;
    }
    return cells[position.row][position.col];
  }

  GridPosition? findStart() {
    for (var row = 0; row < height; row++) {
      for (var col = 0; col < width; col++) {
        if (cells[row][col].type == CellType.start) {
          return GridPosition(row: row, col: col);
        }
      }
    }
    return null;
  }

  GridPosition? findExit() {
    for (var row = 0; row < height; row++) {
      for (var col = 0; col < width; col++) {
        if (cells[row][col].type == CellType.exit) {
          return GridPosition(row: row, col: col);
        }
      }
    }
    return null;
  }

  int countGems() {
    var count = 0;
    for (final row in cells) {
      for (final cell in row) {
        if (cell.hasGem) {
          count++;
        }
      }
    }
    return count;
  }

  int countKeys() {
    var count = 0;
    for (final row in cells) {
      for (final cell in row) {
        if (cell.keyId != null) {
          count++;
        }
      }
    }
    return count;
  }

  MazeGrid withCellAt(GridPosition position, MazeCell cell) {
    final updated = [
      for (final row in cells) [...row],
    ];
    updated[position.row][position.col] = cell;
    return MazeGrid(width: width, height: height, cells: updated);
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'cells': [
        for (final row in cells)
          [for (final cell in row) cell.toJson()],
      ],
    };
  }

  factory MazeGrid.fromJson(Map<String, dynamic> json) {
    final width = json['width'] as int;
    final height = json['height'] as int;
    final rawCells = json['cells'] as List<dynamic>;

    final cells = <List<MazeCell>>[];
    for (final row in rawCells) {
      cells.add(
        (row as List<dynamic>)
            .map((cell) => MazeCell.fromJson(cell as Map<String, dynamic>))
            .toList(),
      );
    }

    return MazeGrid(width: width, height: height, cells: cells);
  }
}
