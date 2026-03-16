Bootstrap a CLAUDE.md for this project.

## Instructions

Scan the codebase and generate a comprehensive CLAUDE.md in the project root.

### Step 1: Analyze the project

Investigate the following by reading files, not guessing:

- **Language & framework**: Check build files (package.json, build.gradle, Cargo.toml, go.mod, pyproject.toml, etc.)
- **Build commands**: Find how to build, test, lint, and run the project
- **Project structure**: Map out the main directories and their purposes
- **Architecture patterns**: Identify key patterns (MVC, hexagonal, microservices, monorepo, etc.)
- **Database**: Check for ORM configs, migration files, connection strings
- **Testing**: Find test framework, test locations, how to run tests
- **Deployment**: Check for CI/CD configs (GitHub Actions, Dockerfile, etc.)
- **Existing documentation**: Read any README, CONTRIBUTING, or docs/ files

### Step 2: Generate CLAUDE.md

Use the template structure below. Fill in what you found. Leave out sections that don't apply — don't pad with guesses.

```markdown
# CLAUDE.md

## Project Overview
[1-2 sentences: what this project does]

**Tech Stack**: [language, framework, runtime versions]

## Build & Development Commands
[Actual commands found in the project — build, test, lint, run, etc.]

## Architecture
[Directory structure, module organization, key patterns]

## Key Development Patterns
[How to add features, where things go, naming conventions]

## Environment & Profiles
[Profiles, required env vars (never include actual values)]

## Critical Rules
[Project-specific constraints that must never be violated]

## Code Locations Reference
[Quick lookup table: component → path]
```

### Step 3: Confirm with the user

Show the generated CLAUDE.md and ask for confirmation before writing it. The user knows their project best — they may want to add domain-specific rules or remove irrelevant sections.
