> **NOTE (2026-07-06):** Painters are **interim fallback** until AB2 PNG sprites ship per [MVP_Visual_Target.md](../../06_Asset_Bible/MVP_Visual_Target.md). Sprite-first is the MVP delivery strategy.

# Review Package: M2.7 Premium Visual Foundation

> File: `docs/99_Reviews/Implementation/0068_m2_7_premium_visual_foundation.md`

## Metadata

| Field | Value |
|-------|-------|
| **Review ID** | 0068 |
| **Date** | 2026-07-05 |
| **Phase** | M2.7 — Premium Visual Foundation |
| **Owner** | Cursor |
| **Status** | Approved|
| **Review Type** | Implementation / Visual |
| **Template Version** | v2 |
| **Related Docs** | `Asset_Bible.md` · `UI.md` · `UI_04` · `UI_05` · `UI_08` · `LLDL.md` · `Components.md` |
| **Related Screens** | Gameplay |
| **Related Components** | LLGameplayAsset, LLHudIcon, MazeTilePainter, GameplayObjectPainter, PremiumPathOverlayPainter |

## Task Summary

Implemented the first production visual pass for gameplay presentation. Replaced flat colored tiles and Material Icons with premium LLDL-aligned programmatic rendering (carved stone tiles, bevel depth, engraved borders, bronze glyph accents, object painters for explorer/gem/key/lock/exit) and centralized asset catalog infrastructure (`LLGameplayAssets`, `LLGameplayAsset`, `LLHudIcon`). Bitmap paths are defined per AB2/AB3; when approved PNGs are bundled they load automatically via `Image.asset` with `gaplessPlayback`. Until then, documented programmatic placeholders render. HUD spacing, typography hierarchy, and icon consistency refined without layout redesign. **Engine, GameplaySession, and GameplayController unchanged.**

**Out of scope (respected):** camera tilt, isometric, particles, lighting/bloom, sound, haptics, large animations, shaders, reward presentation.

## Motivation

**Why:** M2.6 completed functional feedback polish but board/HUD still used primitive flat fills and Material Icons — below premium product bar defined in LLDL and Asset Bible.

**Problem solved:** Players immediately perceive carved stone chambers, readable object silhouettes, and cohesive HUD iconography while gameplay behavior remains identical.

**Approach:** Centralize asset paths; render via design-system painters + asset wrappers; keep all gameplay logic and hit-testing unchanged.

## Files Created

```text
assets/images/gameplay/.gitkeep
assets/images/icons/gameplay/.gitkeep
lib/design_system/assets/ll_gameplay_assets.dart
lib/design_system/assets/gameplay_asset_cache.dart
lib/design_system/components/gameplay/ll_gameplay_asset.dart
lib/design_system/components/gameplay/ll_hud_icon.dart
lib/design_system/components/gameplay/painting/maze_tile_painter.dart
lib/design_system/components/gameplay/painting/gameplay_object_painter.dart
lib/design_system/components/gameplay/painting/premium_path_overlay_painter.dart
test/design_system/ll_gameplay_assets_test.dart
docs/99_Reviews/Implementation/0068_m2_7_premium_visual_foundation.md
```

## Files Modified

```text
lib/design_system/assets/ll_asset_paths.dart — gameplay + HUD icon roots
lib/design_system/assets/ll_assets.dart — gameplay() + gameplayHudIcon() accessors
lib/design_system/assets/assets.dart — exports
lib/design_system/components/components.dart — exports
lib/design_system/components/gameplay/objective_card.dart — LLHudIcon, typography, shadow
lib/design_system/components/gameplay/resource_display.dart — GameplayHudIconKind API
lib/design_system/components/gameplay/primary_action_bar.dart — statusHudIconKind
lib/design_system/components/gameplay/pause_button.dart — LLHudIcon
lib/features/gameplay/presentation/widgets/tile_view.dart — MazeTilePainter + LLGameplayAsset
lib/features/gameplay/presentation/widgets/explorer_marker.dart — LLGameplayAsset
lib/features/gameplay/presentation/widgets/path_overlay.dart — PremiumPathOverlayPainter
lib/features/gameplay/presentation/gameplay_board_container.dart — bronze board frame
lib/features/gameplay/presentation/gameplay_layout.dart — HUD icon kinds
lib/features/gameplay/presentation/gameplay_feedback.dart — GameplayHudIconKind validation icons
pubspec.yaml — gameplay asset folders
test/features/gameplay_screen_test.dart — explorer marker key assertion
test/widget_test.dart — explorer marker key assertion
docs/99_Reviews/README.md — index entry 0068
```

