import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/generation/maze_generator.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';

void main() {
  test('generates odd-sized maze with start and exit', () {
    final grid = MazeGenerator().generate(width: 7, height: 7, seed: 42);

    expect(grid.width, 7);
    expect(grid.height, 7);
    expect(grid.findStart(), isNotNull);
    expect(grid.findExit(), isNotNull);
    expect(grid.cellAt(grid.findStart()!).type, CellType.start);
    expect(grid.cellAt(grid.findExit()!).type, CellType.exit);
  });

  test('same seed produces identical layout', () {
    final generator = MazeGenerator();
    final a = generator.generate(width: 9, height: 9, seed: 7);
    final b = generator.generate(width: 9, height: 9, seed: 7);
    expect(a.toJson(), b.toJson());
  });
}
