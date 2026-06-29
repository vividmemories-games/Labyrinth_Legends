# Phase 1 Review

Reviewed against:

- `docs/second-brain/00_Master_Project_Specification.md`
- `docs/second-brain/06_Decisions/Decision_Log.md`
- `docs/second-brain/08_AI_Workflows/Codex_Review_Checklist.md`
- `DesignReferences/Labyrinth_vs_Labyrinth_Legends_Comparison.md`

**Status:** Addressed in post-review pass (2026-06-28).

## Findings & Resolution

### P1 — Asset folder casing will break on case-sensitive systems ✅ Fixed

**Was:** `Assets/levels/...` on disk vs `assets/levels/...` in `pubspec.yaml`.

**Fix:** Runtime bundles live under lowercase `assets/` (`levels/`, `images/`). Design references moved to `DesignReferences/`.

### P1 — Replay completion inflates total stars ✅ Fixed

**Was:** `totalStars` incremented on every completion.

**Fix:** `LocalProgressRepository` adds only the delta above previous `bestStars`. Test: `replay does not inflate total stars`.

### P1 — Board tap mapping ignores painter transforms ✅ Fixed

**Was:** `localToGrid` used axis-aligned math while painter applies scale/skew.

**Fix:** Nearest-cell hit test using the same forward transform as `_MazePainter`.

### P1 — Hints are consumed before confirming a hint exists ✅ Fixed

**Was:** `useHint()` charged currency before validating solver output.

**Fix:** `GameplayController.useHint` resolves the next step first, then charges.

### P2 — Mutable session state makes Riverpod updates brittle ⏳ Deferred

**Note:** Still mutates `GameplaySession` in place. Acceptable for Phase 1; refactor to immutable snapshots in Phase 2 if selectors/tests need it.

### P2 — Daily Challenge claims procedural generation but launches static levels ✅ Fixed

**Was:** UI showed generator status but opened handcrafted world levels.

**Fix:** `buildDailyLevel(seed)` + route to `/play/daily_YYYYMMDD`. Same seed for all players per calendar day.

### P2 — Basic traps are in MVP docs but not implemented ✅ Deferred (documented)

**Decision:** Traps moved to Phase 2. `Decision_Log.md` and `MVP_Scope.md` updated. Environmental puzzles (keys, fog, relics) cover Phase 1 tutorial scope.

### P3 — Analyzer currently fails on lint infos ✅ Fixed

**Fix:** Const/final cleanups; `flutter analyze --no-fatal-infos` passes with no warnings.

## UI Visual Pass (post-review)

Aligned with `DesignReferences/image.png` / `assets/images/ui_mockup.png`:

- **Gold** primary buttons and titles; **cyan** reserved for paths/energy/secondary actions
- Cinzel + Exo 2 via `google_fonts`
- Home hero uses mockup atmosphere image with dark overlay
- Level path uses cyan dotted connectors and gold node rings

## Verification

- `fvm flutter test` — all tests pass
- `fvm flutter analyze --no-fatal-infos` — no warnings
- `pod install` — clean (Profile.xcconfig wired)

## Recommended Phase 2 Topics

1. Trap mechanics (spike, pit, arrow) + level integration
2. Immutable `GameplaySession` snapshots
3. iOS dev/prod schemes matching Android flavors
4. Custom art slices (not full mockup sheet) per screen
5. Sound/haptics hooks
6. Firebase / ads / IAP SDK swap from mocks
