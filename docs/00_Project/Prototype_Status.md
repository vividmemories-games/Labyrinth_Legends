# Prototype Status

**Date:** 2026-06-28  
**Context:** Intentional restart. LLDS is now authoritative; existing code is **reference only** until a formal rebuild task.

## Preserve (do not delete yet)

| Path | Reason |
|------|--------|
| `android/`, `ios/` | Flutter platform scaffold, flavors, CocoaPods |
| `.fvmrc`, `pubspec.yaml` | Tooling pins and dependency baseline |
| `assets/levels/world_1/*.json` | Level data format reference — validate against new spec before reuse |
| `DesignReferences/` | Original design inputs |
| `docs/second-brain/` | Archive — migrate useful content into LLDS, then deprecate |
| `AGENTS.md` | Update to point at LLDS (pending) |
| `reviews/codex/phase1-review.md` | Historical review findings |

## Marked for replacement (do not extend)

| Path | Issue |
|------|-------|
| `lib/app/theme.dart` | Hardcoded colors; not LLDL tokens |
| `lib/core/constants/app_colors.dart` | **Deprecated** — feature code migrated to `LLColor`; thin legacy file remains |
| `lib/core/widgets/ruins_button.dart` | **Deprecated** — delegates to `LLButton` |
| `lib/core/widgets/currency_pill.dart` | **Deprecated** — delegates to `LLCurrencyChip` |
| `lib/features/**` | Prototype screens migrated to `design_system/` (2026-06-30 Tier 3) — Settings included |
| `lib/game_engine/**` | Logic direction OK; re-implement against updated `Mechanics.md` and tests |
| `lib/data/**` | Rebuild after save-system spec locked |
| `test/**` | Rewrite after engine reset |

## Do not build on prototype UI

Future tasks must:

1. Read `docs/02_Design_System/LLDL.md` and `Design_Tokens.md`
2. Implement `lib/design_system/` first
3. Build screens from documented components only

## Recommended cleanup task (future)

After M1 design system lands:

1. Remove `lib/core/widgets/ruins_*` and prototype theme
2. Archive or delete `docs/second-brain/` once migration verified
3. Squash git history optional — user decision
