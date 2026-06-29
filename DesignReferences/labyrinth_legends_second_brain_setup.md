# Labyrinth Legends — Second Brain Setup

**Owner:** Apoorv  
**Project:** Labyrinth Legends  
**Status:** Pre-Project Setup  
**Purpose:** Create a clean second-brain system before development begins.

---

## 1. Purpose of This Second Brain

This second brain is the working knowledge system for **Labyrinth Legends**.

It should help manage:

- Game vision
- Design decisions
- Gameplay systems
- Technical rules
- Cursor/Codex workflows
- MVP scope
- Roadmap
- Rejected ideas
- Open questions
- Store/product planning
- Future expansion

The second brain should not replace the master plan.

Instead:

```text
Master Plan = What the game is
Second Brain = How the project is managed, expanded, tracked, and evolved
Cursor/Codex = Execution and review workflow
Flutter Project = Actual implementation
```

---

## 2. Recommended Tooling

Recommended setup:

```text
Obsidian
+ Markdown files
+ GitHub private repo backup
+ Cursor-readable documentation
+ Codex review notes
```

Why this setup works well:

- Markdown is simple and future-proof.
- Cursor can read `.md` files easily.
- Git gives version history.
- Obsidian gives backlinks and project navigation.
- The system can grow without becoming locked into one app.

---

## 3. Core Rule

Every important thought must become one of four things:

```text
1. Design Note
2. Decision
3. Task
4. Reference
```

Avoid keeping important project direction only inside chat conversations.

---

## 4. Relationship With the Master Plan

The master plan is the **game bible** or **constitution**.

The second brain is the **living operating system** around it.

### Master Plan Role

The master plan should contain:

- Final vision
- Core pillars
- Approved game direction
- MVP definition
- Technical philosophy
- Monetization direction
- Product direction
- Long-term vision

### Second Brain Role

The second brain should contain:

- Expanded design notes
- Open questions
- Rejected ideas
- Implementation notes
- Cursor prompts
- Codex review checklists
- Sprint tasks
- Roadmap updates
- Research and references

### Important Rule

Do not edit the master plan casually every day.

Daily thinking goes into the second brain.

Only update the master plan when a major approved direction changes.

---

## 5. Recommended Folder Structure

Create this structure:

```text
Labyrinth Legends Second Brain/
│
├── 00_Project_Home.md
├── 00_Master_Project_Specification.md
├── 00_Master_Plan_Changelog.md
│
├── 01_Vision/
│   ├── Game_Vision.md
│   ├── Core_Pillars.md
│   ├── Target_Player.md
│   ├── Non_Negotiables.md
│   └── Portfolio_Strategy.md
│
├── 02_Game_Design/
│   ├── Core_Game_Loop.md
│   ├── Mechanics.md
│   ├── Path_Drawing_System.md
│   ├── Maze_System.md
│   ├── Puzzle_Types.md
│   ├── Traps_and_Hazards.md
│   ├── Treasures_and_Collectibles.md
│   ├── Level_Progression.md
│   └── Screens.md
│
├── 03_Art_Audio/
│   ├── Art_Direction.md
│   ├── Color_Palette.md
│   ├── UI_Style.md
│   ├── Character_References.md
│   ├── Environment_References.md
│   └── Audio_Direction.md
│
├── 04_Technical/
│   ├── Tech_Stack.md
│   ├── Architecture_Rules.md
│   ├── Game_Engine.md
│   ├── Maze_Generation.md
│   ├── Save_System.md
│   ├── Analytics.md
│   ├── Performance_Notes.md
│   └── Testing_Strategy.md
│
├── 05_Product/
│   ├── MVP_Scope.md
│   ├── Monetization.md
│   ├── Economy.md
│   ├── Store_Listing.md
│   ├── Roadmap.md
│   ├── Release_Checklist.md
│   └── Success_Metrics.md
│
├── 06_Decisions/
│   ├── Decision_Log.md
│   ├── Open_Questions.md
│   ├── Ideas.md
│   └── Rejected_Ideas.md
│
├── 07_Tasks/
│   ├── Backlog.md
│   ├── Current_Sprint.md
│   ├── Bugs.md
│   └── Build_Notes.md
│
├── 08_AI_Workflows/
│   ├── Cursor_Rules.md
│   ├── Codex_Review_Checklist.md
│   ├── Master_Plan_Compliance_Checklist.md
│   ├── Prompt_Library.md
│   └── Architecture_Guardrails.md
│
└── 09_References/
    ├── Inspiration.md
    ├── Competitor_Notes.md
    ├── Screenshots.md
    ├── Research.md
    └── Store_References.md
```