## Files Deleted

```text
(none)
```

## Risk Assessment

| Field | Value |
|-------|-------|
| **Risk Level** | Low–Medium |
| **Affected Areas** | Gameplay presentation, design-system asset layer, HUD components |
| **Rollback Complexity** | Low |
| **Migration Required** | No |
| **User-Facing Impact** | Yes — substantial visual upgrade |

## Dependencies

### Depends On

- M2.6 gameplay feedback polish (complete)
- LLDL tokens + UI_08 asset integration rules
- Asset Bible AB2/AB3 category definitions

### Enables

- Dropping approved PNG/SVG art into catalog paths without widget rewrites
- M2.8+ reward/outcome presentation on premium visual base
- Golden screenshot tests for board states

### Blocks

- None

## Product Impact

| Area | Impact |
|------|--------|
| **Player-facing** | Yes — premium stone board, readable objects, refined HUD |
| **Visual impact** | High — carved tiles, engraved path, object painters |
| **UX impact** | Improved hierarchy and icon consistency; gameplay unchanged |
| **Performance impact** | Low — RepaintBoundary per tile/object; painters avoid decode until bitmaps ship |
| **Developer experience impact** | Single asset catalog; no direct Image.asset in features |

## Design System Impact

- Tokens added/changed: None (uses existing LLColor / LLThemeExtension)
- Components added: `LLGameplayAsset`, `LLHudIcon`, painters (`MazeTilePainter`, `GameplayObjectPainter`, `PremiumPathOverlayPainter`)
- Components changed: `ObjectiveCard`, `ResourceDisplay`, `PrimaryActionBar`, `PauseButton` — HUD icon API
- LLDL compliance: Stone/bronze/crystal/cyan roles preserved; gold for keys/explorer; cyan for path/portal
- Showcase updated: No

## Gameplay Impact

- Engine changes: **None**
- Mechanics affected: **None**
- Levels affected: **None** — visual only across all levels

## Architecture Impact

### Architecture Compliance

| Rule | Status |
|------|--------|
| Engine unchanged | ✅ |
| GameplaySession unchanged | ✅ |
| GameplayController unchanged | ✅ |
| Widgets render state only | ✅ |
| No direct Image.asset in features | ✅ — via LLGameplayAsset / LLHudIcon |
| AB2/AB3 boundary respected | ✅ — gameplay/ vs icons/gameplay/ |

### Asset Integration Summary

| System | Catalog path | Fallback |
|--------|-------------|----------|
| Floor/wall tiles | `environment/tile_*.png` | `MazeTilePainter` |
| Explorer | `explorer/explorer_idle.png` | Gold figure painter |
| Gem | `collectibles/gem_idle.png` | Crystal diamond painter |
| Key | `collectibles/key_idle.png` | Bronze key painter |
| Lock | `puzzle/lock_closed.png` | Engraved lock painter |
| Exit portal | `environment/exit_portal.png` | Portal glow painter |
| HUD icons | `icons/gameplay/icon_*.png` | Object painter or Material fallback |

### Asset Pipeline

```text
Approved AB2/AB3 art → assets/images/gameplay/** or icons/gameplay/**
                     → LLGameplayAssets.path(kind)
                     → LLGameplayAsset / LLHudIcon
                     → Image.asset (auto) OR programmatic painter (fallback)
```

