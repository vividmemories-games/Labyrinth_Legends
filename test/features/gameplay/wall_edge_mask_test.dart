import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/board/cell_edge_mask.dart';
import 'package:labyrinth_legends/game_engine/models/cell_edges.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

void main() {
  group('CellEdgeMask', () {
    test('perimeter cell has north and west edges from resolved grid', () {
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
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
          ],
          [
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.exit),
          ],
        ],
      );

      final mask = CellEdgeMask.forCell(grid, const GridPosition(row: 0, col: 0));

      expect(mask.north, isTrue);
      expect(mask.west, isTrue);
      expect(
        mask.layeredOverlays,
        contains(GameplayAssetKind.edgeCornerNorthWest),
      );
    });

    test('inner corridor uses east and west overlays', () {
      final grid = MazeGrid(
        width: 3,
        height: 3,
        cells: [
          [
            const MazeCell(type: CellType.start),
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.exit),
          ],
          [
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(east: true, west: true),
            ),
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(east: true, west: true),
            ),
            const MazeCell(
              type: CellType.floor,
              blockedEdges: CellEdges(east: true, west: true),
            ),
          ],
          [
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
            const MazeCell(type: CellType.floor),
          ],
        ],
      );

      final mask = CellEdgeMask.forCell(grid, const GridPosition(row: 1, col: 1));

      expect(mask.east, isTrue);
      expect(mask.west, isTrue);
      expect(mask.layeredOverlays, contains(GameplayAssetKind.edgeEast));
      expect(mask.layeredOverlays, contains(GameplayAssetKind.edgeWest));
    });
  });
}
