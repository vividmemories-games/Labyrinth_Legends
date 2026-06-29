# Home Screen

**Route:** `/`  
**Mockup ref:** Top-left panel in `docs/assets/mockups/ui_board_master.png`

## Purpose

Main hub — atmosphere, title, primary navigation.

## Layout

```
LLScreenBackground (ruins hero + dark gradient veil)
├─ SafeArea
│   ├─ Top: LLCurrencyChip (coins) + LLCurrencyChip (gems)
│   ├─ Center: Title "Labyrinth Legends" (LLTextStyle.title, gold)
│   ├─ Subtitle tagline (LLTextStyle.body)
│   └─ Bottom stack:
│       ├─ LLButton primary — Play
│       ├─ LLButton secondary — Daily Challenge
│       └─ Row: LLButton ghost Shop | LLButton ghost Settings
```

## Visual

- Hero: temple ruins with portal glow (art asset or cropped mockup)
- Title: gold metallic, subtle gold glow shadow
- No cyan primary buttons

## Navigation

| Action | Route |
|--------|-------|
| Play | `/worlds` |
| Daily | `/daily` |
| Shop | `/shop` |
| Settings | `/settings` |

## States

| State | Behavior |
|-------|----------|
| Loading progress | Hide currency or shimmer chips |
| First launch | Same layout — tutorial prompt future |

## Components Used

`LLScreenBackground`, `LLCurrencyChip`, `LLButton`, `LLTextStyle.title`, `LLTextStyle.body`
