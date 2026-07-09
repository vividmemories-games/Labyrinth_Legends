# Gameplay Screen Master Mockup

| Field | Value |
|-------|-------|
| **Reference ID** | UI-REF-GAMEPLAY-001 |
| **Type** | Full product visual reference (10 screens) |
| **Source Image** | `docs/assets/mockups/ui_board_master.png` |
| **Canonical Use** | MVP north star for all screens, gameplay panel, UI chrome, and sprite style |
| **Status** | **Active — MVP authority** |
| **Governance** | [MVP_Visual_Target.md](../../06_Asset_Bible/MVP_Visual_Target.md) |

## Purpose

This reference captures the intended **shipping product** for Labyrinth Legends MVP:

- 10 screens: Splash/Home, Level Select, Gameplay, Victory, Daily, Shop, Worlds, Settings, Level Preview, Pause
- Grid-based maze with cyan path drawing
- Static 2D sprites for tiles, explorer, gems, keys, portal
- Gold primary buttons, teal secondary, dark navy backgrounds
- Standard mobile UI patterns — achievable in Flutter widgets + `Image.asset`

## Gameplay Panel Reading

Use the center gameplay panel to validate:

- Flat grid maze (not environmental compositor)
- Cyan drawn path and glowing explorer
- Undo / Erase / Hint control bar
- Moves / Gems / Key stat counters
- Simple stone tile aesthetic

## Architectural Reading

Do **not** treat post-MVP environment boards (`World_01_Forgotten_Citadel/archive/`) as MVP authority. The master mockup wins for MVP visual execution.

Do **not** treat this reference as authoritative over gameplay rules or engine architecture. It illustrates visual intent only.
