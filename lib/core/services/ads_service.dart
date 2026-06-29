abstract class AdsService {
  Future<void> initialize();
  Future<bool> showRewardedAd({required String placement});
  Future<void> showInterstitial({required String placement});
  bool get isRewardedReady;
}
