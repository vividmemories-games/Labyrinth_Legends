# AGENTS.md — Labyrinth Legends

This repository contains **Labyrinth Legends**, a premium Flutter mobile puzzle adventure game for iOS and Android.

All AI agents, coding assistants, and automated contributors must follow this file.

---

# 1. Prime Directive

The project second brain must stay up to date at all times.

Do not treat documentation as optional.

If a change affects gameplay, architecture, scope, product direction, monetization, UX, art direction, roadmap, or technical decisions, update the relevant second-brain document in the same work session.

---

# 2. Required Reading Before Work

Before starting any meaningful task, check the relevant files under:

```text
docs/second-brain/
```

At minimum, review:

```text
docs/second-brain/00_Project_Home.md
docs/second-brain/00_Master_Project_Specification.md
docs/second-brain/06_Decisions/Decision_Log.md
```

For gameplay work, also check:

```text
docs/second-brain/02_Game_Design/
```

For architecture or code structure work, also check:

```text
docs/second-brain/04_Technical/
```

For monetization, roadmap, economy, or release work, also check:

```text
docs/second-brain/05_Product/
```

For AI workflow changes, also check:

```text
docs/second-brain/08_AI_Workflows/
```

---

# 3. Source of Truth Hierarchy

Follow this order when documents conflict:

1. Master Project Specification
2. Decision Log
3. Current Sprint
4. Feature-specific second-brain notes
5. Backlog
6. Open Questions
7. Ideas or references

The master plan defines the game direction.

The decision log records approved changes.

The second brain explains the current working understanding.

---

# 4. Second-Brain Folder Map

Use this structure:

```text
docs/second-brain/
  00_Project_Home.md
  00_Master_Project_Specification.md
  00_Master_Plan_Changelog.md

  01_Vision/
    Game_Vision.md
    Core_Pillars.md
    Portfolio_Strategy.md

  02_Game_Design/
    Core_Game_Loop.md
    Mechanics.md
    Path_Drawing_System.md
    Maze_System.md
    Level_Progression.md
    Screens.md

  03_Art_Audio/
    Art_Direction.md
    Color_Palette.md
    UI_Style.md
    Audio_Direction.md

  04_Technical/
    Tech_Stack.md
    Architecture_Rules.md
    Game_Engine.md
    Save_System.md
    Testing_Strategy.md

  05_Product/
    MVP_Scope.md
    Monetization.md
    Economy.md
    Roadmap.md
    Success_Metrics.md

  06_Decisions/
    Decision_Log.md
    Open_Questions.md
    Rejected_Ideas.md

  07_Tasks/
    Backlog.md
    Current_Sprint.md
    Bugs.md

  08_AI_Workflows/
    Cursor_Rules.md
    Codex_Review_Checklist.md
    Master_Plan_Compliance_Checklist.md
    Prompt_Library.md
```

If a file does not exist yet and the task requires it, create it.

---

# 5. What Must Be Documented

Always update the second brain when changing or adding:

## Game Design

- Core gameplay loop
- Path drawing
- Maze rules
- Tile types
- Traps
- Keys
- Gates
- Treasures
- Collectibles
- Power-ups
- Level progression
- Win/loss rules
- Difficulty curve

## Technical Design

- Architecture
- State management
- Game engine logic
- Save system
- Analytics
- Firebase/backend usage
- Testing strategy
- Dependencies
- Performance decisions

## Product Direction

- MVP scope
- Monetization
- Economy
- Store strategy
- Release plan
- Roadmap
- Success metrics

## UX / Art / Audio

- Screen changes
- UI direction
- Visual style
- Animation style
- Sound direction
- Accessibility considerations

## Decision Records

- Approved decisions
- Rejected ideas
- Open questions
- Tradeoffs
- Scope changes

---

# 6. Decision Log Rule

Every important decision must be recorded in:

```text
docs/second-brain/06_Decisions/Decision_Log.md
```

Use this format:

```md
## YYYY-MM-DD — Decision Title

### Decision
Describe the decision clearly.

### Reason
Explain why this decision was made.

### Impact
Explain what this affects.

### Alternatives Considered
List alternatives if applicable.

### Status
Accepted
```

