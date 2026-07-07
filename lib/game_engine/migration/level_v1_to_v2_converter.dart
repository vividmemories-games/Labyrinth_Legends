import 'package:labyrinth_legends/game_engine/models/cell_edges.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

/// Converts schema v1 wall-cell grids to v2 edge-blocked walkable grids.
class LevelV1ToV2Converter {
  const LevelV1ToV2Converter();

  Map<String, dynamic> convertLevelJson(Map<String, dynamic> json) {
    final schemaVersion = json['schemaVersion'] as int? ?? 1;
    if (schemaVersion >= 2) {
      return json;
    }

    final gridJson = json['grid'] as Map<String, dynamic>;
    return {
      ...json,
      'schemaVersion': 2,
      'grid': convertGridJson(gridJson),
    };
  }

  MazeGrid convertGrid(MazeGrid grid) {
    return MazeGrid.fromJson(convertGridJson(grid.toJson()));
  }

  Map<String, dynamic> convertGridJson(Map<String, dynamic> gridJson) {
    final width = gridJson['width'] as int;
    final height = gridJson['height'] as int;
    final rawCells = gridJson['cells'] as List<dynamic>;

    final cells = <List<MazeCell>>[];
    for (final row in rawCells) {
      cells.add(
        (row as List<dynamic>)
            .map((cell) => MazeCell.fromJson(cell as Map<String, dynamic>))
            .toList(),
      );
    }

    var minRow = height;
    var maxRow = -1;
    var minCol = width;
    var maxCol = -1;

    for (var row = 0; row < height; row++) {
      for (var col = 0; col < width; col++) {
        if (cells[row][col].type != CellType.wall) {
          if (row < minRow) minRow = row;
          if (row > maxRow) maxRow = row;
          if (col < minCol) minCol = col;
          if (col > maxCol) maxCol = col;
        }
      }
    }

    if (maxRow < minRow || maxCol < minCol) {
      throw StateError('Grid has no walkable cells');
    }

    final newHeight = maxRow - minRow + 1;
    final newWidth = maxCol - minCol + 1;
    final edgeGrid = List.generate(
      newHeight,
      (_) => List.generate(newWidth, (_) => CellEdges.none),
    );

    for (var oldRow = 0; oldRow < height; oldRow++) {
      for (var oldCol = 0; oldCol < width; oldCol++) {
        if (cells[oldRow][oldCol].type != CellType.wall) {
          continue;
        }

        const neighbors = [
          (-1, 0, 'north'),
          (1, 0, 'south'),
          (0, -1, 'west'),
          (0, 1, 'east'),
        ];

        for (final (deltaRow, deltaCol, side) in neighbors) {
          final nr = oldRow + deltaRow;
          final nc = oldCol + deltaCol;
          if (nr < minRow ||
              nr > maxRow ||
              nc < minCol ||
              nc > maxCol) {
            continue;
          }
          if (cells[nr][nc].type == CellType.wall) {
            continue;
          }

          final newRow = nr - minRow;
          final newCol = nc - minCol;
          final current = edgeGrid[newRow][newCol];
          edgeGrid[newRow][newCol] = switch (side) {
            'north' => current.copyWith(south: true),
            'south' => current.copyWith(north: true),
            'east' => current.copyWith(west: true),
            _ => current.copyWith(east: true),
          };
        }
      }
    }

    final newCells = <List<MazeCell>>[];
    for (var row = 0; row < newHeight; row++) {
      final rowCells = <MazeCell>[];
      for (var col = 0; col < newWidth; col++) {
        final oldRow = minRow + row;
        final oldCol = minCol + col;
        final source = cells[oldRow][oldCol];
        if (source.type == CellType.wall) {
          rowCells.add(
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(
                north: true,
                east: true,
                south: true,
                west: true,
              ),
            ),
          );
        } else {
          rowCells.add(
            source.copyWith(
              blockedEdges: edgeGrid[row][col],
            ),
          );
        }
      }
      newCells.add(rowCells);
    }

    return {
      'width': newWidth,
      'height': newHeight,
      'cells': [
        for (final row in newCells)
          [for (final cell in row) cell.toJson()],
      ],
    };
  }

  /// Replaces legacy `wall` cells left inside schema v2 grids.
  Map<String, dynamic> sanitizeWallCellsInLevelJson(Map<String, dynamic> json) {
    final gridJson = Map<String, dynamic>.from(json['grid'] as Map);
    final cells = (gridJson['cells'] as List<dynamic>)
        .map(
          (row) => (row as List<dynamic>).map((cell) {
            final map = Map<String, dynamic>.from(cell as Map);
            if (map['type'] != 'wall') {
              return map;
            }
            return {
              'type': 'floor',
              'edges': const {
                'north': true,
                'east': true,
                'south': true,
                'west': true,
              },
            };
          }).toList(),
        )
        .toList();
    return {
      ...json,
      'schemaVersion': 2,
      'grid': {
        ...gridJson,
        'cells': cells,
      },
    };
  }
}
