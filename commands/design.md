Write a design document for: $ARGUMENTS

## Instructions

You are writing an implementation spec — the blueprint that will guide coding. This is not a brainstorming document; decisions should already be made (via analysis or user direction).

### Step 1: Understand the context

- If an analysis document exists for this work, read it first.
- Read all source files that will be modified. Understand current behavior before specifying new behavior.
- Identify the exact files, classes, and methods that will change.

### Step 2: Write the design document

Create the document following the project's documentation conventions.

**Required sections** — do not skip these:

```markdown
# [Title] — Design

## 1. Background & Purpose
### 1.1 Current Problem
### 1.2 Solution Direction

## 2. Scope Boundary

### 2.1 In Scope (will change)
| Component | File | Change |
|-----------|------|--------|
| ... | ... | ... |

### 2.2 Out of Scope (will NOT change — be explicit)
| Component | Why not |
|-----------|---------|
| ... | ... |

## 3. Detailed Design
[Concrete implementation details: class design, API contracts, data models, SQL, etc.
 This section's structure varies by project — organize as needed.]

## 4. Acceptance Criteria

### 4.1 Functional
- [ ] [Specific, testable condition]
- [ ] [Another condition]

### 4.2 Non-Functional
- [ ] [Performance, security, compatibility criteria if applicable]

## 5. Changelog
- [Date]: Initial design
```

### Rules

- **Be concrete.** Show actual class names, method signatures, SQL, request/response shapes. Not "we could add a service" — instead "add `PricingService.calculateRate(propertyId, dates): Rate`".
- **Scope Boundary is a guardrail.** It prevents implementation from drifting. "Out of Scope" is just as important as "In Scope".
- **Acceptance Criteria must be verifiable.** Each item should be checkable by running a test or command — not subjective ("it should feel fast").
- **Changelog tracks deviations.** If the design changes during implementation, record what changed and why — don't silently edit the original design.

**Present the document to the user for approval before finalizing.** This is the contract for implementation.
