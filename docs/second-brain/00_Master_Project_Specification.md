# Master Project Specification (Brief)

## Vision

A premium mobile puzzle adventure set in ancient ruins. Players plan routes through labyrinths by drawing paths, then watch their explorer execute them.

## Core loop

1. Select level
2. Study the maze (partial fog of war)
3. Draw a valid path from start to exit
4. Confirm and execute
5. Collect gems, keys; avoid traps; unlock gates
6. Earn stars and progress

## MVP mechanics

- Grid maze with walls, start, exit
- Path drawing with undo/erase/hint
- Character path execution animation
- Gems and keys
- Basic traps
- Star rating (complete, all gems, par moves)
- World/level select
- Save progress locally
- Shop (mock IAP/ads)
- Daily challenge (rotating level)
- Settings (audio/haptics toggles)

## Visual direction

- Dark ancient-tech palette: cyan glow, gold accents, void black backgrounds
- Faux-isometric maze board
- Calm, premium, Monument Valley–inspired mood

## Monetization (MVP hooks only)

- Rewarded ads (mock)
- Gem/hint packs (mock)
- Remove ads / premium unlock (mock)

## Technical stack

- Flutter + Riverpod + go_router
- SharedPreferences for local save
- Domain logic separated from widgets
- dev/prod flavors via `--dart-define=FLAVOR`

## Non-goals for MVP

- Multiplayer, leaderboards, live ops
- Real Firebase/ad SDK integration
- Procedural generation
- Complex backend
