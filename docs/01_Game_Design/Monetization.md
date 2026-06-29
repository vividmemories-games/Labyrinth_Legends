# Monetization

## Philosophy

Premium feel first. Monetization supports convenience and cosmetics — not pay-to-win maze solutions.

## MVP Hooks (mock interfaces)

| Placement | Type |
|-----------|------|
| Level complete | Rewarded ad — 2× coins (optional) |
| Hint broke | Rewarded ad — free hint |
| Shop | Gem packs, hint packs, remove ads |
| Interstitial | Between worlds (sparingly) |

## IAP SKUs (planned)

- Starter pack
- Gem cache (small/medium/large)
- Remove ads
- Premium theme pack

## Ads

`AdsService` interface — mock returns success until AdMob integrated.

## Remote Tuning

`RemoteConfigService` for hint costs, ad frequency, starter gems — Firebase later.

## Compliance

- COPPA / age gate if needed
- Restore purchases on iOS
- Clear pricing in shop per store guidelines
