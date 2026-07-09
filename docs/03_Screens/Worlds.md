# Worlds / Chapters

**Route:** `/worlds`  
**Mockup:** Panel 7 in `docs/assets/mockups/ui_board_master.png`

## Purpose

Chapter picker — choose a world before level select.

## Layout

```
LLScreenBackground (level_select.png veil)
├─ Header: back + CHAPTERS title
└─ List of chapter cards
    └─ Each card: AI world plate background + left text gradient + lock/chevron
```

## Chapter cards

| World | Background asset |
|-------|------------------|
| Crumbling Temple | `world_01_crumbling_temple_card.png` |
| Forgotten Ruins | `world_02_forgotten_ruins_card.png` |
| Lost Mechanisms | `world_03_lost_mechanisms_card.png` |

- Locked worlds: darkened plate + lock icon
- Tap unlocked → `/worlds/:worldId/levels`

## Components

`LLScreenBackground`, `LLTopBar` (back), custom `_WorldChapterCard`

See `docs/01_Game_Design/Worlds.md`
