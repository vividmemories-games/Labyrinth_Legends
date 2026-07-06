# Phase 2 — Technical Flutter Feasibilities

> **STATUS: DEFERRED (Post-MVP)** — Superseded for MVP by [MVP_Visual_Target.md](../MVP_Visual_Target.md). The 2.5D compositor approach documented here is not the MVP delivery strategy. Retained for future environment work only.

## World 01: Forgotten Citadel


| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **World** | World 01 — Forgotten Citadel |
| **Phase** | Phase 2 — Technical Support (Flutter Feasibility) |
| **Status** | Draft |
| **Date** | 2026-07-05 |
| **Owner** | Apoorv |
| **Prepared By** | Cursor (synthesis from Deep Research PDF) |
| **Path** | `docs/06_Asset_Bible/World_01_Forgotten_Citadel/Phase2_Technical_Flutter_Feasibilities.md` |
| **Authority** | **Subordinate to** [Phase1_Visual_Language_Study.md](Phase1_Visual_Language_Study.md) |
| **Source Material** | [Flutter Feasibility for Grand Environmental Backgrounds](../Flutter%20Feasibility%20for%20Grand%20Environmental%20Backgrounds%20in%20a%20Premium%20Mobile%20Puzzle%20Game.pdf) |
| **Parent** | [World 01 README](README.md) · [Asset Bible README](../README.md) |
| **Dependencies** | [Phase 1 Study](Phase1_Visual_Language_Study.md) · [LLDL](../../02_Design_System/LLDL/LLDL.md) · [Engine Architecture](../../04_Technical/Engine_Architecture.md) |


---

## Document Role

This document is **technical support material only**. It translates the Deep Research PDF into actionable Flutter guidance for World 01 environmental presentation.

**It does not:**

- Override artistic goals from Phase 1
- Redefine LLDL or Asset Bible philosophy
- Authorize engine rewrites or gameplay changes
- Replace the North Star emotional contract

**It does:**

- Explain how Flutter can *serve* Phase 1 principles
- Identify safe prototype paths and performance guardrails
- Map technical approaches to Phase 1 ranked visual priorities

When technical convenience conflicts with Phase 1 art direction, **Phase 1 wins**.

---

## Authority Hierarchy

```text
Phase 1 — Visual Language Study (artistic goals)
    ↓
Phase 2 — Technical Flutter Feasibilities (this document)
    ↓
Implementation experiments / production visuals
```

---

# Part I — Executive Findings from Deep Research

## Bottom-line feasibility

Flutter **can** deliver believable, grand, fixed-camera environmental backgrounds for a premium mobile puzzle game — **if** the problem is framed as **fixed-camera environmental illusion**, not runtime 3D.

The winning mental model: **2.5D compositor**, not mini game engine.

| Verdict | Detail |
|---------|--------|
| **Feasible** | Layered environment art, subtle parallax, pre-rendered lighting/depth, board carved visually into scene, limited shader accents |
| **Risky** | Full-screen filters, excessive clipping, large decoded textures, platform views, embedded Unity/SceneKit/Filament |
| **Not recommended (first milestone)** | Embedded 3D engines, free-roaming camera, dynamic PBR lighting, runtime geometry |

## Recommended primary approach

**Hybrid pre-rendered 3D backplates + Flutter-native composition**, with optional localized fragment shaders.

Rationale from PDF:

- World authored in DCC tool (Blender, etc.) with board cavity integrated architecturally
- Rendered as layered 2D passes from fixed camera
- Flutter composes passes, handles gameplay/HUD, optional subtle animation
- Preserves existing Flutter gameplay stack — no engine rewrite

## Fallback approaches (in order)

1. **Pure Flutter layered 2D** — fastest proof; excellent art discipline required
2. **Flutter 2.5D + localized shaders** — premium polish after static scene works
3. **Embedded 3D** — only if design later requires runtime camera/geometry (conflicts with current brief)

---

# Part II — How Flutter Can Approximate Depth

