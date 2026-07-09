import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/migration/level_v1_to_v2_converter.dart';
import 'package:labyrinth_legends/game_engine/models/cell_edges.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';

void main() {
  const converter = LevelV1ToV2Converter();

  test('converts v1 wall ring to v2 cropped grid with perimeter edges', () {
    final v1 = MazeGrid(
      width: 3,
      height: 3,
      cells: [
        [
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
        ],
        [
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.start),
          const MazeCell(type: CellType.wall),
        ],
        [
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
        ],
      ],
    );

    final v2 = converter.convertGrid(v1);

    expect(v2.width, 1);
    expect(v2.height, 1);
    expect(v2.cellAt(const GridPosition(row: 0, col: 0)).type, CellType.start);
    expect(v2.resolvedEdgesAt(const GridPosition(row: 0, col: 0)).north, isTrue);
    expect(v2.resolvedEdgesAt(const GridPosition(row: 0, col: 0)).south, isTrue);
    expect(v2.resolvedEdgesAt(const GridPosition(row: 0, col: 0)).east, isTrue);
    expect(v2.resolvedEdgesAt(const GridPosition(row: 0, col: 0)).west, isTrue);
  });

  test('converts interior v1 wall cells inside crop to impassable floor', () {
    final v1 = MazeGrid(
      width: 5,
      height: 3,
      cells: [
        [
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.start),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
        ],
        [
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.wall),
        ],
        [
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.wall),
        ],
      ],
    );

    final v2 = converter.convertGrid(v1);

    expect(v2.width, 3);
    expect(v2.height, 2);
    expect(v2.cellAt(const GridPosition(row: 0, col: 1)).type, CellType.floor);
    expect(v2.cellAt(const GridPosition(row: 1, col: 1)).type, CellType.floor);
    expect(
      v2.cellAt(const GridPosition(row: 1, col: 1)).blockedEdges,
      const CellEdges(
        north: true,
        east: true,
        south: true,
        west: true,
      ),
    );
  });

  test('converts interior v1 wall to blocked edges on neighbors', () {
    final v1 = MazeGrid(
      width: 3,
      height: 3,
      cells: [
        [
          const MazeCell(type: CellType.start),
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.exit),
        ],
        [
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.wall),
          const MazeCell(type: CellType.floor),
        ],
        [
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.floor),
          const MazeCell(type: CellType.floor),
        ],
      ],
    );

    final v2 = converter.convertGrid(v1);

    expect(v2.width, 3);
    expect(v2.height, 3);
    expect(
      v2.cellAt(const GridPosition(row: 0, col: 1)).blockedEdges.south,
      isTrue,
    );
    expect(
      v2.cellAt(const GridPosition(row: 1, col: 0)).blockedEdges.east,
      isTrue,
    );
    expect(
      v2.cellAt(const GridPosition(row: 1, col: 2)).blockedEdges.west,
      isTrue,
    );
    expect(
      v2.cellAt(const GridPosition(row: 2, col: 1)).blockedEdges.north,
      isTrue,
    );
  });
}
