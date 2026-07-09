`# Review Package: Home Screen Shell

## Metadata

| Field | Value |
|-------|-------|
| **Review ID** | 0002 |
| **Date** | 2026-06-28 |
| **Phase** | Phase 1 — Screen Shells |
| **Owner** | Cursor |
| **Status** | Ready for Review |
| **Review Type** | Screen |
| **Related Docs** | `docs/03_Screens/Home.md`, `docs/02_Design_System/LLDL/LLDL.md` |
| **Related Screens** | Home |
| **Related Components** | LLScreenBackground, LLTopBar, LLPanel, LLButton, LLCurrencyChip, LLSection |

## Task Summary

Rebuilt the Home screen as a static LLDS-compliant shell per `docs/03_Screens/Home.md`, using only `lib/design_system/` components and tokens. Mock data drives currency, daily challenge, and continue-playing cards. Dev flavor exposes a link to the design system showcase. No navigation to gameplay worlds yet; no persistence or Firebase.

**Out of scope:** Live save data, shop/settings navigation wiring, animations, real daily challenge seeding.

## Files Created

```text
lib/features/home/presentation/home_screen.dart
lib/features/home/presentation/home_mock_data.dart
```

## Files Modified

```text
lib/app/router.dart — Home as initial route
test/widget_test.dart — asserts app boots to home screen
```

## Files Deleted

```text
(none — prior prototype home may coexist in other paths; this is the LLDS shell)
```

## Design System Impact

- First production consumer of LL* components in `lib/features/`
- Validates LLCurrencyChip, LLTopBar, LLPanel, LLButton in a real screen layout
- Confirms gold primary CTA ("Continue Journey") vs cyan accents

## Gameplay Impact

None. Home is a static shell with mock data. No `game_engine/` changes.

## Architecture Impact

- Feature lives in `lib/features/home/presentation/` — presentation only
- Mock data isolated in `home_mock_data.dart`
- Router unchanged except Home route target

## Documentation Updated

```text
(none in this milestone — Home.md already existed as spec)
```

## LLDL Compliance Notes

- [x] Uses LL* components exclusively in home_screen.dart
- [x] Gold primary CTA for Continue Journey
- [x] Cyan used for energy/progress accents only
- [x] Dark temple background via LLScreenBackground
- [x] No raw Material buttons or hardcoded palette in feature layer
- [ ] Full Home.md spec parity — some sections are placeholder/mock

## Screenshots / Visual Evidence

| Screen | Path or description |
|--------|---------------------|
| Home | Run `fvm flutter run --dart-define=FLAVOR=dev` → initial screen |
| Dev link | "Design System" footer link visible in dev flavor only |

## Commands Run

```bash
fvm flutter pub get
fvm flutter test
fvm flutter analyze --no-fatal-infos
```

## Test / Analyze Results

| Command | Result |
|---------|--------|
| `flutter test` | 26 passed (includes `App boots to home screen`) |
| `flutter analyze` | Exit 1 — info-level `prefer_const` in home_screen.dart; no errors |

## Known Issues

- Mock data only — no Riverpod providers or save integration
- Bottom nav / world navigation not wired
- `prefer_const` analyzer hints in home_screen.dart (non-blocking)
- Daily challenge card is static placeholder

## Open Questions

- When to wire Home to real `PlayerProgress` provider?
- Bottom bar: shared LLBottomBar vs screen-specific layout?

## Cursor Self-Assessment

- Scope respected: Yes — shell only, no gameplay
- Docs updated: No new doc changes needed (spec pre-existed)
- Tests adequate: Yes — widget test confirms boot to Home
- Ready for external review: Yes

## Ready For

- [x] Codex Engineering Review
- [ ] Human Approval

---

## Reviewer Notes (filled by Codex / ChatGPT / Human)

### Codex Engineering Review

_Date:_  
_Verdict:_  
_Notes:_


_Date:_  
_Verdict:_  
_Notes:_

### Human Approval

_Date:_  
_Verdict:_  
_Notes:_
