import 'package:labyrinth_legends/core/env/app_env.dart';

/// Runtime debug configuration for development overlays and hooks.
abstract final class DebugConfig {
  static bool overlayEnabled = AppEnv.enableDebugOverlays;
  static bool showFps = true;
  static bool showEngineStatus = true;
  static bool showGrid = false;

  static void toggleGrid() {
    showGrid = !showGrid;
  }
}