---

## 6. Start With These 7 Files Only

Do not overbuild the second brain at the beginning.

Start with these files:

```text
00_Project_Home.md
00_Master_Project_Specification.md
Game_Vision.md
Core_Game_Loop.md
MVP_Scope.md
Architecture_Rules.md
Decision_Log.md
Backlog.md
```

Expand the rest only when needed.

---

# 7. File Templates

---

## 7.1 `00_Project_Home.md`

```md
# Labyrinth Legends — Project Home

## Current Status
Pre-production

## Current Focus
Define MVP gameplay loop and technical foundation.

## Project Vision
A premium mobile puzzle adventure where players draw paths through ancient labyrinths, solve environmental puzzles, collect treasures, avoid traps, and escape.

## Core Pillars
1. Draw Your Fate
2. Ancient Mysteries
3. Strategic Puzzle Solving
4. Rewarding Exploration
5. Replayable Labyrinths

## Current Questions
- What is the exact MVP gameplay loop?
- How complex should maze generation be for version 1?
- Should the game be level-based, procedural, or hybrid?
- What should the first 10 levels teach?

## Active Documents
- [[00_Master_Project_Specification]]
- [[MVP_Scope]]
- [[Core_Game_Loop]]
- [[Path_Drawing_System]]
- [[Architecture_Rules]]
- [[Decision_Log]]
- [[Backlog]]

## Next Actions
- Finalize MVP scope
- Define first playable prototype
- Create architecture rules
- Create first 10-level progression draft
```

---

## 7.2 `Decision_Log.md`

```md
# Decision Log

Use this file to record all important approved decisions.

---

## YYYY-MM-DD — Decision Title

### Decision
Describe the decision clearly.

### Reason
Why this decision was made.

### Impact
What this affects.

### Alternatives Considered
- Option 1
- Option 2

### Status
Accepted / Rejected / Revisit Later
```

Example:

```md
## 2026-06-28 — Game Logic Must Not Live Inside Widgets

### Decision
All gameplay logic must live outside Flutter widgets.

### Reason
Keeps the game testable, maintainable, and easier for Cursor/Codex to review.

### Impact
UI only renders state and sends player input to controllers/services.

### Alternatives Considered
- Keeping simple logic in widgets
- Using only stateful widgets for early prototype

### Status
Accepted
```

---

## 7.3 `Ideas.md`

```md
# Ideas

This file is for unapproved ideas only.

Important rule:
Ideas are cheap. Approved design is commitment.

---

## Idea Title

### Description
Describe the idea.

### Possible Benefit
Why it may improve the game.

### Risk
Why it may hurt scope, UX, performance, or clarity.

### Status
Idea / Needs Test / Rejected / Approved
```

Example:

```md
## Mirror Tiles

### Description
Player path reflects when passing through this tile.

### Possible Benefit
Adds puzzle depth and ancient-tech mystery.

### Risk
May complicate tutorial and path prediction.

### Status
Idea
```

---

## 7.4 `Rejected_Ideas.md`

```md
# Rejected Ideas

This file prevents old ideas from coming back again and again.

---

## Idea Title

### Rejected On
YYYY-MM-DD

### Reason
Why this idea was rejected.

### Could Be Revisited?
Yes / No / Maybe Later
```

---

## 7.5 `Open_Questions.md`

```md
# Open Questions

Use this file for unresolved decisions.

---

## Question
What needs to be decided?

### Context
Why this matters.

### Options
1. Option A
2. Option B
3. Option C

### Current Leaning
Which option seems best right now?

### Decision Needed By
Date or milestone.
```

---

## 7.6 `MVP_Scope.md`

