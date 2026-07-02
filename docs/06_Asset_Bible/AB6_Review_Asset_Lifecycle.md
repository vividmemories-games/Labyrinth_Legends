# AB6 — Review & Asset Lifecycle

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | AB6 — Review & Asset Lifecycle |
| **Document ID** | AB6 |
| **Series** | AB6 — Labyrinth Legends Asset Bible Knowledge Governance |
| **Version** | 1.0.2 |
| **Status** | Approved — Locked |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (specification) · Cursor (compiler) |
| **Last Updated** | 2026-07-02 |
| **Workshop** | AB6 — Review & Asset Lifecycle |
| **Path** | `docs/06_Asset_Bible/AB6_Review_Asset_Lifecycle.md` |
| **Parent** | [AB5 — AI Production Pipeline](AB5_AI_Production_Pipeline.md) |
| **Children** | [Asset Bible](Asset_Bible.md) *(integration document — AB6 governs workshops; integration compiles them)* |
| **Dependencies** | [Vision](../00_Project/Vision.md) · [Gameplay](../01_Game_Design/Gameplay.md) · [LLDL](../02_Design_System/LLDL/LLDL.md) · [AB0](AB0_Asset_Philosophy_Production_Principles.md) · [AB1](AB1_Production_Standards.md) · [AB2](AB2_Game_Assets.md) · [AB3](AB3_UI_Brand_Assets.md) · [AB4](AB4_Marketing_Store_Assets.md) · [AB5](AB5_AI_Production_Pipeline.md) |
| **Related Documents** | [AGENTS.md](../../AGENTS.md) · [99_Reviews](../99_Reviews/README.md) · [Review Template](../99_Reviews/Review_Template.md) · [Decisions](../00_Project/Decisions.md) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [AB5 — AI Production Pipeline](AB5_AI_Production_Pipeline.md) | [Asset Bible](Asset_Bible.md) | [Asset Bible README](README.md) · [Documentation Home](../README.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-02 | ChatGPT / Cursor | Initial AB6 workshop record — knowledge governance system specifications |
| 1.0.1 | 2026-07-02 | Cursor | Status hygiene pass — lifecycle aligned across AB6, Asset Bible README, and review package 0034 after Codex review |
| 1.0.2 | 2026-07-02 | Apoorv / Cursor | Human lock — Asset Bible workshop chain locked for integration (`0035`) |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: five knowledge governance systems with unified governance template |
| 1.0.1 | Codex review hygiene — document status, index, and review package lifecycle states aligned; ChatGPT review notes recorded in 0034 |
| 1.0.2 | Human lock recorded — status `Approved — Locked`; no design content changed |

---

## Document Authority

**AB6 is the production knowledge governance authority within the Labyrinth Legends Asset Bible.**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../00_Project/Vision.md) wins |
| Mechanical meaning and gameplay truth | [Gameplay](../01_Game_Design/Gameplay.md) wins |
| Visual language, emotional tone, design meaning | [LLDL](../02_Design_System/LLDL/LLDL.md) and WS workshops win |
| Production philosophy | [AB0](AB0_Asset_Philosophy_Production_Principles.md) wins |
| Universal production standards and asset state model | [AB1](AB1_Production_Standards.md) wins — AB6 formalizes gates; does not replace |
| Domain asset specifications | [AB2](AB2_Game_Assets.md) · [AB3](AB3_UI_Brand_Assets.md) · [AB4](AB4_Marketing_Store_Assets.md) win |
| Collaborative production operating model | [AB5](AB5_AI_Production_Pipeline.md) wins |
| Knowledge governance, review gates, documentation lifecycle | **AB6 wins** |
| Integrated production handbook compilation | `Asset_Bible.md` — AB6 governs workshops; integration compiles them |
| Git workflows, CI/CD, release planning, Scrum | Technical and business docs — AB6 does not define them |

AB6 defines **how production knowledge remains trustworthy** — not how tasks are tracked, releases are scheduled, or code is merged.

