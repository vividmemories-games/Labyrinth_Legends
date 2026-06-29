enum AppFlavor { dev, prod }

/// Runtime environment resolved from `--dart-define=FLAVOR=dev|prod`.
abstract final class AppEnv {
  static const String _flavorKey = 'FLAVOR';

  static AppFlavor get flavor {
    const raw = String.fromEnvironment(_flavorKey, defaultValue: 'dev');
    return switch (raw.toLowerCase()) {
      'prod' || 'production' => AppFlavor.prod,
      _ => AppFlavor.dev,
    };
  }

  static bool get isDev => flavor == AppFlavor.dev;
  static bool get isProd => flavor == AppFlavor.prod;

  static String get appName =>
      isDev ? 'Labyrinth Legends (Dev)' : 'Labyrinth Legends';

  static bool get enableMockAds => isDev;
  static bool get enableDebugOverlays => isDev;
}