`GameplayAssetCache` provides optional bundle presence checks for future precache.

### Performance Notes

- `RepaintBoundary` on tiles, path overlay, and gameplay assets
- CustomPainters use `shouldRepaint` guards
- `gaplessPlayback: true` on Image.asset for future bitmap swap
- No particle/shader systems; no per-frame decode in current placeholder mode

### Visual Comparison

| Before (M2.6) | After (M2.7) |
|---------------|--------------|
| Flat `BoxDecoration` tiles | Carved stone gradient + bevel + engraved border |
| Material Icons for all objects | LLDL object painters (gem/key/lock/portal/explorer) |
| Single-stroke path | Glow + core engraved path linework |
| Plain board panel border | Bronze-accent stone panel frame |
| Material HUD icons | LLHudIcon with catalog paths + fallbacks |

## Documentation Updated

```text
docs/99_Reviews/Implementation/0068_m2_7_premium_visual_foundation.md
docs/99_Reviews/README.md
```

## LLDL Compliance Notes

- [x] Stone matte floors/walls with value separation
- [x] Ancient gold for explorer/keys/commitment accents
- [x] Energy cyan for paths/portals only
- [x] Crystal purple for gems
- [x] Ember red for locks/invalid (multichannel: shape + border + icon)
- [x] No default Material styling on board
- [ ] `Components.md` — LLGameplayAsset / LLHudIcon not yet documented (deferred)

## Screenshots / Visual Evidence

| Screen | Description |
|--------|-------------|
| Gameplay board | Carved stone tiles + object painters — capture on device |
| level_003 | Key/lock/portal visual pass |
| HUD | Refined objective card + resource chips |

> Recommend Human capture after hot restart for review thread.

## Commands Run

```bash
fvm flutter analyze lib/features/gameplay lib/design_system/assets lib/design_system/components/gameplay
fvm flutter test
```

## Test / Analyze Results

| Command | Result |
|---------|--------|
| `flutter test` | **158 passed**, 0 failures |
| `flutter analyze` (M2.7 files) | **0 errors** (1 info-level prefer_const in painter) |

### Tests Added

```text
test/design_system/ll_gameplay_assets_test.dart — AB2/AB3 path convention
test/features/gameplay_screen_test.dart — explorer marker key (updated)
test/widget_test.dart — explorer marker key (updated)
```

## Known Limitations

- **No approved bitmap art bundled yet** — programmatic painters serve as documented placeholders
- Switch object painter exists but no levels use switches yet
- Relic/hidden cell visuals not implemented (engine fields exist)
- `Components.md` not updated for new components
- HUD status icons still fall back to Material for objective/pause/check variants without bitmaps

## Open Questions

- When will first AB2 PNG pack land for swap-in without painter changes?
- Should programmatic placeholders remain as permanent low-quality fallback or be removed once art ships?

## Future Technical Debt

- Document `LLGameplayAsset` / `LLHudIcon` in `Components.md`
- Add golden tests for tile/object painter combinations
- Precache bitmap assets on gameplay screen init when art pack available
- Promote `GameplayAssetCache` to warm cache on level load

## Recommended Next Task

**M2.8 — Rewards & Outcome Presentation:** Surface engine reward data on terminal won using premium visual foundation; bundle first AB2 PNG pack when available.

## Cursor Self-Assessment

- Scope respected: **Yes** — presentation only
- Docs updated: **Yes** (review package)
- Tests adequate: **Yes**
- Ready for external review: **Yes**

## Ready For

- [x] Codex Engineering Review
- [x] Human Approval

---

## Reviewer Notes

### Codex Engineering Review

- **Date:**
- **Verdict:**
- **Score:**
- **Blocking Issues:**
- **Recommendations:**


### Human Approval

- **Date:**
- **Verdict:**
- **Notes:**
