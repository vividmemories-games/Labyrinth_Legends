# Cursor Workflow

## Before Any Task

1. Read documentation hierarchy (below)
2. Identify affected docs — update in same session
3. Never invent UI/mechanics not in docs

## Documentation Priority

When documents conflict, follow the repository hierarchy in `AGENTS.md` and `docs/README.md`.

For UI work, read in this order:

1. `docs/02_Design_System/LLDL/LLDL.md`
2. `docs/07_UI/README.md` and relevant `docs/07_UI/*`
3. Relevant `docs/03_Screens/*` where existing screen references apply
4. `docs/04_Technical/*`
5. `.cursor/rules/labyrinth-legends.mdc`
6. Current task prompt

## Task Types

| Type | Read first |
|------|------------|
| UI / screen | LLDL, `docs/07_UI/`, screen spec, Components |
| Gameplay | Gameplay.md, Mechanics.md, Architecture.md |
| New mechanic | Mechanics.md → update → then engine |
| Service integration | Architecture.md, Firebase.md |

## Review Packages — Weekly Batch (not per task)

Review packages are the official handoff artifact for Codex + Human approval.

**Cadence (2026-07-09):** Cursor does **not** create a review package after every major task. Human requests **one weekly batch package** covering work since the last package.

| Field | Value |
|-------|-------|
| Last batch cutoff | **0091** — `Screens/0091_gameplay_floor_tile_variation.md` |
| Next batch ID | **0092** |

When Human requests the weekly batch:

```bash
./scripts/new_review_package.sh <Category> <topic_slug> --phase "..." --update-index
```

Fill all v2 sections per `docs/99_Reviews/Review_Template.md`, run tests/analyze, mark **Ready For** when complete.

See `docs/99_Reviews/README.md` and `AGENTS.md` §4.

The stop hook (`.cursor/hooks/remind-review-package.sh`) reminds about the weekly batch only — not per-task packages.

## Definition of Done

- [ ] Code matches LLDL (no hardcoded style in features)
- [ ] Relevant docs updated
- [ ] Tests for engine changes
- [ ] `Decisions.md` entry if material choice made
- [ ] Codex checklist considered for major PRs
- [ ] Review package **only when Human requests weekly batch** (not per task)

## Prompt Library

See `Prompt_Library.md` for copy-paste task templates.

## Feature Template

See `Feature_Template.md` when starting new features.

## Prototype Code

Do **not** extend `ruins_button`, `app_colors`, or prototype screens. Build `design_system/` fresh.
