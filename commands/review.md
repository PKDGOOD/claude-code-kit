Review the current changes against this checklist.

## Instructions

Run a structured code review on all staged and unstaged changes in the working tree. If $ARGUMENTS specifies files or a scope, focus on those.

### Step 1: Gather changes

- Run `git diff` and `git diff --cached` to see all changes.
- Read the full context of modified files — don't review diffs in isolation.
- If a design document exists for this work, read it to understand intent.

### Step 2: Review against checklist

Evaluate each category. Report only **actual issues found** — don't list categories with no problems.

#### Correctness
- Does the code do what it's supposed to do?
- Are edge cases handled?
- Are there off-by-one errors, null pointer risks, or race conditions?

#### Scope
- Do changes stay within the intended scope?
- Are there unrelated changes mixed in?
- If a design doc exists, does the implementation match it?

#### Security
- Any hardcoded secrets, credentials, or API keys?
- Input validation at system boundaries?
- SQL injection, XSS, command injection risks?

#### Testing
- Are new/changed code paths covered by tests?
- Do existing tests still pass with these changes?
- Are test names descriptive and scenarios clear?

#### Consistency
- Does new code follow existing patterns in the codebase?
- Naming conventions maintained?
- Are comments and docs updated to reflect changes?

#### Simplicity
- Is there unnecessary complexity?
- Dead code or unused imports added?
- Over-engineering for hypothetical future needs?

### Step 3: Report

Format your findings as:

```
## Review Summary

### Issues
- 🔴 **[Critical]** [file:line] Description
- 🟡 **[Suggestion]** [file:line] Description

### Looks Good
- Brief note on what's well-done (if applicable)
```

If there are no issues, say so clearly — don't invent problems.
