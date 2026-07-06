import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';

/// AB2 in-maze asset identifiers — paths only; rendering falls back to
/// programmatic LLDL placeholders when files are not yet bundled (M2.7).
enum GameplayAssetKind {
  tileFloor,
  tileWall,
  explorer,
  gem,
  key,
  lockClosed,
  lockOpen,
  exitPortal,
  extensionHint,
  invalidBlock,
  switchOff,
}

/// AB3 gameplay HUD icon identifiers (functional, not in-maze world art).
enum GameplayHudIconKind {
  gem,
  key,
  objective,
  objectiveComplete,
  objectiveFailed,
  pause,
  statusCheck,
  statusBlock,
  statusLock,
  statusRefresh,
  statusClear,
}

/// Canonical gameplay-world and HUD icon paths per UI_08 / Asset Bible AB2–AB3.
abstract final class LLGameplayAssets {
  static String path(GameplayAssetKind kind) => switch (kind) {
        GameplayAssetKind.tileFloor =>
          '${LLAssetPaths.gameplayRoot}environment/tile_floor.png',
        GameplayAssetKind.tileWall =>
          '${LLAssetPaths.gameplayRoot}environment/tile_wall.png',
        GameplayAssetKind.explorer =>
          '${LLAssetPaths.gameplayRoot}explorer/explorer_idle.png',
        GameplayAssetKind.gem =>
          '${LLAssetPaths.gameplayRoot}collectibles/gem_idle.png',
        GameplayAssetKind.key =>
          '${LLAssetPaths.gameplayRoot}collectibles/key_idle.png',
        GameplayAssetKind.lockClosed =>
          '${LLAssetPaths.gameplayRoot}puzzle/lock_closed.png',
        GameplayAssetKind.lockOpen =>
          '${LLAssetPaths.gameplayRoot}puzzle/lock_open.png',
        GameplayAssetKind.exitPortal =>
          '${LLAssetPaths.gameplayRoot}environment/exit_portal.png',
        GameplayAssetKind.extensionHint =>
          '${LLAssetPaths.gameplayRoot}feedback/extension_hint.png',
        GameplayAssetKind.invalidBlock =>
          '${LLAssetPaths.gameplayRoot}feedback/invalid_block.png',
        GameplayAssetKind.switchOff =>
          '${LLAssetPaths.gameplayRoot}puzzle/switch_off.png',
      };

  static String hudIconPath(GameplayHudIconKind kind) => switch (kind) {
        GameplayHudIconKind.gem =>
          '${LLAssetPaths.gameplayIconsRoot}icon_gem.png',
        GameplayHudIconKind.key =>
          '${LLAssetPaths.gameplayIconsRoot}icon_key.png',
        GameplayHudIconKind.objective =>
          '${LLAssetPaths.gameplayIconsRoot}icon_objective.png',
        GameplayHudIconKind.objectiveComplete =>
          '${LLAssetPaths.gameplayIconsRoot}icon_objective_complete.png',
        GameplayHudIconKind.objectiveFailed =>
          '${LLAssetPaths.gameplayIconsRoot}icon_objective_failed.png',
        GameplayHudIconKind.pause =>
          '${LLAssetPaths.gameplayIconsRoot}icon_pause.png',
        GameplayHudIconKind.statusCheck =>
          '${LLAssetPaths.gameplayIconsRoot}icon_status_check.png',
        GameplayHudIconKind.statusBlock =>
          '${LLAssetPaths.gameplayIconsRoot}icon_status_block.png',
        GameplayHudIconKind.statusLock =>
          '${LLAssetPaths.gameplayIconsRoot}icon_status_lock.png',
        GameplayHudIconKind.statusRefresh =>
          '${LLAssetPaths.gameplayIconsRoot}icon_status_refresh.png',
        GameplayHudIconKind.statusClear =>
          '${LLAssetPaths.gameplayIconsRoot}icon_status_clear.png',
      };
}
