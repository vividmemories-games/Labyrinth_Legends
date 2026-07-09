import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/level_select/presentation/level_path_layout.dart';

void main() {
  group('LevelPathLayout', () {
    test('level 1 anchor is below later levels on canvas', () {
      const width = 400.0;
      const levelCount = 20;

      final level1 = LevelPathLayout.nodeCenter(0, width, levelCount);
      final level2 = LevelPathLayout.nodeCenter(1, width, levelCount);
      final level20 = LevelPathLayout.nodeCenter(19, width, levelCount);

      expect(level1.dy, greaterThan(level2.dy));
      expect(level2.dy, greaterThan(level20.dy));
    });

    test('canvas height grows with level count', () {
      expect(
        LevelPathLayout.canvasHeight(20),
        greaterThan(LevelPathLayout.canvasHeight(5)),
      );
    });
  });
}
