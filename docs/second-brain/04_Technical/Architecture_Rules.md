# Architecture Rules

## Layer separation

```text
UI (presentation/widgets)
  ↓
Controllers / Riverpod providers
  ↓
Domain (models, rules) — parallel game_engine work
  ↓
Data (repositories, local storage)
```

## Hard rules

- No core gameplay rules inside widgets
- Widgets render state and forward input
- Path validation must be testable without UI
- Save/load abstracted behind providers
- No Firebase in domain logic
- Avoid global mutable state

## Current lib structure

```text
lib/
  app/              theme, router, root app widget
  core/
    constants/      colors, tuning values
    env/            flavor detection
    services/       ads, purchases, analytics, remote config
    widgets/        RuinsButton, CurrencyPill
  features/
    home/
    worlds/
    level_select/
    gameplay/       screen, maze board, providers, temp domain
    level_complete/
    shop/
    settings/
    daily_challenge/
  main.dart
```

## State management

- `progressProvider` — player gems, hints, level stars, settings
- `levelRepositoryProvider` — worlds and levels (temporary inline data)
- `gameplayControllerProvider` — per-level drawing/execution state

## Routing

go_router paths:

- `/` home
- `/worlds`
- `/worlds/:worldId/levels`
- `/play/:levelId`
- `/complete/:levelId`
- `/shop`, `/settings`, `/daily`

## Testing priority

1. Path validation
2. Win/loss conditions
3. Progress save/load
4. Star calculation

## Migration path

When game_engine lands:

1. Move models from `features/gameplay/domain/` to shared domain package
2. Replace `LevelRepository` with asset-backed data layer
3. Delegate `GameplayController` rules to domain services
