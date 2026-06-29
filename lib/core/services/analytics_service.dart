abstract class AnalyticsService {
  Future<void> initialize();
  void logEvent(String name, {Map<String, Object?> parameters = const {}});
  void logScreenView(String screenName);
  void setUserProperty(String name, String value);
}