```md
# MVP Scope

## MVP Goal
Create a playable, polished first version of Labyrinth Legends that proves the core fantasy: draw a path, solve the labyrinth, collect rewards, and escape.

## Must Have
- Path drawing
- Start tile
- Exit tile
- Walls
- Gems or treasures
- Basic keys and gates
- Simple traps
- Level completion
- Level retry
- Basic level progression
- Save progress

## Should Have
- Hints
- Undo
- Basic economy
- Simple cosmetic reward
- Level stars or score

## Could Have Later
- Procedural generation
- Daily challenge
- Special relics
- Advanced traps
- Character skins
- World map
- Cloud save

## Not MVP
- Multiplayer
- Heavy story system
- Complex inventory
- Large procedural campaign
- Live ops
- Guilds or social systems
```

---

## 7.7 `Architecture_Rules.md`

```md
# Architecture Rules

## Hard Rules
- Game logic must not live inside Flutter widgets.
- Widgets only render state and forward input.
- Maze generation must be testable without UI.
- Level data must be separate from rendering.
- Save system must be abstracted.
- No Firebase dependency inside core game logic.
- All major systems need basic tests before release.

## Main Layers

### UI Layer
Responsible for rendering screens, animations, and user input.

### Game Controller Layer
Responsible for handling player actions and coordinating state changes.

### Game State Layer
Responsible for current level state, path state, collectibles, gates, traps, and completion status.

### Domain Logic Layer
Responsible for path validation, maze rules, puzzle rules, win/loss checks, and scoring.

### Data/Storage Layer
Responsible for save data, level data, settings, analytics, and future cloud sync.

## Forbidden Patterns
- Business logic inside widgets
- Firebase calls inside game engine
- Hardcoded level rules inside UI
- Duplicated state between UI and engine
- Untested maze generation logic
```

---

## 7.8 `Master_Plan_Compliance_Checklist.md`

```md
# Master Plan Compliance Checklist

Before accepting any major feature, check the following.

## Vision
- Does this support strategic puzzle solving?
- Does this support exploration?
- Does this keep the game relaxing but rewarding?
- Does this fit the ancient labyrinth fantasy?

## Core Pillars
- Does it support Draw Your Fate?
- Does it enhance Ancient Mysteries?
- Does it contribute to meaningful progression?
- Does it improve replayability?

## MVP Discipline
- Is this required for MVP?
- If not required, should it go into Future Mechanics?
- Does this increase scope too much?

## Architecture
- Is game logic outside widgets?
- Is the mechanic testable?
- Is UI only rendering state?
- Is the system isolated from Firebase where possible?

## Monetization
- Does this avoid damaging the premium puzzle feel?
- Is rewarded ads usage optional and player-friendly?
- Does monetization avoid blocking core enjoyment?

## Player Experience
- Is the mechanic easy to understand?
- Is it difficult to master?
- Does it feel fair?
- Does it create satisfaction when solved?
```

---

## 7.9 `Cursor_Rules.md`

```md
# Cursor Rules for Labyrinth Legends

Cursor should follow these rules while generating or editing code.

## Project Context
Labyrinth Legends is a Flutter mobile puzzle adventure game where players draw paths through ancient labyrinths, solve environmental puzzles, collect treasures, and escape.

## Coding Rules
- Keep gameplay logic outside widgets.
- Use clean, testable architecture.
- Prefer small focused files.
- Avoid overengineering before MVP.
- Do not add Firebase dependencies to core game logic.
- Explain architectural changes before implementing large changes.
- Preserve existing game rules unless explicitly asked to change them.

## UI Rules
- UI should feel premium, calm, ancient, mystical, and polished.
- Avoid clutter.
- Prioritize touch-friendly mobile design.
- Animations should feel smooth and intentional.

## MVP Discipline
- Do not add non-MVP systems unless requested.
- If a feature is cool but not required, add it to future ideas instead of implementing immediately.

## Review Expectations
Before completing any major change, check:
- Does it match the master plan?
- Does it follow architecture rules?
- Is it testable?
- Does it avoid unnecessary scope increase?
```

---

## 7.10 `Codex_Review_Checklist.md`

