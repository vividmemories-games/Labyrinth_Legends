# Cursor Workflow

## Before Any Task

1. Read documentation hierarchy (below)
2. Identify affected docs — update in same session
3. Never invent UI/mechanics not in docs

## Documentation Priority

When documents conflict, **higher wins:**

1. `docs/02_Design_System/LLDL.md`
2. `docs/02_Design_System/Design_Tokens.md`
3. `docs/03_Screens/*`
4. `docs/01_Game_Design/*`
5. `docs/04_Technical/*`
6. `.cursor/rules/labyrinth-legends.mdc`
7. Current task prompt

## Task Types

| Type | Read first |
|------|------------|
| UI / screen | LLDL, screen spec, Components |
| Gameplay | Gameplay.md, Mechanics.md, Architecture.md |
| New mechanic | Mechanics.md → update → then engine |
| Service integration | Architecture.md, Firebase.md |

## End of Every Major Task — Review Package

**Every major task requires a review package.** Review packages are the **official handoff artifact** for Codex, ChatGPT, and Human approval. Cursor must **not** mark a major task complete until the review package exists.

All review packages must use the **v2 template** (`docs/99_Reviews/Review_Template.md`), including motivation, risk assessment, dependencies, product impact, future technical debt, recommended next task, and standardized reviewer notes.

1. Scaffold with the generator script:

```bash
./scripts/new_review_package.sh <Category> <topic_slug> --phase "..." --update-index
```

2. Fill all v2 sections honestly — what changed, why, risks, dependencies, product impact, future debt, recommended next task, plus files changed, docs updated, commands, test/analyze output, LLDL compliance, scope boundaries
3. Add screenshots if UI changed
4. Mark **Ready For** when complete

**Do not proceed to the next phase until review is approved** (Codex + ChatGPT + Human, or Human waiver).

See `docs/99_Reviews/README.md` for naming and folder rules.

A **stop hook** (`.cursor/hooks/remind-review-package.sh`) nudges the agent at session end when code changed but no review package was updated — see `docs/99_Reviews/README.md`.

## Definition of Done

- [ ] Code matches LLDL (no hardcoded style in features)
- [ ] Relevant docs updated
- [ ] Tests for engine changes
- [ ] `Decisions.md` entry if material choice made
- [ ] Codex checklist considered for major PRs
- [ ] **Review package created** in `docs/99_Reviews/`

## Prompt Library

See `Prompt_Library.md` for copy-paste task templates.

## Feature Template

See `Feature_Template.md` when starting new features.

## Prototype Code

Do **not** extend `ruins_button`, `app_colors`, or prototype screens. Build `design_system/` fresh.
