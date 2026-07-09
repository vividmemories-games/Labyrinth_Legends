import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/maze_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Floor tile variant assets bundled', () {
    for (final path in MazeTheme.ancientRuins.floorTileVariantPaths) {
      test(path, () async {
        final data = await rootBundle.load(path);
        expect(data.lengthInBytes, greaterThan(0));
      });
    }

    test(MazeTheme.ancientRuins.floorTilePath!, () async {
      final data = await rootBundle.load(MazeTheme.ancientRuins.floorTilePath!);
      expect(data.lengthInBytes, greaterThan(0));
    });
  });
}
