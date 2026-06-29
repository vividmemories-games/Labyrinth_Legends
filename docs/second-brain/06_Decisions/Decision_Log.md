# Decision Log

## 2025-06-28 — Flutter + Riverpod + go_router stack

### Decision
Use Flutter with Riverpod for state management and go_router for navigation.

### Reason
Aligns with portfolio (Dot Clash), supports testable providers, declarative routing.

### Impact
All screens use ConsumerWidget; navigation via `context.push/go`.

### Status
Accepted

---

## 2025-06-28 — dev/prod flavors with dart-define

### Decision
Android product flavors (`dev`, `prod`) with `applicationIdSuffix .dev` for dev. Dart layer reads `FLAVOR` from `--dart-define`.

### Reason
Matches Dot Clash workflow; enables side-by-side dev installs.

### Impact
Run: `flutter run --flavor dev --dart-define=FLAVOR=dev`

### Status
Accepted

---

## 2025-06-28 — Mock services for MVP

### Decision
Ads, purchases, analytics, and remote config use abstract interfaces with mock implementations.

### Reason
Game feel and UI flow can ship before SDK integration.

### Impact
`lib/core/services/` — swap mocks for real impl later.

### Status
Accepted

---

## 2026-06-28 — Draw Your Fate (draw-then-go)

### Decision
Player draws full path on grid; character executes only after Go. No direct movement controls.

### Reason
Core USP; differentiates from action maze games.

### Status
Accepted

---

## 2026-06-28 — Mirror Dot Clash scaffold

### Decision
FVM 3.44.2, Riverpod, go_router, dev/prod Android flavors, AGENTS.md workflow.

### Status
Accepted

---

## 2025-06-28 — UI-first with inline level repository

### Decision
Ship UI with embedded ASCII level data in `LevelRepository` until JSON assets and domain engine land.

### Reason
Parallel development of UI and game engine layers.

### Impact
Replace repository when `assets/levels/` and domain package are ready.

### Status
Superseded (2026-06-28) — JSON assets + `game_engine/` integrated.

---

## 2026-06-28 — Handcrafted JSON levels 1–20

### Decision
Levels 1–20 in `assets/levels/world_1/`; procedural generation for Daily Challenge only.

### Status
Accepted

---

## 2026-06-28 — Hybrid faux-isometric rendering

### Decision
Grid logic stays 2D; `CustomPainter` renders angled tiles for depth.

### Status
Accepted

---

## 2026-06-28 — Relics in MVP

### Decision
Discovery + relic-gated hidden passage on level 5.

### Status
Accepted

---

## 2026-06-28 — Fog on advanced levels

### Decision
`DiscoveryEngine` reveals cells along path; tutorial includes fog slice (level 4).

### Status
Accepted

---

## 2026-06-28 — Game logic outside widgets

### Decision
Testable engine in `lib/game_engine/`; widgets are thin.

### Status
Accepted

---

## 2026-06-28 — Not a Terra Incognita remake

### Decision
Environmental puzzles; no PvP/GM multiplayer from classic rules.

### Status
Accepted

---

## 2026-06-28 — Flame 3D / Unity deferred

### Decision
CustomPainter sufficient for Phase 1 visual target.

### Status
Accepted

---

## 2026-06-28 — Basic traps deferred to Phase 2

### Decision
Spike/pit/arrow trap mechanics not in Phase 1. Tutorial covers gems, keys, fog, relics.

### Reason
Codex Phase 1 review scope alignment.

### Status
Accepted
