enum PurchaseProduct {
  removeAds,
  gemPackSmall,
  gemPackLarge,
  hintPack,
  premiumUnlock,
}

abstract class PurchaseService {
  Future<void> initialize();
  Future<bool> purchase(PurchaseProduct product);
  Future<void> restorePurchases();
  Stream<PurchaseProduct> get purchaseUpdates;
  bool get isPremium;
  bool get adsRemoved;
}
