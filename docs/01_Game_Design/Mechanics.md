# Mechanics

## Grid Cell Types

| Cell | Walkable | Notes |
|------|----------|-------|
| Floor | Yes | Default traversable |
| Wall | No | Blocks path |
| Start | Yes | Path origin |
| Exit / Portal | Yes | Win when reached |
| Gem | Yes (floor + gem) | Collect on traverse |
| Key | Yes | Adds key ID to inventory |
| Lock | Yes if key held | Gate with lock ID |
| Relic | Yes | Meta collectible; may gate hidden cells |
| Trap | Yes | **Phase 2+** — fail or damage on step |
| Hidden | Conditional | Fog / relic reveal rules |

## Discovery Modes

| Mode | Behavior |
|------|----------|
| Full | Entire grid visible |
| Fog | Cells reveal within radius of path |
| Relic-gated | Some cells hidden until relic collected |

## Path Validation (engine)

All validation lives in `game_engine/` — never in widgets.

## Traps (planned)

Documented for completeness; **not in foundation rebuild scope.**

| Trap | Effect |
|------|--------|
| Spike | Fail run if stepped |
| Pit | Fail run |
| Arrow | Directional hazard |

## Interactions

- One key ID opens one lock ID
- Gems optional or required per level objectives
- Exit may require minimum gems

See `docs/04_Technical/Maze_Generator.md` for procedural rules.
