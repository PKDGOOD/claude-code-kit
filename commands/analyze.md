Perform a fact-based analysis of: $ARGUMENTS

## Instructions

You are investigating a problem or opportunity before any code is written. Your output is an analysis document — not a solution.

### Step 1: Investigate the current state

- Read all relevant source files — don't guess or assume.
- Check actual parameter types, default values, call sites, and data flow.
- Look at git history if it helps understand why things are the way they are.
- Identify all files and modules that would be affected.

### Step 2: Define the problem clearly

- What exactly is wrong or missing? Be specific.
- What is the impact? (Users affected, performance numbers, error rates, etc.)
- What evidence supports this? (Logs, data, reproduction steps, etc.)

### Step 3: List alternatives

For each candidate solution:
- Describe the approach in concrete terms (not abstract hand-waving).
- List trade-offs: complexity, risk, performance, maintenance burden.
- Estimate scope: which files change, what breaks, what's preserved.

### Step 4: Recommend

- State your recommendation and why.
- Be explicit about what you're trading off.

### Step 5: Write the document

Create the analysis document at the path following the project's documentation conventions. If a `docs/` structure exists, follow it. Otherwise, suggest a reasonable location.

Use this structure:

```markdown
# [Title] — Analysis

## 1. Background
## 2. Current State
## 3. Problem Definition
## 4. Alternatives Considered
### 4.1 [Option A]
### 4.2 [Option B]
### 4.3 [Option C]
## 5. Recommendation
## 6. Impact & Risk
```

**Show the document to the user for review before finalizing.** Analysis drives all downstream decisions — it must be accurate.
