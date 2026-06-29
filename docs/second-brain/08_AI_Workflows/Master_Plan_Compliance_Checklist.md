# Master Plan Compliance Checklist

Use before merging Phase milestones.

## Architecture
- [ ] Game logic lives in `lib/game_engine/` (not widgets)
- [ ] UI screens in `lib/features/` only render and forward input
- [ ] Progress via `lib/data/repositories/`
- [ ] Riverpod providers centralized in `lib/data/providers.dart`

## MVP Gameplay
- [ ] Draw path → Go → cell-by-cell execution
- [ ] Levels 1–5 tutorial (gems, key/lock, fog, relic)
- [ ] Levels 6–20 stub chambers load from JSON
- [ ] DiscoveryEngine fog + relic-gated cells on level 5
- [ ] Local progression persists (coins, stars, unlocks)

## Visual
- [ ] Ancient Tech / Mystical Ruins theme
- [ ] Faux-isometric `CustomPainter` maze board

## Out of scope (Phase 1)
- [ ] No Firebase, ads SDK, or IAP — mocks only
- [ ] No real-time joystick control

## Quality
- [ ] `fvm flutter test` passes
- [ ] `fvm flutter analyze` has no warnings
- [ ] Decision_Log updated for material changes
