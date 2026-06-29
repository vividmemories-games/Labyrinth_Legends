# Level Select

**Route:** `/worlds/:worldId/levels`  
**Mockup:** Vertical path with cyan dotted connectors, gold level nodes

## Layout

- AppBar: world name (Cinzel gold)
- Lore blurb (body secondary)
- Vertical path: `LLPanel` nodes connected by cyan dotted line
- Each node: level number, stars (`LLStarRating`), lock state

## Interaction

Tap unlocked node → level preview sheet → Play

## Components

`LLPanel`, `LLStarRating`, `LLButton`

See `docs/01_Game_Design/Level_Design.md`
