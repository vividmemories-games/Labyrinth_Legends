import 'dart:async';

import 'package:labyrinth_legends/core/services/ads_service.dart';

class MockAdsService implements AdsService {
  final bool _ready = true;

  @override
  bool get isRewardedReady => _ready;

  @override
  Future<void> initialize() async {}

  @override
  Future<void> showInterstitial({required String placement}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<bool> showRewardedAd({required String placement}) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
