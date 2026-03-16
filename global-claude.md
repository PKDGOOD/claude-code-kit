# Global Rules — claude-code-kit

These rules apply to every project. Override per-project in the project's own `CLAUDE.md`.

## Principles

- **KISS** — Keep it simple. The simplest solution that works is the best solution.
- **YAGNI** — Don't build it until you actually need it. No speculative features or "just in case" code.
- **Atomic units** — Keep commits, PRs, design documents, and task items small and self-contained. Each unit should represent exactly one meaningful change that can be understood, reviewed, and reverted independently.
- **Ask, don't assume** — When uncertain about intent, requirements, or impact, stop and ask the user. A wrong guess costs more than a clarifying question.
- **Verify incrementally** — Don't write large amounts of code and check at the end. Build, compile, or test in small steps to catch issues early.

## Code Quality

- Write readable, maintainable code with clear naming.
- Follow SOLID principles. Avoid unnecessary abstractions.
- Keep functions small and focused on a single responsibility.
- Prefer immutability and pure functions where possible.
- Only add comments where the logic isn't self-evident.
- Don't over-engineer. Only make changes that are directly requested or clearly necessary.
- Don't add error handling for scenarios that can't happen. Trust internal code and framework guarantees.
- Don't create helpers or abstractions for one-time operations — three similar lines beats a premature abstraction.

## Testing

- Actively write tests for all new features and bug fixes.
- Use descriptive test names that explain the scenario.
- Follow AAA (Arrange-Act-Assert) or Given-When-Then structure.
- Test both happy paths and edge cases.
- **NEVER silently modify or remove existing tests.** If new code conflicts with existing tests, explain the conflict and ask for confirmation before changing any test.

## Safety

- **No destructive calls to production.** Never run DELETE, cancel, drop, or similar destructive operations against production systems without explicit user confirmation.
- Never hardcode credentials, tokens, or API keys.
- Never force-push to main/master.
- Never amend published commits.
- Be careful not to introduce OWASP top 10 vulnerabilities (injection, XSS, etc.).

## Process

- **Verify existing code before designing.** Read the actual code — parameters, types, call sites — before proposing changes. No abstract suggestions without code evidence.
- **Understand before modifying.** Read a file before editing it. Understand existing patterns before suggesting new ones.
- **Document decisions, not just code.** When making non-obvious choices, record the "why" — in commit messages, design docs, or comments.

## Git & Commits

- Always create new commits — never amend unless explicitly asked.
- Never merge or create PRs without user instruction.
- Prefer adding specific files over `git add -A`.
- Only commit when explicitly asked.

## Working with Design Documents

When a design document exists for the current work:
- Read it before starting implementation.
- Respect the Scope Boundary — don't change things outside scope.
- Check Acceptance Criteria before declaring work complete.
- Record deviations in the Changelog section with reasoning.

## Code-Comment Consistency

- When changing code, update related comments, docs, and API documentation together.
- Watch for comment/code drift during implementation.
- If a change affects functionality or API responses, confirm with the user first.