Depth in Forgotten Citadel is **perceptual**, not simulated. Phase 1 requires aerial perspective, scale humiliation, foreground framing, and carved board integration. Flutter achieves this through **composition**, not geometry.

## 2.5D depth techniques (aligned with Phase 1)

| Technique | What it sells | Phase 1 board support |
|-----------|---------------|----------------------|
| **Layered backplates** | Foreground / midground / background separation | Camera & Composition, Environment |
| **Atmospheric perspective** | Far structures fade, desaturate, soften | Lighting, Atmosphere |
| **Baked AO / shadow planes** | Carved grooves, arch recesses, board cavity | Board Integration, Materials |
| **Parallax offset** | Near/far layers move at different rates | Camera, Scale |
| **Subtle Matrix4 tilt** | Tile thickness, platform presence | Camera (not flat ortho) |
| **Pre-rendered depth/fog passes** | Mist between towers, valley drop | Environment, Lighting |
| **Localized shader accents** | Dust haze, god-ray sheet, stone shimmer | Lighting (restrained only) |

## What depth is NOT in this project

- Free camera orbit
- Runtime shadow casting from dynamic lights
- Physically based material simulation on every tile
- Full-screen post-processing stacks
- Using a reference PNG with a baked-in board as wallpaper (Phase 1 Part IV failure mode)

## Phase 1 alignment note

Depth serves **"the world is larger than the puzzle"** and **"the player is inside the place."** Technical depth tricks that shrink the board, break touch readability, or flatten the explorer-scale relationship **must be rejected** even if they perform well.

---

# Part III — Matrix4, CustomPainter, and Layers

## Render pipeline (Flutter-native)

```text
Art assets + board data
    → Widgets / CustomPainter / Transform
    → Render tree
    → Composited layer tree
    → Flutter engine (Impeller / Skia)
    → GPU scene
```

Flutter builds a **composited layer tree** during paint. Environmental grandeur is a **layer composition problem**, not a draw-call optimization problem in the traditional game-engine sense.

## CustomPainter + Canvas

**Best for:**

- Hand-authored composition under/over the board
- Shadow planes, masks, atmospheric overlays
- Repeated motifs, carved border accents
- "Environment under board / board / atmospheric overlay above board" stacking

**API notes:**

- `RenderCustomPaint` paints: background painter → child → foreground painter
- `CustomPaint.isComplex` / `willChange` — compositor hints for raster caching
- `shouldRepaint` — keep environment painters static; isolate repaints to gameplay layer

**Phase 1 use:** Board shell integration, directional light raking on tiles (authored or painted), non-interactive ruin framing — **not** procedural stone as primary art strategy.

## Transform + Matrix4

**Best for:**

- Subtle pseudo-perspective on **decorative shell layers only**
- Paint-time transforms (`Transform` widget applies `Matrix4` at paint time)
- Evidence: Flutter ships perspective-skew samples (Y-axis) — viable without layout breakage

**Recommended constraints (from PDF + Phase 1):**

- Apply tilt to **non-interactive** background/platform shells
- Keep **logical gameplay grid** stable and axis-aligned for hit testing
- Decouple presentation transform from interaction plane
- Phase 1 Camera board: ~35–45° downward feel — achieve through **composition + shell transform**, not by skewing tap targets

**Example intent (conceptual, not implementation mandate):**

```text
Stack
  ├── Layer 0: Far backplate (static, RepaintBoundary)
  ├── Layer 1: Midground structure (slight parallax)
  ├── Layer 2: Board shell + carved floor (optional subtle Matrix4)
  ├── Layer 3: Gameplay board (logical grid, no skew)
  ├── Layer 4: AO / shadow overlay
  ├── Layer 5: Foreground frame (pillars, arches — partial occluders)
  └── Layer 6: HUD (edge-anchored only)
```

## Composited layers + RepaintBoundary

**Best for:**

- Caching large static environment subtrees
- Separating static world from animated path/explorer repaints
- Reducing raster-thread work when only gameplay layer changes

