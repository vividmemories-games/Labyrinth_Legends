import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';

/// Asset access layer — single entry point for UI and gameplay asset resolution.
abstract final class LLAssets {
  static String icon(String fileName) => '${LLAssetPaths.iconsRoot}$fileName';

  static String illustration(String fileName) =>
      '${LLAssetPaths.illustrationsRoot}$fileName';

  static String background(String fileName) =>
      '${LLAssetPaths.backgroundsRoot}$fileName';

  static String image(String fileName) => '${LLAssetPaths.imagesRoot}$fileName';

  static String levelJson(String worldId, String levelFileName) =>
      '${LLAssetPaths.levelsRoot}$worldId/$levelFileName';

  static String gameplay(GameplayAssetKind kind) =>
      LLGameplayAssets.path(kind);

  static String gameplayHudIcon(GameplayHudIconKind kind) =>
      LLGameplayAssets.hudIconPath(kind);
}