Do not silently make product or architecture decisions without logging them.

---

# 7. Open Questions Rule

If something is unclear and not resolved during the task, record it in:

```text
docs/second-brain/06_Decisions/Open_Questions.md
```

Use this format:

```md
## Question Title

### Question
What is unresolved?

### Context
Why does this matter?

### Options
- Option A
- Option B
- Option C

### Recommendation
Suggested direction, if any.

### Status
Open
```

---

# 8. Rejected Ideas Rule

Do not delete good ideas just because they are not being built.

Move rejected or postponed ideas to:

```text
docs/second-brain/06_Decisions/Rejected_Ideas.md
```

Use this format:

```md
## Idea Title

### Idea
Describe the idea.

### Why It Was Rejected or Deferred
Explain the reason.

### Could Return Later?
Yes / No / Maybe

### Status
Rejected / Deferred
```

---

# 9. Current Sprint Rule

When starting or finishing implementation work, update:

```text
docs/second-brain/07_Tasks/Current_Sprint.md
```

Track:

- Current focus
- Active tasks
- Completed tasks
- Blockers
- Next actions

Use this format:

```md
# Current Sprint

## Current Focus
-

## Active Tasks
- [ ] Task

## Completed
- [x] Task

## Blockers
-

## Next Actions
-
```

---

# 10. Backlog Rule

If a task is discovered but not completed, add it to:

```text
docs/second-brain/07_Tasks/Backlog.md
```

Use simple categories:

```md
# Backlog

## MVP
- [ ] Task

## Post-MVP
- [ ] Task

## Polish
- [ ] Task

## Technical Debt
- [ ] Task

## Ideas
- [ ] Task
```

---

# 11. Master Plan Update Rule

Do not casually edit:

```text
docs/second-brain/00_Master_Project_Specification.md
```

The master plan should change only when a major approved direction changes.

When the master plan changes, also update:

```text
docs/second-brain/00_Master_Plan_Changelog.md
```

Use this format:

```md
## YYYY-MM-DD — Version X.Y

### Changed
-

### Added
-

### Removed
-

### Reason
-
```

---

# 12. Architecture Rules

All agents must follow these architecture rules:

- Flutter widgets must not contain core gameplay logic.
- UI should render state and forward input.
- Game rules must live in pure Dart domain classes.
- Path validation must be testable without UI.
- Maze generation must be testable without UI.
- Save/load logic must be abstracted from the game engine.
- Backend/Firebase must not be directly coupled to core gameplay.
- Avoid global mutable state.
- Avoid large files.
- Avoid magic numbers.
- Prefer small, focused classes.
- Prefer clear names over clever code.
- Add tests for core game rules.

---

# 13. MVP Protection Rule

Protect the MVP from scope creep.

Before adding a feature, classify it as:

```text
MVP
Post-MVP
Idea
Rejected
Needs Decision
```

If it is not MVP, do not implement it unless explicitly approved.

Document non-MVP ideas in the second brain.

---

# 14. Documentation Commit Requirement

Any pull request or major AI-generated change should include one of the following:

1. Relevant second-brain documentation updates

or

2. A short explanation saying:

```text
No second-brain update needed because this change is purely internal/refactor-only and does not affect design, architecture, product direction, roadmap, or decisions.
```

---

# 15. Required End-of-Task Summary

At the end of every meaningful task, the agent must report:

```text
Code changed:
-

Docs updated:
-

Decisions added:
-

Open questions added:
-

Backlog items added:
-

Tests added/updated:
-

Second brain status:
Updated / No update needed
```

---

# 16. Definition of Done

A task is complete only when:

- The code builds or the issue is clearly documented.
- The change follows the master plan.
- The change respects MVP scope.
- Core game logic remains outside widgets.
- Relevant tests are added or updated where practical.
- The second brain is updated if needed.
- Important decisions are logged.
- Open questions are recorded.
- No unrelated scope is introduced.

If the second brain is stale, the task is not done.
