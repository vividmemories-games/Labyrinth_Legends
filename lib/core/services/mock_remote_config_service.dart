import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/core/services/remote_config_service.dart';

class MockRemoteConfigService implements RemoteConfigService {
  final Map<String, Object> _values = {
    'hint_cost_gems': GameConstants.hintCostGems,
    'fog_reveal_radius': GameConstants.fogRevealRadius,
    'daily_challenge_enabled': true,
    'shop_enabled': true,
  };

  @override
  Future<void> fetchAndActivate() async {}

  @override
  Future<void> initialize() async {}

  @override
  bool getBool(String key, {required bool defaultValue}) {
    final value = _values[key];
    return value is bool ? value : defaultValue;
  }

  @override
  int getInt(String key, {required int defaultValue}) {
    final value = _values[key];
    return value is int ? value : defaultValue;
  }

  @override
  String getString(String key, {required String defaultValue}) {
    final value = _values[key];
    return value is String ? value : defaultValue;
  }
}
