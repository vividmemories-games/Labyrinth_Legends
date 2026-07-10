# Review Package: Review Package Workflow

## Metadata

| Field | Value |
|-------|-------|
| **Review ID** | 0003 |
| **Date** | 2026-06-28 |
| **Phase** | Governance — AI Workflow |
| **Owner** | Cursor |
| **Status** | Approved|
| **Review Type** | Release / Governance |
| **Related Docs** | `AGENTS.md`, `docs/05_AI/Cursor/Workflow.md`, `docs/05_AI/Codex/Review_Checklist.md` |
| **Related Screens** | N/A |
| **Related Components** | N/A |

## Task Summary

Implemented the formal review package system under `docs/99_Reviews/` so ChatGPT and Codex can review milestones without continuous local repo access. Updated agent governance in `AGENTS.md`, Cursor rules, and AI workflow docs. Created retrospective reviews 0001 and 0002 for completed design system and home shell work.

**Out of scope:** Gameplay, code refactors, new Flutter implementation.

## Files Created

```text
docs/99_Reviews/README.md
docs/99_Reviews/Review_Template.md
docs/99_Reviews/Design_System/0001_design_system_foundation.md
docs/99_Reviews/Screens/0002_home_screen_shell.md
docs/99_Reviews/Releases/0003_review_package_workflow.md
docs/99_Reviews/Gameplay/.gitkeep
docs/99_Reviews/Economy/.gitkeep
docs/99_Reviews/Releases/.gitkeep
```

## Files Modified

```text
AGENTS.md — agent roles + mandatory review packages
.cursor/rules/labyrinth-legends.mdc — Mandatory Review Package section
docs/05_AI/Cursor/Workflow.md — review package end-of-task rule
docs/05_AI/Codex/Review_Checklist.md — read review package first
docs/README.md — link to 99_Reviews
```

## Files Deleted

```text
(none)
```

## Design System Impact

None.

## Gameplay Impact

None.

## Architecture Impact

Process governance only — no code architecture changes.

## Documentation Updated

```text
docs/99_Reviews/* (new)
AGENTS.md
.cursor/rules/labyrinth-legends.mdc
docs/05_AI/Cursor/Workflow.md
docs/05_AI/Codex/Review_Checklist.md
docs/README.md
```

## LLDL Compliance Notes

N/A — documentation/process task only.

## Screenshots / Visual Evidence

N/A

## Commands Run

```bash
(none — documentation only)
```

## Test / Analyze Results

| Command | Result |
|---------|--------|
| Gameplay code changes | None |

## Known Issues

- Review index in README.md must be updated manually when new reviews are added
- Global sequential ID requires checking all category folders

## Open Questions

- Should approved reviews be copied to a `docs/99_Reviews/Approved/` archive?

## Cursor Self-Assessment

- Scope respected: Yes — docs/process only
- Docs updated: Yes
- Tests adequate: N/A
- Ready for external review: Yes

## Ready For

- [x] Codex Engineering Review
- [x] Human Approval

---

## Reviewer Notes (filled by Codex / ChatGPT / Human)

### Codex Engineering Review

_Date:_  
_Verdict:_  
_Notes:_


_Date:_  
_Verdict:_  
_Notes:_

### Human Approval

_Date:_  
_Verdict:_  
_Notes:_
