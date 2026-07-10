# Level Design

## Design Principles

1. **Teach one thing per level** in tutorial band (1–5)
2. **Fair fog** — player can deduce with partial visibility
3. **Par paths exist** — three-star achievable with thought
4. **No guesswork** — logic, not trial-and-error mazes

## Tutorial Arc (World 1) — design authority

| Level | Teaches | Implementation status |
|-------|---------|----------------------|
| 001 | Basic draw → go → exit | ✅ Implemented |
| 002 | Gems (`collectAllGems`) | ✅ **Shimmering Stones** — 5×5 gem loop |
| 003 | Key + lock | ✅ **Gate of Echoes** — mandatory key detour |
| 004 | Fog discovery | ✅ **Veiled Passage** — `discoveryMode: "fog"` |
| 005 | Relic + hidden passage | ✅ **Ancient Lens** — `discoveryMode: "relicGated"` |

> **M2.10 (2026-07-10):** Tutorial band 002–005 authored; `DiscoveryEngine` wired to `GameplaySession` (fog reveal on draft/execution path; relic-gated visibility on draft + execution). Levels 006–010 remain geometry/engine chambers.

## Star Thresholds

Per-level JSON:

```json
"starThresholds": {
  "threeStars": 12,
  "twoStars": 18,
  "oneStar": 30
}
```

Lower path length = more stars.

## Objectives Block

```json
"objectives": {
  "reachExit": true,
  "collectAllGems": false,
  "minGems": 0
}
```

## Stub Chambers (6–20)

Procedural or template-authored until handcrafted pass. Must remain solvable.

## Reference

Mockup gameplay panel: `docs/assets/mockups/ui_board_master.png`
