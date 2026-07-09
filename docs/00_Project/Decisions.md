# Decisions

Log material decisions here. Format: date, decision, reason, status.

---

## 2026-07-09 — Gameplay floor tile variation (per-attempt shuffle)

**Decision:** Floor slabs use a **four-variant PNG pool** (`tile_floor_1`–`tile_floor_4`) with `tile_floor.png` as fallback. Each walkable cell gets a random variant and 0/90/180/270° rotation per level attempt. Seed = `Object.hash(levelId, retryCount)` so layout reshuffles on Try Again but stays stable during play. Raised wall stones reuse the adjacent walkable cell's placement.

**Reason:** Single-texture floors felt repetitive on the 0090 renderer. Human-authored variants preserve art direction while breaking visual monotony without per-level tile maps.

**Impact:** `FloorTileLayout`, `MazePainter`, `MazeTheme`/`MazeTextureLoader`, `BoardRenderer` seed wiring; `Gameplay.md` updated. Engine/schema unchanged.

**Status:** Accepted (pending Human visual QA — review package 0091)

---

## 2026-07-09 — Production maze rendering: code-drawn POC (not PNG tileset)

**Decision:** Replace authored `tile_floor` + `edge_*` PNG maze rendering with the **code-drawn `MazePainter`** from the maze-render POC. Production `BoardRenderer` stacks `MazePainter` (floor + raised stone walls) under `CellOverlay` (interaction tints + collectible sprites). Remove edge/tile floor asset kinds and bundled edge PNGs.

**Reason:** Authored edge overlay PNGs failed visual QA (opaque seams, inconsistent floors). The POC renderer produces seamless raised-edge walls at any resolution and re-themes via `MazeTheme` without a per-world tileset.

**Impact:** `BoardRenderer`, `CellOverlay` (replaces `TileView`); `lib/features/gameplay/presentation/rendering/`; `LLGameplayAssets` trimmed; `edge_*.png` / `tile_floor.png` removed; `Gameplay.md` updated. Schema v2 engine unchanged. Supersedes PNG rendering portion of 2026-07-06 edge-tile decision and review package 0089.

**Status:** Accepted

---

## 2026-07-06 — Edge-based maze model (schema v2)

**Decision:** Migrate gameplay grid from impassable `wall` cells to **blocked edges on walkable cells** (schema v2). ~~Rendering uses layered `tile_floor` + `edge_*` overlays.~~ **Rendering:** superseded 2026-07-09 by code-drawn `MazePainter`. Architecture freeze exception approved for M2.7 visual foundation.

**Reason:** Combined autotile PNGs (`tile_n`, `wall_fill`) produced visible seams and inconsistent floor textures. Edge-blockage matches the design intent: raised sides on walkable tiles, not separate wall blocks.

**Impact:** `Level_Format.md` schema v2; `MazeGrid.canTraverse()`; `PathValidator` edge checks; ~~`CellEdgeMask` rendering~~; `level_001`–`level_010` edge-test band; supersedes review packages 0087/0088.

**Status:** Accepted (engine); rendering superseded 2026-07-09

---

## 2026-07-06 — Review workflow: Codex + Human only

**Decision:** Remove ChatGPT from the mandatory review package workflow. Pending and future review packages require **Codex engineering review** and **Human approval** only.

**Reason:** Streamline handoff; Codex covers technical quality and implementation compliance. Human retains final product authority.

**Impact:** `Review_Template.md`, `docs/99_Reviews/README.md`, `AGENTS.md`, and Cursor workflow updated. Historical approved packages may retain ChatGPT reviewer notes for audit.

**Status:** Accepted

---

## 2026-06-28 — Project restart: LLDS as source of truth

**Decision:** Restart implementation direction. Documentation system (LLDS) must exist before new gameplay/UI code.

**Reason:** Prototype used generic Material styling and rushed structure. Commercial quality requires design-first governance.

**Status:** Accepted

---

## 2026-06-28 — Flutter + Riverpod + go_router

**Decision:** Flutter for iOS/Android; Riverpod for state; go_router for navigation.

**Status:** Accepted (carried from prior foundation)

---

## 2026-06-28 — Draw Your Fate (draw-then-go)

**Decision:** No joystick. Player draws path, confirms, character animates execution.

**Status:** Accepted — core pillar

---

## 2026-06-28 — Ancient Tech + Mythical Ruins visual identity

**Decision:** LLDL governs all UI. No default Material, cyberpunk, or cartoon styling.

**Status:** Accepted

---

## 2026-06-28 — Game logic outside widgets

**Decision:** `game_engine/` holds rules; `features/` holds UI only; `data/` holds persistence.

**Status:** Accepted

---

## 2026-06-28 — Mock services before Firebase/ads/IAP

**Decision:** Interface-first `AdsService`, `PurchaseService`, `AnalyticsService`, `RemoteConfigService`, `CloudSaveService`.

**Status:** Accepted

---

## 2026-06-29 — GP7 gameplay rule precedence authority

**Decision:** GP7_Gameplay_Rules.md is the authoritative Core Gameplay Specification for rule precedence, execution order, step resolution pipeline, and failure/completion precedence. Feature documents GP4–GP6 reference GP7 and may not override it. Feedback (GP6) communicates outcomes but does not decide them.

**Reason:** Completes gameplay specification stack; resolves GP4-Q03/Q04 and GP5-Q04 precedence questions.

