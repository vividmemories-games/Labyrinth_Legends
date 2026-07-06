# Roadmap

## Phase 0 — Foundation (current)

**Goal:** Establish LLDS, design tokens, screen specs, architecture docs, and Cursor/Codex governance.

**Deliverables:**

- [x] Documentation structure (`docs/`)
- [x] LLDL + design tokens documented
- [x] Cursor rules updated
- [ ] Prototype code audit and reset plan
- [ ] Git repository initialized with foundation commit

**No gameplay implementation in Phase 0.**

## Phase 1 — Design System Implementation

- Implement `LL*` tokens in Flutter (`lib/design_system/`)
- Build documented reusable components (`LLButton`, `LLPanel`, etc.)
- Screen shells matching `docs/03_Screens/*` — layout only, mock data

## Phase 2 — Game Engine Core

**Status:** M1 engine core complete — approved and locked through review packages `0043`–`0049` on 2026-07-03.

- Testable `game_engine/` (grid, path validation, execution, discovery)
- JSON level format + handcrafted tutorial levels 1–5
- Unit tests before UI wiring

## Phase 3 — Vertical Slice

**Visual target:** [MVP_Visual_Target.md](06_Asset_Bible/MVP_Visual_Target.md) — master mockup (`docs/assets/mockups/ui_board_master.png`)

- Home → Level Select → Gameplay → Victory flow
- One world, 5 tutorial levels, local save
- Static 2D sprite assets (painter fallback until PNGs ship)
- Mock services (ads, IAP, analytics)

## Phase 4 — Content & Polish

- Levels 6–20, traps, relics, fog
- Audio, haptics, particles per LLDL
- iOS + Android flavors, store assets

## Phase 5 — Live Services

- Firebase Analytics, Remote Config
- AdMob, IAP
- Daily challenge leaderboard, cloud save (optional)

See `Milestones.md` for release gates.

## Future Documentation

| Document | Description | Authority |
|----------|-------------|-----------|
| `Asset_Bible.md` | Future production handbook for visual assets, icons, App Store artwork, marketing images, AI prompt libraries, export standards, naming conventions, and asset versioning. It inherits from LLDL and does not redefine design philosophy. | LLDL.md → Asset_Bible.md → Production assets |
