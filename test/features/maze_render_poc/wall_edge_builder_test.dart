import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/wall_edge_builder.dart';
import 'package:labyrinth_legends/game_engine/models/cell_edges.dart';
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

void main() {
  group('WallEdgeBuilder', () {
    test('no edges on a fully open board', () {
      final grid = gridFrom([
        '..',
        '..',
      ]);

      expect(WallEdgeBuilder.build(grid), isEmpty);
    });

    test('single wall cell is fenced by its four boundary edges', () {
      final grid = gridFrom([
        '...',
        '.#.',
        '...',
      ]);

      final edges = WallEdgeBuilder.build(grid);

      expect(edges, hasLength(4));
      expect(edges, contains(const MazeEdge.vertical(row: 1, col: 0)));
      expect(edges, contains(const MazeEdge.vertical(row: 1, col: 1)));
      expect(edges, contains(const MazeEdge.horizontal(row: 0, col: 1)));
      expect(edges, contains(const MazeEdge.horizontal(row: 1, col: 1)));
    });

    test('level_001 layout: corridor tiles share edges with the wall line',
        () {
      // Same layout as the pre-v2 assets/levels/world_1/level_001.json.
      final grid = gridFrom([
        '#######',
        '#.....#',
        '#.###.#',
        '#.#...#',
        '#.###.#',
        '#.....#',
        '#######',
      ]);

      final edges = WallEdgeBuilder.build(grid);

      // Top corridor tiles (row 1, cols 2-4) get a raised bottom edge —
      // the boundary they share with the interior wall row below them.
      expect(edges, contains(const MazeEdge.horizontal(row: 1, col: 2)));
      expect(edges, contains(const MazeEdge.horizontal(row: 1, col: 3)));
      expect(edges, contains(const MazeEdge.horizontal(row: 1, col: 4)));

      // The tiles below that same wall line (row 3, cols 3-4) get a raised
      // top edge — one shared wall, expressed on both sides.
      expect(edges, contains(const MazeEdge.horizontal(row: 2, col: 3)));
      expect(edges, contains(const MazeEdge.horizontal(row: 2, col: 4)));

      // No edge between two adjacent corridor tiles.
      expect(
        edges,
        isNot(contains(const MazeEdge.vertical(row: 1, col: 2))),
      );

      // No edge inside the wall region itself.
      expect(
        edges,
        isNot(contains(const MazeEdge.vertical(row: 2, col: 2))),
      );

      // No edge on the board's outer silhouette (border ring is open to
      // the outside so the maze sits on a continuous floor).
      expect(
        edges,
        isNot(contains(const MazeEdge.horizontal(row: 0, col: 0))),
      );
    });

    test('schema v2 blockedEdges produce the same boundary edges', () {
      // Equivalent to a single interior wall cell at (1,1) expressed as
      // blockedEdges on the four surrounding floor cells.
      final grid = MazeGrid(
        width: 3,
        height: 3,
        cells: [
          [
            const MazeCell(type: CellType.floor),
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(south: true),
            ),
            const MazeCell(type: CellType.floor),
          ],
          [
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(east: true),
            ),
            const MazeCell(type: CellType.floor),
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(west: true),
            ),
          ],
          [
            const MazeCell(type: CellType.floor),
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(north: true),
            ),
            const MazeCell(type: CellType.floor),
          ],
        ],
      );

      final edges = WallEdgeBuilder.build(grid);

      expect(edges, hasLength(4));
      expect(edges, contains(const MazeEdge.vertical(row: 1, col: 0)));
      expect(edges, contains(const MazeEdge.vertical(row: 1, col: 1)));
      expect(edges, contains(const MazeEdge.horizontal(row: 0, col: 1)));
      expect(edges, contains(const MazeEdge.horizontal(row: 1, col: 1)));
    });

    test('schema v2 T-junction (level_005) yields three edges on center cell',
        () {
      final grid = MazeGrid(
        width: 3,
        height: 3,
        cells: [
          [
            const MazeCell(type: CellType.start),
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
          ],
          [
            const MazeCell(type: CellType.floor),
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(north: true, south: true, east: true),
            ),
            const MazeCell(type: CellType.floor),
          ],
          [
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.exit),
          ],
        ],
      );

      final edges = WallEdgeBuilder.build(grid);

      expect(edges, contains(const MazeEdge.horizontal(row: 0, col: 1)));
      expect(edges, contains(const MazeEdge.horizontal(row: 1, col: 1)));
      expect(edges, contains(const MazeEdge.vertical(row: 1, col: 1)));
      expect(edges, hasLength(3));
    });
  });
}
