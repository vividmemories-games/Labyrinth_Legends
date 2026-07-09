import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/gameplay/level_navigator.dart';

void main() {
  group('LevelNavigator', () {
    test('sequentialLevelIds returns sorted M1 validated levels', () {
      expect(
        LevelNavigator.sequentialLevelIds,
        [
          for (var i = 1; i <= 10; i++)
            'level_${i.toString().padLeft(3, '0')}',
        ],
      );
    });

    test('nextLevelIdAfter advances sequentially', () {
      expect(LevelNavigator.nextLevelIdAfter('level_001'), 'level_002');
      expect(LevelNavigator.nextLevelIdAfter('level_009'), 'level_010');
    });

    test('nextLevelIdAfter returns null for final level', () {
      expect(LevelNavigator.nextLevelIdAfter('level_010'), isNull);
    });

    test('nextLevelIdAfter returns null for unknown level', () {
      expect(LevelNavigator.nextLevelIdAfter('level_999'), isNull);
    });

    test('hasNextLevel reflects availability', () {
      expect(LevelNavigator.hasNextLevel('level_001'), isTrue);
      expect(LevelNavigator.hasNextLevel('level_010'), isFalse);
    });
  });
}
