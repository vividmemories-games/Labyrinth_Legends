import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/services/ads_service.dart';
import 'package:labyrinth_legends/core/services/analytics_service.dart';
import 'package:labyrinth_legends/core/services/mock_ads_service.dart';
import 'package:labyrinth_legends/core/services/mock_analytics_service.dart';
import 'package:labyrinth_legends/core/services/mock_purchase_service.dart';
import 'package:labyrinth_legends/core/services/mock_remote_config_service.dart';
import 'package:labyrinth_legends/core/services/purchase_service.dart';
import 'package:labyrinth_legends/core/services/remote_config_service.dart';

final adsServiceProvider = Provider<AdsService>((ref) => MockAdsService());

final purchaseServiceProvider = Provider<PurchaseService>((ref) {
  final service = MockPurchaseService();
  ref.onDispose(service.dispose);
  return service;
});

final analyticsServiceProvider =
    Provider<AnalyticsService>((ref) => MockAnalyticsService());

final remoteConfigServiceProvider =
    Provider<RemoteConfigService>((ref) => MockRemoteConfigService());
