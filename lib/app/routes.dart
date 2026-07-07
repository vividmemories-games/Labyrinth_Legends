/// Production route paths and names.
abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String gameplay = '/play/:levelId';
  static const String gameplayDefault = '/play/level_001';

  static const String home = '/';
  static const String worlds = '/worlds';
  static const String levelSelect = '/worlds/:worldId/levels';
  static const String complete = '/complete/:levelId';
  static const String shop = '/shop';
  static const String settings = '/settings';
  static const String daily = '/daily';
  static const String designSystemShowcase = '/dev/design-system';
  static const String engineDebugSandbox = '/dev/engine-sandbox';
  static const String mazeRenderPoc = '/dev/maze-render-poc';
}
