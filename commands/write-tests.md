Write tests for: $ARGUMENTS

## Instructions

Generate tests for the specified code. If no target is specified, write tests for all recently changed files.

### Step 1: Understand the code

- Read the source files to be tested. Understand the logic, not just the API surface.
- Identify the testing framework and patterns already used in the project.
- Find existing tests for the same module — match their style and conventions.

### Step 2: Plan test cases

Cover:
- **Happy path**: Normal inputs, expected outputs.
- **Edge cases**: Empty inputs, boundary values, nulls, max/min values.
- **Error cases**: Invalid inputs, missing dependencies, failure modes.
- **Integration points**: If the code interacts with external systems, test those boundaries.

### Step 3: Check for conflicts

Before writing:
- Read all existing test files for the target module.
- If your new tests would require **modifying or removing existing tests**, STOP and report the conflict to the user:
  ```
  ⚠️ Conflict: existing test `testXxx` in TestFile.kt asserts [old behavior].
  New implementation changes this to [new behavior].
  Options:
    1. Update the existing test to match new behavior
    2. Keep both (if old behavior is still valid in some path)
    3. Remove the old test (if the behavior is fully replaced)
  Which approach?
  ```
- **Never silently modify or delete existing tests.**

### Step 4: Write tests

- Use descriptive names: `test [scenario] should [expected outcome]` or backtick descriptions.
- Follow AAA pattern: Arrange → Act → Assert (clear separation).
- One assertion concept per test — don't test multiple unrelated things.
- Use the project's existing test utilities, fixtures, and helpers.
- Place tests in the conventional location for the project.

### Step 5: Verify

- Confirm the tests compile/pass by suggesting the appropriate test command.
- If any test relies on external state (DB, API, files), note that explicitly.
