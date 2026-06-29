# Codex Review Checklist

Use for milestone PRs and before declaring a phase complete.

## Review Package (read first)

- [ ] **Read the relevant review package** in `docs/99_Reviews/{Category}/` before reviewing code
- [ ] **Verify claims** in the review package against the actual codebase (files created/modified, test results, scope boundaries)
- [ ] Confirm review package exists for the milestone — do not approve phase completion without it
- [ ] Fill the **Codex Engineering Review** section in the review package when done

Codex focuses on engineering quality. Do not judge product feel unless explicitly asked.

## Documentation

- [ ] Changes align with LLDL and Design_Tokens
- [ ] Screen specs updated if UI changed
- [ ] Decisions.md entry for material choices
- [ ] No undocumented new mechanics

## Architecture

- [ ] Game logic in `game_engine/` only
- [ ] No hardcoded colors/spacing in `lib/features/`
- [ ] Uses `LL*` components from design_system
- [ ] Services accessed via interfaces
- [ ] Riverpod providers in data layer

## Gameplay

- [ ] Draw → Go → execute flow intact
- [ ] Path validation edge cases tested
- [ ] Progress persistence correct (no star inflation on replay)
- [ ] Hint only charges when hint available

## UI Quality

- [ ] Gold primary CTAs — not cyan
- [ ] No default Material widgets without LLDL wrapper
- [ ] Matches relevant `docs/03_Screens/*.md`
- [ ] Accessible touch targets (min 44pt)

## Quality Gates

- [ ] `flutter test` passes
- [ ] `flutter analyze` no warnings
- [ ] Asset paths lowercase `assets/`

## Out of Scope Check

- [ ] No unrequested Firebase/ads SDK
- [ ] No scope creep from task prompt

See also: `Architecture_Checklist.md`, `Performance_Checklist.md`