**Impact:** Engine implementation, QA test matrices, all gameplay feature docs.

**Status:** Accepted

---

## 2026-06-29 — GP4–GP7 gameplay specifications approved and locked

**Decision:** GP4_Hazards_Failure.md, GP5_Objectives_Completion.md, GP6_Gameplay_Feedback.md, and GP7_Gameplay_Rules.md are approved and locked after Gameplay Phase 2 review. Design content is frozen at v1.0.1; open questions remain in owning documents.

**Reason:** Gameplay Phase 2 consistency review complete for feature and rule-precedence specifications.

**Impact:** Authoritative gameplay references for engine implementation, level design, QA, and Gameplay.md integration review.

**Status:** Accepted

---

## 2026-06-29 — MVP feedback families scope (GP6)

**Decision:** All major gameplay feedback families are MVP. Each family requires exactly one simple, readable, testable MVP Basic form. MVP does not require final animation polish, advanced UI states, biome-specific effects, accessibility variants, cinematic sequences, or complex adaptive hint systems. Feedback must support puzzle clarity, route planning, hazard fairness, objective understanding, and mastery — without overloading the player or reducing the game to noisy UI instruction.

**Reason:** Human Owner scope decision for GP6_Gameplay_Feedback.md.

**Impact:** UX requirements, LLDL feedback tokens, MVP implementation manifest, QA feedback coverage.

**Status:** Accepted

---

## 2026-06-29 — MVP objective families scope (GP5)

**Decision:** All major objective families are MVP. Each family requires exactly one simple, readable, testable MVP Basic form. MVP does not require every variant, reward layer, advanced mastery condition, world-specific version, or complex combination. Objectives support exploration, puzzle solving, route planning, and mastery — not arcade score-chasing. Completion uses thematic seals (Escape, Treasure, Relic, Mastery) rather than generic star ratings.

**Reason:** Human Owner scope decision for GP5_Objectives_Completion.md.

**Impact:** Level design, completion UI direction, MVP content manifest, progression design.

**Status:** Accepted

---

## 2026-06-29 — MVP hazard families scope (GP4)

**Decision:** All major hazard families are MVP. Each family requires exactly one simple, readable, testable MVP Basic form. MVP does not require every variant, biome skin, advanced behaviour, boss version, or complex combination. Hazards remain puzzle-driven consequences — not action-combat.

**Reason:** Human Owner scope decision for GP4_Hazards_Failure.md. Supersedes partial deferral in 2026-06-28 traps decision for design authority (implementation order remains engine-dependent).

**Impact:** Level design, QA manifest, MVP content planning, GP4 hazard taxonomy.

**Status:** Accepted

---

## 2026-06-28 — Traps deferred until post-foundation

**Decision:** Trap mechanics documented in `Mechanics.md` but not required for first engine slice.

**Status:** Superseded for design scope by 2026-06-29 MVP hazard families decision. GP4 defines authoritative hazard design; engine slice order is separate.

---

## Rejected

| Idea | Reason |
|------|--------|
| Real-time joystick control | Conflicts with Draw Your Fate |
| Terra Incognita GM multiplayer | Different product category |
| Cyberpunk neon UI | Conflicts with LLDL |
| Default Material buttons/cards | Conflicts with LLDL |
| 2.5D environment compositor as MVP target | Over-engineered for Flutter MVP; superseded by master mockup sprite approach |
| World 01 cinematic environment boards as MVP blocker | Deferred to post-MVP per master mockup pivot |

Prior detailed log preserved in `docs/second-brain/06_Decisions/` (archive).

---

## 2026-07-06 — MVP visual pivot: back to master mockup

**Decision:** MVP visual target is the original master mockup (`docs/assets/mockups/ui_board_master.png`) — static 2D sprites, simple grid gameplay, standard Flutter UI screens. Not the World 01 2.5D environment compositor, procedural environment painters, or M2.8 camera/layering work.

**Reason:** Human Owner direction. The master mockup is achievable in Flutter + Cursor, matches product scope (10 screens, Draw/Solve/Escape), and the cinematic environment direction created unsustainable implementation complexity without improving the core puzzle loop.

**Impact:**
- World 01 Phase 1/2/3 studies and reference boards → **deferred** (archived, not deleted)
- Citadel experiment code → **removed**
- M2.7 painters → interim fallback until PNG sprites ship; sprite-first per AB2
- M2.8 camera/layering → **cancelled** for MVP
- Splash boots to Home, not citadel prototype

**Authority:** [MVP_Visual_Target.md](../06_Asset_Bible/MVP_Visual_Target.md)

**Status:** Accepted

---

## 2026-07-06 — Global weathered button plates

**Decision:** All `LLButton` variants use weathered engraved-plate styling — oxidized bronze primary, cracked stone secondary, texture skins under `assets/images/ui/`, updated gradient/shadow tokens. Primary labels use `textPrimary` on bronze (not `templeBlack` on bright gold).

**Reason:** Master mockup and LLDL Components language describe engraved temple mechanisms, not glossy mobile gradients. Single token change propagates to Home, pause, shop, level complete, dialogs, and gameplay action bar.

**Impact:** `LLGradient.goldButton`, `LLGradient.secondaryButton`, `LLShadow.weatheredPlate*`, `LLButton`, `LLFloatingButton`, Home title layout (Cinzel over gate, zoomed hero).

**Status:** Accepted
