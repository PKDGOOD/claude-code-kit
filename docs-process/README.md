# Development Process Guide

A structured process for AI-assisted software development. Scale up or down based on project size.

## Overview

Every non-trivial change follows this flow:

```
Analyze → Design → Implement → Review → Ship → Archive
```

Not every step produces a document. Scale by size:

| Size | Criteria | Documents needed | Example |
|------|----------|-----------------|---------|
| **Large** | Architecture change, multiple modules | analysis → design → policy → tasks | Pagination rewrite, cache architecture |
| **Medium** | New feature, single module | design (→ tasks) | New API endpoint, new filter |
| **Small** | Bug fix, config change | None | Typo fix, threshold adjustment |

## Document Types

### 1. Analysis

**"What's the problem, and what are our options?"**

- Fact-based investigation of the current state
- Problem definition with evidence
- Candidate solutions with trade-offs
- Recommendation and reasoning

> Use `/analyze` to generate this document.

### 2. Design

**"This is what we're building."**

- Confirmed implementation specification
- Updated during implementation — deviations recorded in Changelog

**Required sections:**

| Section | Purpose | Why it matters |
|---------|---------|----------------|
| **Scope Boundary** | What changes + what doesn't | Prevents implementation drift |
| **Acceptance Criteria** | Completion checklist | Objective "are we done?" test |
| **Changelog** | Deviations + reasoning | Preserves decision history |

> Use `/design` to generate this document.

### 3. Policy (optional)

**"These are the tunable values."**

- Configuration values, thresholds, business rules
- Separate from design only when values change more frequently than code
- If you have just a few values, put them in the design doc

### 4. Tasks (optional)

**"Here's the work breakdown."**

- Implementation checklist derived from design + policy
- Progress tracking
- Skip this if the work is small enough to track in the design doc's Acceptance Criteria

## File Structure

```
docs/
├── README.md                              ← Process guide (this file or a copy)
├── {YYYY-QN}-{project-name}/             ← Active project
│   ├── README.md                          ← Project overview + phase index
│   ├── phase{N}-{topic}-analysis.md
│   ├── phase{N}-{topic}-design.md
│   ├── phase{N}-{topic}-policy.md         ← optional
│   └── phase{N}-{topic}-tasks.md          ← optional
│
└── _archive/                              ← Completed projects
    └── {YYYY-QN}-{project-name}/
```

### Naming conventions

**Project folder**: `{YYYY-QN}-{module}-{feature}-{keyword}`
```
2026-Q1-api-property-list-repricing
2026-Q2-admin-reservation-refactor
```

**Document files**: `phase{N}-{topic}-{type}.md`
```
phase1-repricing-analysis.md
phase1-repricing-design.md
phase2-pagination-design.md
```

## Lifecycle

| When | Action |
|------|--------|
| Before coding | Write analysis (for medium+ features) |
| After direction is confirmed | Write design |
| During implementation | Update design — record changes in Changelog |
| After implementation | Verify Acceptance Criteria |
| After deploy + stabilize | Move project folder to `_archive/` |

### Re-visiting the same area

Create a new project folder. Link to the previous one for context:

```
docs/
├── 2026-Q3-api-property-pricing-v2/      ← new work
│   └── phase1-analysis.md                 ← references _archive/2026-Q1-...
└── _archive/
    └── 2026-Q1-api-property-repricing/    ← previous work
```

## Principles

1. **Analysis is the starting point.** No earlier stage is needed — "why are we doing this?" belongs in the analysis intro.
2. **Scope Boundary + Acceptance Criteria are mandatory in every design.** They are guardrails, not bureaucracy.
3. **Separate policy only when change frequency differs.** A few values? Put them in the design.
4. **Changelog records "why", not "what".** Git tracks what changed. The Changelog explains why the design deviated.
5. **Documents are immutable after archive.** Past decisions are valuable context — don't rewrite history.
