import 'dart:async';

import 'package:labyrinth_legends/core/services/purchase_service.dart';

class MockPurchaseService implements PurchaseService {
  final _controller = StreamController<PurchaseProduct>.broadcast();
  bool _premium = false;
  bool _adsRemoved = false;

  @override
  bool get adsRemoved => _adsRemoved;

  @override
  bool get isPremium => _premium;

  @override
  Stream<PurchaseProduct> get purchaseUpdates => _controller.stream;

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> purchase(PurchaseProduct product) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    switch (product) {
      case PurchaseProduct.removeAds:
        _adsRemoved = true;
      case PurchaseProduct.premiumUnlock:
        _premium = true;
        _adsRemoved = true;
      case PurchaseProduct.gemPackSmall:
      case PurchaseProduct.gemPackLarge:
      case PurchaseProduct.hintPack:
        break;
    }
    _controller.add(product);
    return true;
  }

  @override
  Future<void> restorePurchases() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  void dispose() => _controller.close();
}
