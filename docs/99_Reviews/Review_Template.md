# Review Package: [Task Name]

> Scaffold with `scripts/new_review_package.sh` — do not copy this file manually unless the script is unavailable.
> Template version: **v2**

## Metadata

| Field | Value |
|-------|-------|
| **Review ID** | NNNN |
| **Date** | YYYY-MM-DD |
| **Phase** | e.g. Phase 2 — Design System |
| **Owner** | Cursor / Human name |
| **Status** | Draft / Ready for Review / Approved / Changes Requested |
| **Review Type** | Design System / Screen / Gameplay / Architecture / Economy / Release |
| **Template Version** | v2 |
| **Related Docs** | `docs/...` paths |
| **Related Screens** | e.g. Home, Gameplay |
| **Related Components** | e.g. LLButton, LLPanel |

## Task Summary

One paragraph: what was requested, what was delivered, what was explicitly out of scope.

## Motivation

Why was this work undertaken?

What problem does it solve?

Why was this approach chosen?

## Files Created

```text
path/to/file.dart
path/to/doc.md
```

## Files Modified

```text
path/to/file.dart — brief note
```

## Files Deleted

```text
(none)
```

## Risk Assessment

| Field | Value |
|-------|-------|
| **Risk Level** | Low / Medium / High |
| **Affected Areas** | |
| **Rollback Complexity** | Low / Medium / High |
| **Migration Required** | Yes / No |
| **User-Facing Impact** | Yes / No |

## Dependencies

### Depends On

-

### Enables

-

### Blocks

-

## Product Impact

| Area | Impact |
|------|--------|
| **Player-facing** | Yes / No |
| **Visual impact** | |
| **UX impact** | |
| **Performance impact** | |
| **Developer experience impact** | |

## Design System Impact

- Tokens added/changed:
- Components added/changed:
- LLDL compliance notes:
- Showcase updated: Yes / No / N/A

## Gameplay Impact

- Engine changes: None / describe
- Mechanics affected: None / describe
- Levels affected: None / describe

## Architecture Impact

- Layers touched:
- New dependencies:
- Service interfaces:

## Documentation Updated

```text
docs/...
```

## LLDL Compliance Notes

- [ ] Primary actions use Ancient Gold
- [ ] Cyan reserved for energy/paths/portals
- [ ] No hardcoded visual values in feature screens
- [ ] No default Material styling without LLDL wrappers
- [ ] Components documented in `Components.md`

## Screenshots / Visual Evidence

| Screen | Path or description |
|--------|---------------------|
| | `docs/assets/...` or attach in review thread |

> For UI tasks: include simulator screenshots or reference `/dev/design-system` showcase section.

## Commands Run

```bash
fvm flutter pub get
fvm flutter test
fvm flutter analyze --no-fatal-infos
```

## Test / Analyze Results

| Command | Result |
|---------|--------|
| `flutter test` | X passed / failures |
| `flutter analyze` | exit code, warning count |

## Known Issues

-

## Open Questions

-

## Future Technical Debt

### Known Shortcuts

-

### Temporary Implementations

-

### Future Cleanup Tasks

-

## Recommended Next Task

-

## Cursor Self-Assessment

- Scope respected: Yes / No — explain
- Docs updated: Yes / No
- Tests adequate: Yes / No / N/A
- Ready for external review: Yes / No

## Ready For

- [ ] Codex Engineering Review
- [ ] ChatGPT Product Review
- [ ] Human Approval

---

## Reviewer Notes

### Codex Engineering Review

- **Date:**
- **Verdict:**
- **Score:**
- **Blocking Issues:**
- **Recommendations:**

### ChatGPT Product Review

- **Date:**
- **Verdict:**
- **Score:**
- **Product Notes:**
- **UX / Design Notes:**
- **Recommendations:**

### Human Approval

- **Date:**
- **Verdict:**
- **Notes:**