**Guidance:**

- Wrap **static environment groups** in `RepaintBoundary`
- Gameplay board may repaint frequently — keep it **outside** static environment boundaries where possible
- Profile raster thread separately from UI thread (DevTools)

## Fragment shaders (optional polish tier)

**Best for (after static scene works):**

- Localized fog sheet
- Soft light sweep / dust motes
- Subtle stone shimmer on hero surfaces
- Albedo + normal/AO response on board shell only

**Constraints:**

- `FragmentProgram` / `FragmentShader` — supported on Skia and Impeller
- `ImageFilter.shader` — **Impeller only**; require fallback on legacy Android GL
- **Always clip/localize** — unclipped `BackdropFilter` affects whole screen
- **Maximum one full-screen animated shader** in prototype; prefer localized passes

**Phase 1 alignment:** Shaders accent **calm mystery** — not neon arcade energy. If shader glow contradicts "ancient inscribed energy," remove it.

## ImageFilter + backdrop effects

**Use sparingly for:**

- Softened far-depth layers
- Localized haze
- Controlled blur on non-interactive depth planes

**Avoid:**

- Full-screen blur stacks
- Shader filters without Impeller fallback plan
- Blur over gameplay tiles

---

# Part IV — Performance: What to Avoid

Flutter's performance guidance is explicit. Grand visuals fail on mobile when the **compositor** is abused.

## High-risk patterns (avoid in prototype and production)

| Pattern | Why it hurts | Phase 1 risk |
|---------|--------------|--------------|
| **`saveLayer()` overuse** | Offscreen buffers, render-target switches on mobile GPU | Jank during path drawing |
| **Top-level opacity on large subtrees** | Forces compositing of entire scene | Environment repaints with HUD |
| **Broad clipping** | Expensive when applied carelessly | Full-screen clip masks |
| **Unclipped `BackdropFilter`** | Can affect entire screen | Gameplay readability destroyed |
| **Multiple full-screen shaders** | Raster thread budget exceeded | "Dark puzzle game" neon stack |
| **Many semi-transparent layers** | Overdraw, memory, repaint complexity | Muddy atmosphere, not calm depth |
| **4096² textures (multiple)** | ~64 MiB decoded each (RGBA8888) | OOM on mid-range devices |
| **Platform views (Unity, SceneKit, etc.)** | Expensive composition, gesture conflicts, memory 80–180 MB (Unity) | Engine rewrite territory |
| **Debug-mode profiling** | Misleading frame times | False confidence |

## Practical budgets (from PDF)

| Budget area | Target |
|-------------|--------|
| **Frame rate** | 60 fps mandatory; 120 fps bonus |
| **Frame time (profile mode)** | UI < 8 ms, raster < 8 ms (60 Hz ≈ 16 ms total) |
| **Full-screen shaders** | 0–1 animated at once |
| **Texture sizes** | Mostly 1024²–2048²; 4096² rare hero only |
| **Environment layers** | 5–8 meaningful layers, not dozens of sheets |
| **Active world memory** | Rough 64–128 MiB decoded texture budget (guideline) |
| **Static caching** | `RepaintBoundary` on large static shells |

## Texture memory arithmetic (decoded RGBA8888)

| Resolution | Approximate decoded size |
|------------|-------------------------|
| 512² | ~1 MiB |
| 1024² | ~4 MiB |
| 2048² | ~16 MiB |
| 4096² | ~64 MiB |

Use `ResizeImage` when source art exceeds displayed size. Use DPR-aware `AssetImage` variants. `precacheImage` before first reveal.

## Profiling discipline

- Profile in **profile mode** on real devices — not debug, not simulator-only
- Watch **raster thread** separately (environment scenes are often raster-bound)
- Test one recent iPhone + one Android API 29+ mid-range device minimum
- Impeller default on iOS and Android API 29+

---

# Part V — What Can Be Prototyped Safely

