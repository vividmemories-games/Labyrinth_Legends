# Level Design

## Design Principles

1. **Teach one thing per level** in tutorial band (1–5)
2. **Fair fog** — player can deduce with partial visibility
3. **Par paths exist** — three-star achievable with thought
4. **No guesswork** — logic, not trial-and-error mazes

## Tutorial Arc (World 1)

| Level | Teaches |
|-------|---------|
| 001 | Basic draw → go → exit |
| 002 | Gems |
| 003 | Key + lock |
| 004 | Fog discovery |
| 005 | Relic + hidden passage |

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
