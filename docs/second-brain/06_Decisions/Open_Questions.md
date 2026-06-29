# Open Questions

## Wire UI to game_engine layer

### Question
Should gameplay_provider delegate to GameplaySession in game_engine/, removing features/gameplay/domain duplicates?

### Context
Phase 1 shipped with parallel UI domain models and canonical game_engine. Tests cover game_engine; UI uses its own LevelRepository.

### Options
1. Migrate UI to game_engine in Phase 2
2. Keep adapter layer between UI and engine

### Recommendation
Option 1 — single source of truth before adding mechanics.

### Status
Open — decide in Phase 2

---

## Basic Traps MVP Scope

### Question
Are basic traps required for the MVP foundation, or should they be deferred to post-MVP?

### Context
The master specification lists basic traps as an MVP mechanic, but the Phase 1 code has no trap cell type, trap mechanic, trap rendering, or trap levels. This needs a scope decision before adding more level content.

### Options
- Add a simple MVP trap mechanic now
- Defer traps and update MVP scope
- Keep trap hooks only, without playable trap content

### Recommendation
Add one simple trap type if traps remain in MVP; otherwise explicitly defer them to protect scope.

### Status
Open