Safe prototyping = **presentation-only**, **existing gameplay unchanged**, **Phase 1 success criterion as gate**.

## Safe prototype scope

| Element | Safe to prototype | Must remain unchanged |
|---------|-------------------|----------------------|
| Layered environment backplates | Yes | Level JSON, grid logic |
| Board shell / carved floor art | Yes | Hit detection, cell boundaries |
| Subtle Matrix4 on decorative shell | Yes | Logical grid alignment |
| Parallax on far/near layers | Yes | `GameplaySession`, controller |
| AO / shadow overlay passes | Yes | Path validation rules |
| Authored object sprites | Yes | Key/lock mechanics |
| Edge-anchored HUD art | Yes | HUD information architecture (minimal) |
| One localized atmospheric shader | Yes (after static works) | Input handling |
| `RepaintBoundary` caching strategy | Yes | Engine timing |

## Minimal first prototype (PDF recommendation)

Narrow validation build — answers **one question only:**

> *"Does this feel like a believable ancient place before I even start solving the puzzle?"*

| Prototype element | Requirement |
|-------------------|-------------|
| **Scene** | One Forgotten Citadel courtyard screen (e.g. level_003) |
| **Camera** | Fixed; at most very subtle decorative tilt |
| **Layers** | Far BG, structural midground, carved board shell, board overlay, AO/shadow, optional foreground frame |
| **Effects** | No more than one moving atmospheric effect initially |
| **Interaction** | Existing gameplay unchanged; logical board retained |
| **Loading** | Precache main environment layers before reveal |
| **Profiling** | Profile mode on device before judging performance |

## If prototype fails — fix order (Phase 1 + PDF aligned)

Do **not** escalate technical complexity first. Fix in this order:

1. **Composition** — camera framing, foreground/mid/background separation
2. **Scale** — explorer smallness, architectural anchors visible
3. **Board integration** — carved into stone, no container/card, no double-board wallpaper
4. **Materials** — authored surfaces, not procedural gradients
5. **Lighting coherence** — one sun vector across layers
6. **Then** — optional shaders or parallax polish

This mirrors Phase 1 Part V ranked priorities exactly.

## Not safe for first prototype

- Embedded Unity / SceneKit / Filament
- Platform views
- Engine or `GameplaySession` changes
- Full-screen post-processing stacks
- Using North Star / reference PNG as wallpaper with live grid on top
- Multiple animated shaders
- Skewing gameplay hit targets with perspective transforms

---

# Part VI — Approach Comparison (Logged from PDF)

| Approach | Realism ceiling | Integration complexity | Runtime risk | Best fit |
|----------|-----------------|------------------------|--------------|----------|
| **Pure Flutter layered 2D** | Medium–high (if art excellent) | Low | Low | Fastest one-level prototype |
| **Flutter + custom shaders** | High (fixed camera) | Medium | Medium | Premium polish after base works |
| **Hybrid pre-rendered 3D backplates + Flutter** | High | Medium | Low–medium | **Recommended primary** |
| **Native/lightweight 3D embedded** | Very high | High–very high | High | Only if runtime 3D truly required |

---

# Part VII — Asset Pipeline Notes (Flutter-native)

| Asset type | Recommended use |
|------------|-----------------|
| **Raster PNG/WebP layers** | Main environment passes, board shell, shadow overlays, fog sheets |
| **DPR variants** | Hero backplates and board shell on high-density devices |
| **ResizeImage** | Down-decode when source exceeds on-screen size |
| **centerSlice / nine-patch** | Ornamental HUD borders, stone plaques, scalable frames |
| **vector_graphics / flutter_svg** | Icons, glyphs, clean ornamental line work — not painterly atmosphere |
| **Precompiled vector** | Reduces clipping/masking overdraw for HUD ornaments |

## DCC export passes (hybrid approach)

When authoring in 3D:

1. Far background (towers, sky, mist)
2. Structural midground (arches, walls, banners)
3. Board shell / carved floor (with grid cavity)
4. AO / shadow pass
5. Optional depth-fog pass
6. Foreground framing (pillars, debris — partial occluders)

