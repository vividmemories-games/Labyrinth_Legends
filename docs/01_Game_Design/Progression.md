# Progression

## Level Unlock

Linear within world: complete level N to unlock N+1.

## World Unlock

Complete threshold of prior world stars (TBD per world in `Worlds.md`).

## Player Profile

| Field | Purpose |
|-------|---------|
| `completedLevelIds` | Unlock chain |
| `totalStars` | Sum of best stars per level (delta on improvement only) |
| `coins` | Soft currency |
| `gems` | Hard currency |
| `hintsRemaining` | Free hints |
| `collectedRelicIds` | Meta collection |

## Stars

Per-level best stars stored. Global total increments only on improvement.

## Relics

Persistent across sessions. May unlock lore entries (future) and hidden passages.

## Daily Challenge

Separate seeded procedural level per calendar day. Does not block main progression.
