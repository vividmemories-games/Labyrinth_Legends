# Labyrinth Legends — Project Home

**Status:** MVP in development  
**Platform:** Flutter (iOS + Android)  
**Genre:** Premium puzzle adventure

## What is this?

Labyrinth Legends is a mobile puzzle game where players **draw a path**, **review it**, **confirm**, and **watch the character execute** through ancient labyrinth ruins.

## Core pillars

1. **Draw Your Fate** — planning-based path drawing, not joystick control
2. **Ancient Mysteries** — ruins, temples, mystical technology atmosphere
3. **Strategic Puzzle Solving** — keys, gates, traps, treasure order matters
4. **Rewarding Exploration** — gems, hidden paths, optional collectibles
5. **Replayability** — stars, daily challenge, future procedural levels

## Quick links

| Doc | Purpose |
|-----|---------|
| [Master Specification](00_Master_Project_Specification.md) | Game bible |
| [MVP Scope](05_Product/MVP_Scope.md) | What ships first |
| [Architecture Rules](04_Technical/Architecture_Rules.md) | Code structure |
| [Decision Log](06_Decisions/Decision_Log.md) | Approved decisions |
| [Backlog](07_Tasks/Backlog.md) | Future work |

## Current sprint focus

- Flutter UI shell with navigation and theme
- Maze board rendering with path drawing
- Mock services for ads, purchases, analytics
- Level progression and save (SharedPreferences)

## Run commands

```bash
flutter run --flavor dev --dart-define=FLAVOR=dev
```