```md
# Codex Review Checklist

Use this checklist when asking Codex to review code.

## Architecture Review
- Is game logic separated from Flutter widgets?
- Are controllers/services cleanly separated?
- Is the game engine testable without UI?
- Is level data separate from rendering?

## Code Quality Review
- Is the code readable?
- Are files too large?
- Are responsibilities clearly separated?
- Are names clear and consistent?

## Gameplay Logic Review
- Are path rules reliable?
- Are invalid paths handled correctly?
- Are keys, gates, traps, and collectibles handled predictably?
- Are edge cases covered?

## Performance Review
- Is rendering efficient?
- Are path animations lightweight?
- Is maze generation fast enough for mobile?
- Are there avoidable rebuilds?

## MVP Review
- Does the change support MVP?
- Did it introduce unnecessary scope?
- Is anything overbuilt for the current phase?

## Output Requested From Codex
Ask Codex to return:
1. Critical issues
2. Architecture concerns
3. Bugs or edge cases
4. Performance risks
5. Suggested improvements
6. Files that need refactoring
```

---

## 8. Master Plan Mapping

Use this mapping to split the master plan into the second brain.

| Master Plan Section | Second Brain Location |
|---|---|
| Project Vision | `01_Vision/Game_Vision.md` |
| Core Game Pillars | `01_Vision/Core_Pillars.md` |
| Target Player | `01_Vision/Target_Player.md` |
| Art Direction | `03_Art_Audio/Art_Direction.md` |
| Color Palette | `03_Art_Audio/Color_Palette.md` |
| Core Gameplay Loop | `02_Game_Design/Core_Game_Loop.md` |
| Core Mechanics | `02_Game_Design/Mechanics.md` |
| Game Screens | `02_Game_Design/Screens.md` |
| Progression System | `02_Game_Design/Level_Progression.md` |
| Economy | `05_Product/Economy.md` |
| Monetization | `05_Product/Monetization.md` |
| MVP Scope | `05_Product/MVP_Scope.md` |
| Tech Stack | `04_Technical/Tech_Stack.md` |
| Architecture Rules | `04_Technical/Architecture_Rules.md` |
| Cursor Role | `08_AI_Workflows/Cursor_Rules.md` |
| Codex Role | `08_AI_Workflows/Codex_Review_Checklist.md` |
| Development Phases | `05_Product/Roadmap.md` |
| Success Metrics | `05_Product/Success_Metrics.md` |
| Long-Term Vision | `01_Vision/Portfolio_Strategy.md` |

---

## 9. Weekly Review Template

Create a weekly note or add this section to `00_Project_Home.md`.

```md
# Weekly Review

## Week Of
YYYY-MM-DD

## What Changed This Week?
-

## What Decisions Were Made?
-

## What Ideas Were Rejected?
-

## What Is the Current Build Target?
-

## What Is Blocking Progress?
-

## What Should Be Done Next?
-
```

---

## 10. Setup Order

Follow this order before starting development.

```text
1. Create Obsidian vault or docs folder
2. Add 00_Project_Home.md
3. Add 00_Master_Project_Specification.md
4. Add Decision_Log.md
5. Add MVP_Scope.md
6. Add Architecture_Rules.md
7. Add Cursor_Rules.md
8. Add Codex_Review_Checklist.md
9. Add Backlog.md
10. Start breaking the master plan into focused files
```

---

## 11. Suggested Git Structure

Recommended project repo structure:

```text
labyrinth-legends/
│
├── app/
│   └── Flutter project later
│
├── docs/
│   └── second-brain/
│
├── prompts/
│   └── cursor/
│
├── reviews/
│   └── codex/
│
└── README.md
```

Recommended location for this second brain:

```text
labyrinth-legends/docs/second-brain/
```

---

## 12. Final Operating Principle

Use the second brain like this:

```text
Master Plan
    ↓
Expanded design notes
    ↓
Decisions and rejected ideas
    ↓
Cursor implementation tasks
    ↓
Codex review checklist
    ↓
Updated roadmap
```

The master plan gives the direction.

The second brain keeps the project alive.

Cursor builds from approved notes.

Codex checks against architecture and quality rules.

---

## 13. Immediate Next Action

Before writing any code, create these files:

```text
00_Project_Home.md
00_Master_Project_Specification.md
05_Product/MVP_Scope.md
04_Technical/Architecture_Rules.md
06_Decisions/Decision_Log.md
06_Decisions/Ideas.md
07_Tasks/Backlog.md
08_AI_Workflows/Cursor_Rules.md
08_AI_Workflows/Codex_Review_Checklist.md
08_AI_Workflows/Master_Plan_Compliance_Checklist.md
```

Then paste the existing Labyrinth Legends master plan into:

```text
00_Master_Project_Specification.md
```

After that, start breaking the master plan into smaller linked notes.

