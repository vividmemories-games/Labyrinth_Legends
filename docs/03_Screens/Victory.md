# Victory

**Route:** `/complete/:levelId`  
**Mockup:** Stars, treasure chest, reward summary

## Flow (M2.9 vertical slice)

1. Player wins on gameplay board
2. **Celebration overlay** on gameplay (~1.5s) while `CompletionSyncService` saves progress (Firebase hook later)
3. Auto-navigate to this screen with session reward snapshot

## Layout

- `LLScreenBackground` (implemented)
- Title: "Level Complete" (gold)
- Star row (Material icons until `LLStarRating` ships)
- Rewards: coins, gems (`LLCurrencyChip`)
- `LLButton` primary — Next Level
- `LLButton` secondary — Retry
- `LLButton` ghost — Level Select / Home
- Future: rewarded ad 2× coins placeholder

## Components

`LLRewardPopup` pattern, `LLStarRating`, `LLButton`