When any governance document conflicts with AB6 on **knowledge lifecycle or review gate responsibility**, AB6 overrides until [Decisions](../00_Project/Decisions.md) records an explicit, Human-approved exception.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Documentation Architect | Govern Asset Bible workshop lifecycle and lock order |
| Producers & Production Leads | Understand approval chain and maintenance obligations |
| Reviewers (Codex, ChatGPT, Human) | Apply consistent gate criteria across major work |
| Domain Authors (AB2–AB5 stewards) | Maintain documents through defined states |
| Engineers & Artists | Know when asset and doc states permit integration |
| Future Contributors | Onboard to repository knowledge without tribal memory |
| Human Owner | Exercise lock authority and exception approval |

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Universal Knowledge Governance Principles](#2-universal-knowledge-governance-principles)
3. [Knowledge Governance Lifecycle](#3-knowledge-governance-lifecycle)
4. [Governance System](#4-governance-system)
5. [Lifecycle System](#5-lifecycle-system)
6. [Change Management System](#6-change-management-system)
7. [Continuous Improvement System](#7-continuous-improvement-system)
8. [Knowledge Preservation System](#8-knowledge-preservation-system)
9. [Conclusion](#9-conclusion)
10. [Governance](#10-governance)
11. [What AB6 Must Not Do](#11-what-ab6-must-not-do)
12. [Workshop Conclusions](#12-workshop-conclusions)
13. [Related Documents](#13-related-documents)

---

## 1. Introduction

### 1.1 Purpose

The Asset Bible is only valuable if its knowledge **stays true** — through authorship, review, lock, maintenance, and retirement. Without governance, documentation becomes folklore; assets become orphans; AI acceleration amplifies drift.

**AB6 defines the governance systems that preserve quality, integrity, consistency, and long-term maintainability** of Asset Bible workshops and the production knowledge they carry.

AB6 answers:

> **How does production knowledge remain trustworthy across years, contributors, and tooling changes?**

### 1.2 Authority and Scope

| AB6 owns | AB6 does not own |
|----------|------------------|
| Knowledge **governance system** responsibilities and specifications | Gameplay rules, puzzle logic, movement |
| Documentation lifecycle states and transitions for Asset Bible workshops | Visual language meaning (LLDL) or asset design (AB2–AB4) |
| Review and approval philosophy for production knowledge | AI operating model detail (AB5) — AB6 formalizes gates AB5 references |
| Change management, traceability, and cross-document sync rules | Git workflows, branch strategy, CI/CD |
| Continuous improvement and lessons-learned integration | Release planning, sprint management, business processes |
| Knowledge preservation and archival philosophy | `Asset_Bible.md` integration content — AB6 prepares; does not author |
| Asset lifecycle **gate formalization** atop AB1 state model | Universal production culture prose (AB0, AB1) — extends only |

### 1.3 Inheritance

```text
Vision.md     — why the game exists
    ↓
Gameplay.md   — how the game works
    ↓
LLDL.md       — how the game looks, feels, moves, and communicates visually
    ↓
AB0 / AB1     — production philosophy and universal standards
    ↓
AB2 · AB3 · AB4 — domain production specifications
    ↓
AB5           — collaborative AI-assisted production operating model
    ↓
AB6 (this doc)— knowledge governance, review gates, lifecycle
    ↓
Asset_Bible.md — integrated handbook (compilation — not governance redefinition)
```

#### Vision

[Vision](../00_Project/Vision.md) requires premium craft sustained over time. Knowledge governance protects that commitment — documentation and assets must not decay into contradiction.

#### Gameplay

[Gameplay](../01_Game_Design/Gameplay.md) is mechanical truth. AB6 ensures **documentation changes that affect mechanical meaning** receive appropriate review — without AB6 redefining gameplay.

#### LLDL

[LLDL](../02_Design_System/LLDL/LLDL.md) is visual authority. AB6 governs **how LLDL-aligned production knowledge is reviewed and maintained** — not what the visual language means.

#### AB0 and AB1

[AB0](AB0_Asset_Philosophy_Production_Principles.md) establishes lifecycle beliefs and approval philosophy. [AB1 §3](AB1_Production_Standards.md#3-asset-governance) establishes the **asset state model** and delegates formal gates to AB6. AB6 **operationalizes** documentation and knowledge gates without relaxing AB1 standards.

#### AB2 through AB5

Domain workshops define **what** to produce and **how** to collaborate. AB6 defines **when knowledge is trustworthy enough** to lock, integrate, and rely upon — per workshop and per major task.

#### Asset_Bible.md and Technical Documentation

`Asset_Bible.md` **integrates** AB0–AB6 into a single handbook. AB6 governs the **workshop documents** that feed integration. Technical documentation implements approved knowledge — it does not override governance.

### 1.4 What AB6 Deliberately Does Not Own

AB6 excludes git procedures, project management methodology, QA test plans, Flutter implementation, marketing strategy, AI prompt libraries, and Asset Bible integration prose. If content defines *what a puzzle device looks like* — AB2. If it defines *how humans and AI collaborate* — AB5. If it defines *how the handbook is compiled* — `Asset_Bible.md`, not AB6.

---

## 2. Universal Knowledge Governance Principles

Every governance system inherits these principles **once**. Individual sections apply them; they do not restate them.

### 2.1 Knowledge Ownership

Every document class, workshop, and major knowledge artifact has a **named owner** accountable for accuracy, state, and maintenance — per [AB1 §3.2](AB1_Production_Standards.md#32-asset-ownership).

### 2.2 Authority Hierarchy

When sources conflict, **higher documentation wins** — Vision → Gameplay → LLDL → AB0 → AB1 → domain workshops → AB5/AB6 → implementation. Governance **reports** conflicts; it does not silently merge them.

### 2.3 Review Philosophy

Review evaluates against **authorities and declared purpose** — not preference alone. Review is mandatory for major knowledge changes — per [AB5 §7](AB5_AI_Production_Pipeline.md#7-collaborative-quality).

### 2.4 Approval Philosophy

Approval is an **explicit human act**. Approved knowledge is fit for reliance; unapproved knowledge is draft or exploratory only.

### 2.5 Lifecycle Thinking

Knowledge moves through **defined states** with intentional transitions. State is visible — not inferred from folder location or informal convention.

### 2.6 Documentation Integrity

Documentation must be **internally consistent** and **hierarchically compliant**. Status metadata, index entries, and review packages must align — status hygiene is governance, not bureaucracy.

### 2.7 Consistency

Governance rules apply uniformly across AB0–AB6, review packages, and production records — solo studio and future team alike.

### 2.8 Traceability

Changes link to **rationale**, **review record**, **version**, and **approver**. Future contributors can reconstruct why knowledge changed.

### 2.9 Continuous Improvement

Governance **learns** — failed reviews, production incidents, and drift discoveries update standards and docs — logged through defined improvement paths.

### 2.10 Knowledge Preservation

Retired knowledge is **archived with context** — not deleted silently. History teaches; amnesia repeats mistakes.

### Knowledge Governance Validation

Before any system is complete:

1. Improves **long-term repository quality**
2. **Ownership** is explicit
3. **Authority** is clearly defined
4. **Review** remains mandatory
5. **Documentation** remains authoritative
6. **Changes** are traceable
7. **Knowledge** is preserved for future contributors

---

## 3. Knowledge Governance Lifecycle

Production knowledge — Asset Bible workshops, review packages, and governed asset records — moves through:

```text
Idea
    ↓
Draft
    ↓
Review
    ↓
Approved
    ↓
Locked
    ↓
Maintained
    ↓
Deprecated
    ↓
Archived
```

| State | Purpose |
|-------|---------|
| **Idea** | Problem or gap identified; not yet authored — may live in Decisions or review package open questions |
| **Draft** | Active authorship; incomplete or unreviewed — not authoritative for integration |
| **Review** | Complete candidate under Codex/ChatGPT/Human review via review package |
| **Approved** | Reviewer acceptance — fit for reliance; not yet Human-locked |
| **Locked** | Human-locked (`Approved — Locked`) — changes require version bump and re-review |
| **Maintained** | Locked knowledge monitored for drift, upstream changes, and integration needs |
| **Deprecated** | Superseded by newer version or scope change — retained for traceability |
| **Archived** | Retired from active reference — historical record only |

**Asset records** (visual files, masters, deliverables) additionally use the [AB1 asset state model](AB1_Production_Standards.md#33-lifecycle-standards) — Exploratory through Archived. AB6 aligns documentation gates with asset gates at integration boundaries.

Workshop **lock order** for Asset Bible:

```text
AB0 → AB1 → AB2 → AB3 → AB4 → AB5 → AB6 → Asset_Bible.md
```

Exceptions require explicit Human approval recorded in [Decisions](../00_Project/Decisions.md).

### Knowledge Governance System Template

Every system in §4–§8 follows this internal structure:

| Section | Purpose |
|---------|---------|
| **Purpose** | Why this governance system exists |
| **Scope** | What knowledge and artifacts it governs |
| **Ownership** | Who is accountable |
| **Governance Processes** | How governance operates |
| **Lifecycle** | States and transitions |
| **Authority Rules** | Truth sources and conflict resolution |
| **Success Criteria** | How the studio knows governance works |
| **Future Evolution** | Scalability as repository matures |

---

## 4. Governance System

**Primary responsibility:** Define ownership, authority, review, approval, and decision hierarchy for production knowledge.

### Purpose

The Governance System establishes **who decides**, **who reviews**, and **who may lock** production knowledge — converting AB0 culture and AB1 standards into explicit decision architecture.

### Scope

- Asset Bible workshops (AB0–AB6)
- Review packages for major Asset Bible and production-knowledge tasks
- Material exceptions to lock order or authority hierarchy
- Human Owner final approval authority

### Ownership

| Artifact | Owner |
|----------|-------|
| **Asset Bible workshops** | Apoorv (Human Owner) — stewards per workshop during authorship |
| **Review packages** | Task owner (typically Cursor/implementer) until Human approval |
| **Decisions log entries** | Human Owner for material governance exceptions |
| **Domain knowledge accuracy** | Domain steward per AB2/AB3/AB4/AB5 |

### Governance Processes

1. **Authorship** — steward drafts against master prompt and required reading
2. **Review package** — major tasks scaffold per [99_Reviews](../99_Reviews/README.md) v2 template
3. **Dual review** — Codex engineering + ChatGPT product where applicable
4. **Status hygiene** — document metadata, Asset Bible index, and review package states align before Codex approval
5. **Human approval** — explicit; recorded in review package
6. **Lock** — Human promotes `Approved` → `Approved — Locked` in workshop order
7. **Exception** — conflicts or lock-order waiver → Decisions.md

### Lifecycle

Governance System spans all lifecycle states from Idea through Archived — it defines **who may advance** state transitions.

| Transition | Authority |
|------------|-----------|
| Idea → Draft | Steward or Human Owner |
| Draft → Review | Steward when draft complete |
| Review → Approved | Codex + ChatGPT acceptance; status hygiene complete |
| Approved → Locked | Human Owner only |
| Locked → Maintained | Automatic on lock; steward monitors |
| Any → Deprecated | Human Owner with documented supersession |
| Deprecated → Archived | Human Owner or delegated steward |

### Authority Rules

| Level | Authority |
|-------|-----------|
| Product intent | Vision |
| Mechanical truth | Gameplay |
| Visual meaning | LLDL |
| Production philosophy | AB0 |
| Universal production standards | AB1 |
| Domain production specs | AB2 · AB3 · AB4 |
| Collaborative production | AB5 |
| Knowledge governance | AB6 |
| Integration handbook | Asset_Bible.md — compiles; does not override workshops |

**Decision hierarchy for unresolved conflicts:** preserve higher authority → report in review package → escalate to Human Owner → log in Decisions if material.

### Success Criteria

- No workshop marked Approved while indexes or review packages disagree
- Every major Asset Bible task has a complete review package
- Lock order respected or explicitly waived
- Reviewer notes cite authorities — not vague approval

### Future Evolution

- Additional stewards may be named as team grows — ownership never becomes collective ambiguity
- New LLDS domains (beyond Asset Bible) **reuse** governance patterns — not parallel rulebooks

---

## 5. Lifecycle System

**Primary responsibility:** Manage documentation and asset states from draft through archive.

### Purpose

The Lifecycle System makes **state visible and meaningful** — so contributors know whether knowledge is exploratory, authoritative, locked, or retired.

### Scope

- Workshop document states (AB0–AB6 metadata)
- Review package states in [99_Reviews/README.md](../99_Reviews/README.md) index
- Asset states per [AB1 §3.3](AB1_Production_Standards.md#33-lifecycle-standards)
- Integration eligibility rules

### Ownership

| Area | Owner |
|------|-------|
| **Workshop lifecycle** | Human Owner |
| **Review package lifecycle** | Task owner through review; Human at approval |
| **Asset lifecycle per class** | Domain steward (AB2–AB4) or implementer with steward sign-off |

### Governance Processes

**Documentation lifecycle:**

| State | Integration rule |
|-------|------------------|
| Draft | May inform work; not citation authority for locked downstream docs |
| Approved | Authoritative for production briefs; may still change before lock |
| Approved — Locked | Authoritative for integration and compilation into Asset_Bible.md |
| Deprecated | Read-only reference; must not guide new production |
| Archived | Historical only |

**Asset lifecycle gates** (formalized atop AB1):

| Gate | Requirement |
|------|-------------|
| **Exploratory → In Production** | Brief approved; direction aligns with domain spec |
| **In Production → In Review** | Candidate complete in declared context |
| **In Review → Approved** | Human reviewer attestation; authorities cited |
| **Approved → Integrated** | Validation in target context (maze, screen, store frame) |
| **Integrated → Deprecated** | Superseding asset approved; traceability recorded |

AB6 defines **gate requirements**; domain workshops define **validation context**.

### Lifecycle

See §3 Knowledge Governance Lifecycle and AB1 asset states. Maintenance while Locked includes:

- Periodic alignment check when upstream docs (Vision, LLDL, Gameplay) version
- Index and cross-link verification after workshop updates
- Drift reports via review package or Decisions — not silent edits

### Authority Rules

- Locked workshops change only via **version bump + review package**
- Asset integration without Approved state is a **process violation**
- Status hygiene failures block Codex approval — per established Asset Bible practice

### Success Criteria

- Any contributor can determine document state from metadata and index within one minute
- No deprecated asset or doc re-enters production without explicit restoration review
- Lock chain AB0→AB6 visible in Asset Bible README

### Future Evolution

- Asset_Bible.md receives its own lifecycle when authored — compiled from locked workshops
- Automated state linting may assist — never replace Human lock authority

---

## 6. Change Management System

**Primary responsibility:** Ensure changes are versioned, assessed, traced, and synchronized across related documents.

### Purpose

The Change Management System prevents **silent drift** — where one document updates while siblings, indexes, and review records contradict it.

### Scope

- Workshop version history and change logs
- Review package records for material changes
- Cross-document synchronization (workshop ↔ index ↔ review package)
- Impact assessment when upstream authorities change

### Ownership

| Change type | Owner |
|-------------|-------|
| **Workshop content** | Workshop steward |
| **Status/metadata hygiene** | Task owner completing review |
| **Upstream impact response** | Human Owner assigns steward per affected workshop |
| **Decisions for material exceptions** | Human Owner |

### Governance Processes

1. **Impact assessment** — identify affected workshops, specs, and production briefs before editing locked knowledge
2. **Version increment** — meaningful workshop changes bump version; changelog entry required
3. **Review package** — material changes to AB0–AB6 require review package (new or follow-up hygiene pass)
4. **Cross-document sync** — update Asset Bible README index, navigation links, related-doc lists, 99_Reviews index
5. **Traceability** — changelog + review package + Decisions when applicable
6. **No silent override** — lower docs extend higher; conflict reported, not merged informally

### Lifecycle

Change management applies primarily during **Draft**, **Review**, **Approved** (pre-lock), and **Maintained** states. Locked changes **re-enter Review**.

### Authority Rules

| Scenario | Rule |
|----------|------|
| Locked workshop vs higher authority conflict | Higher authority wins; workshop schedules revision |
| Domain spec vs AB6 governance | AB6 for process; domain for content |
| Review package vs workshop metadata | Must align before Approved |
| AI-suggested doc edit | Human steward accepts; same change management applies |

### Success Criteria

- Changelog explains *what* changed and *why* for every version bump
- Codex blocking issues on status hygiene resolved in same work session
- Related workshops cross-linked when dependencies change

### Future Evolution

- Asset_Bible.md compilation triggers **sync audit** — AB6 defines requirement; integration doc defines procedure
- Dependency graphs may be tooling-assisted — truth remains in LLDS hierarchy

---

## 7. Continuous Improvement System

**Primary responsibility:** Convert lessons, feedback, and maturity growth into durable governance and standards evolution.

### Purpose

The Continuous Improvement System ensures governance **learns** — failed reviews, production mistakes, and contributor friction become documented improvement — not repeated oral tradition.

### Scope

- Lessons learned from review packages (blocking issues, recommendations)
- Standards evolution proposals for AB0–AB5
- Feedback from implementation revealing doc gaps
- Repository maturity milestones (workshop completion, lock chain, integration readiness)

### Ownership

| Activity | Owner |
|----------|-------|
| **Lesson capture** | Reviewer + task owner |
| **Standards evolution approval** | Human Owner |
| **Workshop revision scheduling** | Steward of affected workshop |
| **Open questions resolution** | Human Owner → Decisions or next review package |

### Governance Processes

1. **Capture** — reviewers record blocking issues and recommendations in review packages
2. **Triage** — classify: hygiene fix, content revision, new Decisions entry, deferred debt
3. **Integrate** — apply fixes in same session when blocking; schedule otherwise
4. **Elevate** — patterns affecting multiple domains → AB0/AB1 review for universal standard update
5. **Verify** — follow-up review confirms improvement — not assumption
6. **Maturity tracking** — Asset Bible README current status reflects workshop approval state honestly

### Lifecycle

Improvement loops operate continuously during **Maintained** state and during **Review** of subsequent changes.

### Authority Rules

- Continuous improvement **cannot** relax hierarchy or lock order without Human Decisions entry
- AB6 improvements may require AB5/AB4/etc. steward coordination — cross-workshop impact assessment mandatory
- Technical debt sections in review packages are **first-class inputs** — not optional filler

### Success Criteria

- Recurring Codex hygiene issues trend toward zero
- Open questions in review packages resolve or escalate — not linger across milestones
- Post-implementation surprises trigger doc updates in same work session when practical

### Future Evolution

- Maturity metrics may formalize (e.g., % locked workshops) — metrics serve governance, not replace judgment
- Contributor onboarding feedback refines AB6 clarity — via documented revision, not side channels

---

## 8. Knowledge Preservation System

**Primary responsibility:** Preserve institutional knowledge, historical context, and repository continuity for future contributors.

### Purpose

The Knowledge Preservation System protects **institutional memory** — so the project survives contributor turnover, tooling changes, and years between context switches.

### Scope

- Version history and changelogs on all workshops
- Review package archive in `docs/99_Reviews/`
- Deprecated and archived document handling
- Historical reference integrity (links, supersession notes)
- Onboarding knowledge path via Asset Bible README and workshop chain

### Ownership

| Asset | Owner |
|-------|-------|
| **Review package archive** | Human Owner — task owners author |
| **Workshop version history** | Workshop steward |
| **Decisions log** | Human Owner |
| **Legacy/superseded content** | Documented in Decisions or workshop deprecation notes |

### Governance Processes

1. **Never silent delete** — deprecate with supersession pointer
2. **Archive with context** — why retired, what replaced it, when
3. **Review packages persist** — handoff artifact for major tasks permanently
4. **Link maintenance** — broken cross-references are governance defects
5. **Onboarding path** — README → AB0 → AB1 → domain workshops → AB5 → AB6 → integration
6. **AI context curation** — future contributors inherit via authoritative docs, not chat logs — per [AB5](AB5_AI_Production_Pipeline.md)

### Lifecycle

Preservation focuses on **Locked**, **Maintained**, **Deprecated**, and **Archived** states — ensuring transitions retain recoverable history.

### Authority Rules

- Chat logs, IDE sessions, and model outputs are **not** authoritative — documented LLDS is
- Review packages supplement but do not replace workshop authority
- `docs/second-brain/` is historical reference only — per [AGENTS.md](../../AGENTS.md); new knowledge lives in LLDS

### Success Criteria

- New contributor can trace any workshop's approval history via review package ID
- Deprecated content clearly marked — no ambiguous "maybe still valid"
- Asset_Bible.md compilation can cite locked workshop versions with confidence

### Future Evolution

- Integration handbook becomes **compiled snapshot** of locked workshops — preservation system ensures sources remain addressable
- Long-term archive format may evolve — principles (traceability, no silent delete) persist

---

## 9. Conclusion

### 9.1 How Systems Work Together

Knowledge governance is one **continuous stewardship instrument**:

```text
Governance System (who decides)
        ↓
Lifecycle System (what state)
        ↓
Change Management System (how changes propagate)
        ↓
Continuous Improvement System (how we learn)
        ↓
Knowledge Preservation System (how we remember)
        ↓
Locked workshops → Asset_Bible.md compilation
```

Each system owns one primary responsibility. Overlap creates ambiguous authority and untrustworthy knowledge.

### 9.2 Inheritance Summary

| Authority | AB6 preserves by… |
|-----------|-------------------|
| **Vision** | Governance serves long-term premium craft |
| **Gameplay** | Mechanical truth changes trigger governed review |
| **LLDL** | Visual authority changes propagate through change management |
| **AB0** | Lifecycle beliefs and approval philosophy formalized |
| **AB1** | Asset state model gates formalized — not replaced |
| **AB2–AB4** | Domain specs remain content authority; AB6 governs their lifecycle |
| **AB5** | Collaborative quality and status hygiene enforced at gates |

### 9.3 Foundation for Asset_Bible.md

| Integration doc | Relationship to AB6 |
|-----------------|---------------------|
| **Asset_Bible.md** | Compiles locked AB0–AB6 — AB6 governs workshops; integration does not redefine them |

AB6 completes the **workshop chain**. Integration is the next authored artifact — compiled under AB6 governance, not substituting for it.

---

## 10. Governance

### 10.1 Document Authority

AB6 is subordinate to Vision, Gameplay, LLDL, AB0, AB1, and domain workshops AB2–AB5 for content meaning. AB6 is authoritative for knowledge governance, review gates, and documentation lifecycle specifications.

### 10.2 Document Lifecycle

| State | Meaning |
|-------|---------|
| **Draft** | Active authorship |
| **Approved** | Reviewer acceptance |
| **Approved — Locked** | Human-locked; version bump for changes |

AB6 should normally be approved and locked after AB5 to preserve Asset Bible dependency order. `Asset_Bible.md` follows AB6 lock.

### 10.3 Review Methodology

Follow LLDS compiler workflow — review package, Codex, ChatGPT, Human approval. See [99_Reviews](../99_Reviews/README.md).

---

## 11. What AB6 Must Not Do

AB6 must **not**:

- Define gameplay mechanics, puzzle logic, or movement rules
- Specify visual language, asset design, or domain production content (AB2–AB4)
- Redefine AI collaboration operating model (AB5) — formalize gates only
- Author `Asset_Bible.md` integration content — prepare governance only
- Define git workflows, CI/CD, release planning, or Scrum processes
- Create QA test plans, Flutter standards, or implementation guides
- Duplicate AB0, AB1, or AB5 governance prose — reference and extend
- Anticipate integration handbook structure or compilation prose

---

## 12. Workshop Conclusions

AB6 — Review & Asset Lifecycle records the following workshop conclusions for review:

| # | Conclusion |
|---|------------|
| 1 | Five knowledge governance systems cover production knowledge stewardship |
| 2 | Each system has one primary responsibility and explicit ownership |
| 3 | Documentation lifecycle (Idea→Archived) aligns with AB1 asset states at integration |
| 4 | Lock order AB0→AB6 is mandatory unless Human exception in Decisions |
| 5 | Review packages are mandatory handoff artifacts for major Asset Bible work |
| 6 | Status hygiene across metadata, indexes, and review packages is a governance gate |
| 7 | Change management requires traceability — changelog, review, Decisions when material |
| 8 | Knowledge preservation forbids silent deletion — deprecate and archive with context |
| 9 | Asset_Bible.md compiles locked workshops — AB6 governs; integration does not redefine |

---

## 13. Related Documents

### Locked authorities

- [Vision](../00_Project/Vision.md)
- [Gameplay](../01_Game_Design/Gameplay.md)
- [LLDL](../02_Design_System/LLDL/LLDL.md)

### Asset Bible

- [AB0 — Asset Philosophy](AB0_Asset_Philosophy_Production_Principles.md)
- [AB1 — Production Standards](AB1_Production_Standards.md)
- [AB2 — Game Assets](AB2_Game_Assets.md)
- [AB3 — UI & Brand Assets](AB3_UI_Brand_Assets.md)
- [AB4 — Marketing & Store Assets](AB4_Marketing_Store_Assets.md)
- [AB5 — AI Production Pipeline](AB5_AI_Production_Pipeline.md)
- [Asset Bible](Asset_Bible.md)
- [Asset Bible README](README.md)

### Governance reference

- [AGENTS.md](../../AGENTS.md)
- [99_Reviews](../99_Reviews/README.md)
- [Review Template](../99_Reviews/Review_Template.md)
- [Decisions](../00_Project/Decisions.md)
