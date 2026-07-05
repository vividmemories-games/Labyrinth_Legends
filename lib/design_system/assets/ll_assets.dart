import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';

/// Asset access layer — single entry point for UI asset resolution.
///
/// Gameplay-world artwork loading belongs to later milestones; this layer
/// governs UI-facing asset paths per UI_08.
abstract final class LLAssets {
  static String icon(String fileName) => '${LLAssetPaths.iconsRoot}$fileName';

  static String illustration(String fileName) =>
      '${LLAssetPaths.illustrationsRoot}$fileName';

  static String background(String fileName) =>
      '${LLAssetPaths.backgroundsRoot}$fileName';

  static String image(String fileName) => '${LLAssetPaths.imagesRoot}$fileName';

  static String levelJson(String worldId, String levelFileName) =>
      '${LLAssetPaths.levelsRoot}$worldId/$levelFileName';
}
