# Review Package: Weathered Button Tokens

> File: `docs/99_Reviews/Design_System/0073_weathered_button_tokens.md`

## Metadata

| Field | Value |
|-------|-------|
| **Review ID** | 0073 |
| **Date** | 2026-07-06 |
| **Phase** | M2.8 Weathered Button Tokens |
| **Owner** | Cursor |
| **Status** | Approved|
| **Review Type** | Design System |
| **Template Version** | v2 |
| **Related Docs** | `Design_Tokens.md` · `Components.md` · `Home.md` · `Decisions.md` |
| **Related Screens** | Home + all LLButton consumers |
| **Related Components** | `LLButton`, `LLFloatingButton`, `LLScreenBackground` |

## Task Summary

Implemented global weathered button styling across the design system: new bronze/stone color tokens, updated gradients and plate shadows, AI-generated texture skins for primary/secondary buttons, and `LLButton`/`LLFloatingButton` wiring. Home screen updated with zoomed-out hero (`heroScale`), Cinzel title positioned over gate lintel, and opaque logo image removed.

**Out of scope:** `LLIconButton` weathered skins, 9-slice button assets, danger/ghost texture plates.

## Motivation

**Why:** Human direction — buttons should look rusting, weathered, and broken like the master mockup, consistently on every screen.

**Problem solved:** Glossy gradient buttons diverged from LLDL “engraved plate” language; home logo blocked portal atmosphere.

**Approach:** Token + single component change (not per-screen overrides); texture underlay with gradient fallback.

## Files Created

```text
assets/images/ui/button_primary_weathered.png
assets/images/ui/button_secondary_weathered.png
docs/99_Reviews/Design_System/0073_weathered_button_tokens.md
```

## Files Modified

```text
lib/design_system/tokens/ll_color.dart
lib/design_system/tokens/ll_gradient.dart
lib/design_system/tokens/ll_shadow.dart
lib/design_system/assets/ll_asset_paths.dart
lib/design_system/components/ll_button.dart
lib/design_system/components/ll_floating_button.dart
lib/design_system/components/ll_screen_background.dart
lib/features/home/presentation/home_screen.dart
lib/features/home/presentation/home_mock_data.dart
pubspec.yaml
docs/02_Design_System/Design_Tokens.md
docs/02_Design_System/Components.md
docs/02_Design_System/Typography.md
docs/03_Screens/Home.md
docs/00_Project/Decisions.md
```

## Files Deleted

```text
(none)
```

## Risk Assessment

| Field | Value |
|-------|-------|
| **Risk Level** | Low |
| **Affected Areas** | All LLButton surfaces globally |
| **Rollback Complexity** | Low |
| **Migration Required** | No |
| **User-Facing Impact** | Yes |

## Dependencies

### Depends On

- MVP visual pivot (`0071`)
- Home visual pass (`0072`)

### Enables

- Consistent meta-game UI across remaining screen shells

### Blocks

- None

## Product Impact

| Area | Impact |
|------|--------|
| **Player-facing** | Yes |
| **Visual impact** | High — weathered plates on all CTAs |
| **UX impact** | Positive — matches ancient temple identity |
| **Performance impact** | Low — two small PNG textures |
| **Developer experience impact** | Positive — one component, global style |

## Design System Impact

- Tokens added/changed: `bronzeRust`, `oxidizedBronze`, `weatheredStone`, border alphas, `weatheredPlate` shadows, button gradients
- Components changed: `LLButton`, `LLFloatingButton`, `LLScreenBackground`
- LLDL compliance notes: Gold primary role preserved; cyan on secondary borders only
- Showcase updated: Inherits automatically via `LLButton`

## Gameplay Impact

- Engine changes: None
- Mechanics affected: None
- Levels affected: None

## Architecture Impact

- Layers touched: `design_system/` + `features/home/`
- New dependencies: None
- Service interfaces: None

## Documentation Updated

```text
docs/02_Design_System/Design_Tokens.md
docs/02_Design_System/Components.md
docs/02_Design_System/Typography.md
docs/03_Screens/Home.md
docs/00_Project/Decisions.md
```

## LLDL Compliance Notes

- [x] Primary actions use Ancient Gold family (weathered bronze)
- [x] Cyan reserved for energy/secondary borders
- [x] No hardcoded visual values in feature screens
- [x] No default Material styling without LLDL wrappers
- [x] Components documented in `Components.md`

## Screenshots / Visual Evidence

| Screen | Path or description |
|--------|---------------------|
| Home | `fvm flutter run --dart-define=FLAVOR=dev` |
| Design System showcase | `/dev/design-system` button section |

## Commands Run

```bash
fvm flutter test
fvm flutter analyze --no-fatal-infos
```

## Test / Analyze Results

| Command | Result |
|---------|--------|
| `flutter test` | 158 passed |
| `flutter analyze` | exit 0 |

## Known Issues

- Button textures are AI-generated — may be replaced with authored 9-slice AB3 assets
- Ghost/danger variants use gradient only (no texture skin yet)

## Open Questions

- Should `LLIconButton` get matching weathered square plates for dock/toolbar parity?

## Future Technical Debt

### Known Shortcuts

- `BoxFit.fill` stretch on textures vs proper 9-slice

### Future Cleanup Tasks

- Author 9-slice button skins per AB3
- Weathered `LLIconButton` variant

## Recommended Next Task

Level Select shell against mockup + spot-check pause/level-complete buttons on device.

## Cursor Self-Assessment

- Scope respected: Yes
- Docs updated: Yes
- Tests adequate: Pending run
- Ready for external review: Yes

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
