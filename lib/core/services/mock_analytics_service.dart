import 'package:flutter/foundation.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';
import 'package:labyrinth_legends/core/services/analytics_service.dart';

class MockAnalyticsService implements AnalyticsService {
  @override
  Future<void> initialize() async {}

  @override
  void logEvent(String name, {Map<String, Object?> parameters = const {}}) {
    if (AppEnv.enableDebugOverlays) {
      debugPrint('[Analytics] $name $parameters');
    }
  }

  @override
  void logScreenView(String screenName) {
    if (AppEnv.enableDebugOverlays) {
      debugPrint('[Analytics] screen: $screenName');
    }
  }

  @override
  void setUserProperty(String name, String value) {
    if (AppEnv.enableDebugOverlays) {
      debugPrint('[Analytics] user.$name = $value');
    }
  }
}
