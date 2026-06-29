# Save System

## MVP: Local

**SharedPreferences** via `LocalProgressStore` + `ProgressRepository`

## Persisted Data

| Key space | Content |
|-----------|---------|
| Player | coins, gems, hints, totalStars, settings toggles, completedLevelIds, relicIds |
| Per-level | bestStars, attempts, bestGems, completed flag |

## Rules

- Star totals increment only on new personal best per level
- Repositories are the only write path — not widgets

## Future: Cloud

`CloudSaveService` interface — merge strategy TBD in `Firebase.md`
