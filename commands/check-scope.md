Check whether the current implementation stays within the design scope.

## Instructions

Compare the actual code changes against the design document to detect scope drift.

### Step 1: Find the design document

- If $ARGUMENTS specifies a path, use that.
- Otherwise, look in `docs/` for the most recent design document related to the current branch or recent commits.
- If no design document is found, report that and stop.

### Step 2: Read the design

Extract:
- **Scope Boundary**: What files/components are in scope vs. out of scope.
- **Acceptance Criteria**: What conditions must be met.

### Step 3: Compare against actual changes

Run `git diff main...HEAD` (or appropriate base branch) to see all changes on the current branch.

Check:
1. **Out-of-scope changes**: Are any files listed as "Out of Scope" modified?
2. **Missing in-scope changes**: Are any files listed as "In Scope" untouched?
3. **Unlisted changes**: Are there modified files not mentioned in the design at all?
4. **AC progress**: Which Acceptance Criteria are met? Which are not yet?

### Step 4: Report

```
## Scope Check

### Design Document
[path to design doc]

### In Scope — Status
| Component | File | Status |
|-----------|------|--------|
| ... | ... | ✓ Done / ⚠ Partial / ✗ Not started |

### Out of Scope — Violations
[List any out-of-scope files that were modified, or "None — clean"]

### Unlisted Changes
[Files changed but not mentioned in design, or "None"]

### Acceptance Criteria
- [x] [Met criteria]
- [ ] [Unmet criteria]

### Verdict
[Clean / Minor drift / Significant drift — with explanation]
```
