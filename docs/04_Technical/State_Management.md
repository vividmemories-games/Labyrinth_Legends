# State Management

## Stack

**Riverpod** — `flutter_riverpod`

## Provider Location

Central providers in `lib/data/providers.dart` unless feature-scoped UI state is trivial.

## Patterns

| Concern | Provider type |
|---------|---------------|
| Player progress | `AsyncNotifier` + repository |
| Level list | `FutureProvider.family` |
| Gameplay session | `StateNotifierProvider.autoDispose.family` |
| Services | `Provider` interfaces |

## Rules

- Gameplay rules in `game_engine/` — providers orchestrate, don't validate paths in widgets
- Invalidate progress providers after completion
- Prefer immutable state objects for gameplay UI

## Prototype Note

`GameplayController` mutates session in place — refactor to immutable snapshots in engine rebuild.
