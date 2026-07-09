import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';

void main() {
  group('LLGameplayAssets', () {
    test('gameplay paths follow AB2 folder convention', () {
      expect(
        LLGameplayAssets.path(GameplayAssetKind.gem),
        'assets/images/gameplay/collectibles/gem_idle.png',
      );
      expect(
        LLGameplayAssets.path(GameplayAssetKind.exitPortal),
        'assets/images/gameplay/environment/exit_portal.png',
      );
    });

    test('hud icon paths follow AB3 folder convention', () {
      expect(
        LLGameplayAssets.hudIconPath(GameplayHudIconKind.gem),
        'assets/images/icons/gameplay/icon_gem.png',
      );
    });
  });
}
