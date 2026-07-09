import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/floor_tile_layout.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

void main() {
  group('FloorTileLayout', () {
    final grid = MazeGrid(
      width: 3,
      height: 2,
      cells: [
        [
          const MazeCell(type: CellType.start),
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.wall),
        ],
        [
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.exit),
          const MazeCell(type: CellType.floor),
        ],
      ],
    );

    test('same seed produces identical placements', () {
      final a = FloorTileLayout.forGrid(grid, seed: 42, variantCount: 4);
      final b = FloorTileLayout.forGrid(grid, seed: 42, variantCount: 4);

      expect(a.placements, equals(b.placements));
    });

    test('different seed reshuffles placements', () {
      final a = FloorTileLayout.forGrid(grid, seed: 1, variantCount: 4);
      final b = FloorTileLayout.forGrid(grid, seed: 2, variantCount: 4);

      expect(a.placements, isNot(equals(b.placements)));
    });

    test('walkable cells only receive variant indices in pool range', () {
      final layout = FloorTileLayout.forGrid(grid, seed: 7, variantCount: 4);

      expect(layout.placements.length, 5);
      for (final placement in layout.placements.values) {
        expect(placement.variantIndex, inInclusiveRange(0, 3));
        expect(placement.quarterTurns, inInclusiveRange(0, 3));
      }
    });

    test('floorLayoutSeedFor changes when retry count changes', () {
      expect(
        floorLayoutSeedFor(levelId: 'level_001', retryCount: 0),
        isNot(floorLayoutSeedFor(levelId: 'level_001', retryCount: 1)),
      );
    });
  });
}
