import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Gameplay sprites bundled in AssetManifest', () {
    for (final kind in GameplayAssetKind.values) {
      test(LLGameplayAssets.path(kind), () async {
        final path = LLGameplayAssets.path(kind);
        final data = await rootBundle.load(path);
        expect(
          data.lengthInBytes,
          greaterThan(0),
          reason: 'Add $path to pubspec.yaml (Flutter does not recurse folders)',
        );
      });
    }

    for (final kind in GameplayHudIconKind.values) {
      test(LLGameplayAssets.hudIconPath(kind), () async {
        final path = LLGameplayAssets.hudIconPath(kind);
        final data = await rootBundle.load(path);
        expect(data.lengthInBytes, greaterThan(0));
      });
    }
  });
}
