import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/wall_shape_builder.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

MazeGrid gridFrom(List<String> rows) {
  return MazeGrid(
    width: rows.first.length,
    height: rows.length,
    cells: [
      for (final row in rows)
        [
          for (final char in row.split(''))
            MazeCell(type: char == '#' ? CellType.wall : CellType.floor),
        ],
    ],
  );
}

WallCellGeometry geometryAt(
  List<WallCellGeometry> geometries,
  int row,
  int col,
) {
  return geometries.firstWhere((g) => g.row == row && g.col == col);
}

void main() {
  group('WallShapeBuilder', () {
    test('emits one geometry per wall cell only', () {
      final grid = gridFrom([
        '###',
        '#.#',
        '###',
      ]);

      final geometries = WallShapeBuilder.build(grid);

      expect(geometries, hasLength(8));
      expect(
        geometries.any((g) => g.row == 1 && g.col == 1),
        isFalse,
      );
    });

    test('isolated wall rounds all four corners', () {
      final grid = gridFrom([
        '...',
        '.#.',
        '...',
      ]);

      final g = geometryAt(WallShapeBuilder.build(grid), 1, 1);

      expect(g.isIsolated, isTrue);
      expect(g.roundNorthWest, isTrue);
      expect(g.roundNorthEast, isTrue);
      expect(g.roundSouthEast, isTrue);
      expect(g.roundSouthWest, isTrue);
    });

    test('horizontal run keeps shared edges square', () {
      final grid = gridFrom([
        '...',
        '##.',
        '...',
      ]);

      final geometries = WallShapeBuilder.build(grid);
      final left = geometryAt(geometries, 1, 0);
      final right = geometryAt(geometries, 1, 1);

      // Left segment fuses on its east side.
      expect(left.roundNorthWest, isTrue);
      expect(left.roundSouthWest, isTrue);
      expect(left.roundNorthEast, isFalse);
      expect(left.roundSouthEast, isFalse);

      // Right segment fuses on its west side.
      expect(right.roundNorthEast, isTrue);
      expect(right.roundSouthEast, isTrue);
      expect(right.roundNorthWest, isFalse);
      expect(right.roundSouthWest, isFalse);
    });

    test('L-corner cell rounds only the fully open corner', () {
      final grid = gridFrom([
        '.#.',
        '.##',
        '...',
      ]);

      // Center of the L: wall above and wall to the east.
      final corner = geometryAt(WallShapeBuilder.build(grid), 1, 1);

      expect(corner.roundNorthWest, isFalse); // north neighbor is wall
      expect(corner.roundNorthEast, isFalse); // north + east are walls
      expect(corner.roundSouthEast, isFalse); // east neighbor is wall
      expect(corner.roundSouthWest, isTrue); // south + west are open
    });

    test('grid border counts as open space so outer silhouette rounds', () {
      final grid = gridFrom([
        '#.',
        '..',
      ]);

      final g = geometryAt(WallShapeBuilder.build(grid), 0, 0);

      expect(g.isIsolated, isTrue);
    });
  });
}
