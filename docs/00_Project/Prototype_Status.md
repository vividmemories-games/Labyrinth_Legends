# Prototype Status

**Date:** 2026-07-09  
**Context:** Production rebuild is **in progress**. LLDS is authoritative. Legacy prototype patterns must not be extended.

## Current production state (M2)

| Area | Status |
|------|--------|
| `lib/design_system/` | Active — LLDL tokens and components |
| `lib/game_engine/` | Active — M1 complete; schema v2 |
| `lib/features/gameplay/` | Active — draw/commit/execute loop; `MazePainter` board |
| `lib/data/` | Active — progress repositories (win→save wiring pending) |
| `lib/features/home/`, `level_select/` | Active — M2.8 visual passes |
| `lib/features/maze_render_poc/` | **Legacy** — POC promoted to gameplay; route may remain for dev only |
| `lib/core/widgets/ruins_*` | **Deprecated** — do not extend |

## Preserve (do not delete yet)

| Path | Reason |
|------|--------|
| `android/`, `ios/` | Flutter platform scaffold, flavors, CocoaPods |
| `.fvmrc`, `pubspec.yaml` | Tooling pins and dependency baseline |
| `assets/levels/world_1/*.json` | Level data — validate against schema v2 before reuse |
| `DesignReferences/` | Original design inputs |
| `docs/second-brain/` | Archive — migrate useful content into LLDS, then deprecate |
| `AGENTS.md` | Agent governance |
| `reviews/codex/phase1-review.md` | Historical review findings |

## Marked for replacement (do not extend)

| Path | Issue |
|------|-------|
| `lib/app/theme.dart` | Hardcoded colors; not LLDL tokens |
| `lib/core/constants/app_colors.dart` | **Deprecated** — thin legacy file remains |
| `lib/core/widgets/ruins_button.dart` | **Deprecated** — delegates to `LLButton` |
| `lib/core/widgets/currency_pill.dart` | **Deprecated** — delegates to `LLCurrencyChip` |
| `lib/features/maze_render_poc/**` | POC superseded by `features/gameplay/presentation/rendering/` |

## Do not build on prototype UI

Future tasks must:

1. Read `docs/02_Design_System/LLDL/LLDL.md` and `Design_Tokens.md`
2. Implement `lib/design_system/` first
3. Build screens from documented components only

## Recommended cleanup task (future)

After vertical slice:

1. Remove `lib/core/widgets/ruins_*` and prototype theme
2. Remove or gate `maze_render_poc` dev route if unused
3. Archive or delete `docs/second-brain/` once migration verified
