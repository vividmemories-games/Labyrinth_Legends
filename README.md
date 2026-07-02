# Labyrinth Legends

Premium mobile puzzle adventure — **Draw Your Fate** through ancient mystical ruins.

## Status: Foundation Restart

Implementation is paused while **LLDS** (Labyrinth Legends Documentation System) is established as the source of truth. Existing prototype code is reference-only — see `docs/00_Project/Prototype_Status.md`.

## Documentation First

All design, screens, and architecture are governed by:

```text
docs/README.md          ← start here
docs/02_Design_System/LLDL/LLDL.md
docs/02_Design_System/Design_Tokens.md
```

### Documentation Priority

When documents conflict, **higher wins:**

1. `docs/02_Design_System/LLDL/LLDL.md`
2. `docs/02_Design_System/Design_Tokens.md`
3. `docs/03_Screens/*`
4. `docs/01_Game_Design/*`
5. `docs/04_Technical/*`
6. `.cursor/rules/labyrinth-legends.mdc`
7. Current task prompt

## LLDS Structure

```text
docs/
├── 00_Project/        Vision, roadmap, milestones, decisions
├── 01_Game_Design/    Game bible, mechanics, economy
├── 02_Design_System/  LLDL, tokens, components
├── 03_Screens/        Per-screen specifications
├── 04_Technical/      Architecture, save, Firebase prep
├── 05_AI/             Cursor + Codex workflows
└── assets/            Mockups and design references
```

## Tooling (preserved from prototype)

```bash
fvm flutter pub get
fvm flutter run --dart-define=FLAVOR=dev   # iOS: no --flavor
```

Flutter 3.44.2 via `.fvmrc` · Riverpod · go_router

## Next Task

Implement `lib/design_system/` tokens and `LLButton` / `LLPanel` per `docs/02_Design_System/Components.md` — then rebuild Home screen from `docs/03_Screens/Home.md`.

Do **not** continue prototype UI patterns.
