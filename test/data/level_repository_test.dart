import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/repositories/level_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LevelRepository', () {
    test('loadWorld returns only M1 validated band for world_1', () async {
      final repository = LevelRepository();
      final levels = await repository.loadWorld('world_1');

      expect(levels, hasLength(3));
      expect(
        levels.map((level) => level.id).toList(),
        ['level_001', 'level_002', 'level_003'],
      );
      for (final level in levels) {
        expect(level.schemaVersion, 1);
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