Render from **fixed camera** matching approved composition board. Build aspect-safe crops for target phone range.

---

# Part VIII — Mapping Technical Paths to Phase 1 Priorities

Phase 1 ranked visual changes — technical enablers:

| Phase 1 priority | Technical path | Flutter tools |
|------------------|----------------|---------------|
| **1. True spatial board integration** | Hybrid backplates with board cavity authored in DCC; gameplay grid on clean logical plane over carved shell pass | Layered `Stack`, authored PNG shell, no card `DecoratedBox` |
| **2. Explorer-scale camera** | Fixed camera composition with visible environment mass; tiny explorer sprite; board not 70%+ of frame | Layer framing, scale discipline in layout, authored composition |
| **3. Authored material artifacts** | Bitmap sprites with contact shadow; not vector icons | `Image` assets, optional normal/AO in shader on hero objects only |
| **4. Coherent directional light** | Baked light in backplates + matching raking shading on tiles/shell; one sun vector spec | Shared light direction constant across painters; prefer baked passes |
| **5. Peripheral ancient HUD** | Stone/bronze panel art, `centerSlice` frames, Cinzel/Trajan typography, edge anchoring | Custom panel widgets; avoid Material defaults |

---

# Part IX — Measurable Success Criteria (Prototype Gate)

| Criterion | Passing threshold |
|-----------|-------------------|
| **Visual believability** | Independent review: "place first, puzzle second" |
| **Board integration** | With grid hidden, scene still reads as coherent courtyard |
| **Performance** | Stable 60 fps profile mode on one iPhone + one Android API 29+ mid-range |
| **Memory discipline** | No multiple 4096² textures without profiling proof |
| **Interaction** | Path, keys, locks, exit, explorer readable; touch targets ≥ 48 dp |
| **Integration scope** | No engine rewrite; no native renderer embedding |
| **Phase 1 alignment** | No element reads as Flutter UI card on wallpaper |

---

# Part X — Prototype Timeline (from PDF)

Realistic **3–7 day** iteration window for direction validation:

```text
Day 1–2   Gather / approve fixed camera composition (ref boards 02, 03, 08)
Day 2–4   Build citadel scene in DCC OR paint layered concept with integrated board cavity
Day 4–5   Export layered passes; compose in Flutter; precache assets
Day 5–6   Add board shell, AO/shadow, subtle parallax; profile on device
Day 6–7   Optional one shader accent; review screenshots; iterate or lock direction
```

---

# Part XI — Non-Negotiables (Phase 1 Overrides)

If any technical recommendation below conflicts with Phase 1, **reject the technique**:

| Phase 1 principle | Technical implication |
|-------------------|----------------------|
| Puzzle is discovered, not placed | No wallpaper backplate containing a baked grid |
| Explorer intentionally insignificant | Do not maximize board fill at expense of environment |
| Board is architecture, not UI | No card borders, rounded panels, floating platform shadows |
| Calm over spectacle | No full-screen neon bloom, multiple shader stacks |
| Objects are artifacts | No vector icon placeholders in final direction |
| HUD subordinate to world | No center-screen overlays; edge anchoring only |
| History before gameplay | Author world first in DCC; Flutter composes — do not improvise citadel in CustomPaint alone |

---

## Version History


| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 0.1.0 | 2026-07-05 | Cursor | Initial synthesis from Deep Research PDF; subordinate to Phase 1 |


---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [Phase1_Visual_Language_Study.md](Phase1_Visual_Language_Study.md) | Phase 2 implementation (TBD) | [World 01 README](README.md) |

## Source

Full research document: [Flutter Feasibility for Grand Environmental Backgrounds in a Premium Mobile Puzzle Game.pdf](../Flutter%20Feasibility%20for%20Grand%20Environmental%20Backgrounds%20in%20a%20Premium%20Mobile%20Puzzle%20Game.pdf)
