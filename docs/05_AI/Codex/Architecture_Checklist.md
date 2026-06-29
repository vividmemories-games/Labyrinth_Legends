# Architecture Checklist

- [ ] `game_engine/` has zero Flutter widget imports
- [ ] `features/` has zero path validation logic
- [ ] `design_system/` has zero game_engine imports
- [ ] Repositories are sole persistence writers
- [ ] Services use interfaces + mock impls
- [ ] Providers don't embed business rules
- [ ] Folder structure matches `Folder_Structure.md`
