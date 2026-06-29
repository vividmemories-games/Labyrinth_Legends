abstract class RemoteConfigService {
  Future<void> initialize();
  Future<void> fetchAndActivate();
  int getInt(String key, {required int defaultValue});
  bool getBool(String key, {required bool defaultValue});
  String getString(String key, {required String defaultValue});
}
