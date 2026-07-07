import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/repositories/level_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LevelRepository', () {
    test('loadWorld returns only M1 validated band for world_1', () async {
      final repository = LevelRepository();
      final levels = await repository.loadWorld('world_1');

      expect(levels, hasLength(10));
      expect(
        levels.map((level) => level.id).toList(),
        [
          for (var i = 1; i <= 10; i++)
            'level_${i.toString().padLeft(3, '0')}',
        ],
      );
      for (final level in levels) {
        expect(level.schemaVersion, 2);
      }
    });

    test('loadLevel loads a single validated level', () async {
      final repository = LevelRepository();
      final level = await repository.loadLevel(
        worldId: 'world_1',
        levelId: 'level_001',
      );

      expect(level.id, 'level_001');
      expect(level.worldId, 'world_1');
    });
  });
}
