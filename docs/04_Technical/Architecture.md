# Architecture

## Principles

1. **Documentation first** — LLDS before code
2. **Game logic never in widgets**
3. **Testable engine** — pure Dart in `game_engine/`
4. **Interface-first services** — mock then swap SDKs
5. **Unidirectional data** — UI ← providers ← repositories ← engine

## Layers

```
┌─────────────────────────────────────┐
│  features/ (UI screens, widgets)    │
├─────────────────────────────────────┤
│  design_system/ (LL components)     │
├─────────────────────────────────────┤
│  data/ (repos, models, providers)   │
├─────────────────────────────────────┤
│  game_engine/ (rules, session)      │
├─────────────────────────────────────┤
│  core/ (services interfaces, env)    │
└─────────────────────────────────────┘
```

## Key Flows

### Gameplay

```
User tap → GameplayController → GameplaySession.tryAddToPath
Go → PathValidator → PathExecutor (step animation) → RewardCalculator
Win → ProgressRepository.recordCompletion
```

### Level Load

```
LevelRepository.loadWorld → JSON → LevelDefinition → GameplaySession
```

## State Management

Riverpod — see `State_Management.md`

## Persistence

`SharedPreferences` via `Save_System.md` — Firebase cloud later.

## Not in Foundation Phase

- Firebase SDK
- Real ads/IAP
- Production analytics

## Testing

- `game_engine/` — unit tests required
- `design_system/` — widget/golden tests
- `features/` — integration smoke tests

See `Folder_Structure.md`, `Coding_Standards.md`
