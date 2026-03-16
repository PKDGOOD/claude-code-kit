<p align="center">
  <h1 align="center">claude-code-kit</h1>
  <p align="center">
    <strong>Ship consistent AI-assisted development across every machine and every project.</strong>
  </p>
  <p align="center">
    A portable, opinionated toolkit for <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> — custom commands, global rules, project templates, and a structured development process that travels with you.
  </p>
</p>

---

## Why this exists

You've spent hours teaching Claude Code how you work — your review style, your testing rules, your design process. Then you open a new project and start from zero.

**claude-code-kit** solves that. Clone once, run `setup.sh`, and every project on every machine gets the same quality baseline.

## What's inside

```
claude-code-kit/
├── commands/              # Custom slash commands (→ symlinked globally)
│   ├── analyze.md         #   /analyze  — fact-based investigation before coding
│   ├── design.md          #   /design   — structured design doc with scope guard
│   ├── review.md          #   /review   — code review checklist
│   ├── write-tests.md     #   /write-tests — test generation with conflict detection
│   ├── check-scope.md     #   /check-scope — verify you haven't drifted from design
│   └── init.md            #   /init     — bootstrap CLAUDE.md for a new project
│
├── global-claude.md       # Global CLAUDE.md (→ symlinked to ~/.claude/CLAUDE.md)
│                          #   Universal rules: code quality, process, safety
│
├── templates/             # Copy-and-customize per project
│   ├── CLAUDE.md          #   Project CLAUDE.md skeleton
│   ├── analysis.md        #   Analysis document template
│   ├── design.md          #   Design document template
│   ├── policy.md          #   Policy document template
│   └── project-readme.md  #   Project docs/ README template
│
├── docs-process/          # The development process itself
│   └── README.md          #   How to run analysis → design → implement → ship
│
└── setup.sh               # One command to install everything
```

## Quick start

```bash
# Clone
git clone https://github.com/YOUR_USERNAME/claude-code-kit.git ~/claude-code-kit

# Install (creates symlinks, idempotent — safe to re-run)
cd ~/claude-code-kit && ./setup.sh

# Verify
./setup.sh status
```

That's it. Every project on this machine now has access to `/analyze`, `/design`, `/review`, and your global rules.

### Start a new project

```bash
cd ~/your-new-project
claude            # Launch Claude Code
# then type:
/init             # Scans codebase, generates CLAUDE.md
```

### Update on another machine

```bash
cd ~/claude-code-kit && git pull && ./setup.sh
```

Existing symlinks update automatically via `git pull`. New commands get linked by `./setup.sh`.

## Commands

All commands are installed globally — available in every project via `/command-name`.

| Command | Purpose | When to use |
|---------|---------|-------------|
| `/init` | Bootstrap a project's `CLAUDE.md` by scanning the codebase | Starting a new project or onboarding an existing one |
| `/analyze` | Investigate the current state, define problems, compare alternatives | Before writing any code for a non-trivial feature |
| `/design` | Write a design doc with Scope Boundary, Acceptance Criteria, Changelog | After analysis is done, before implementation |
| `/review` | Run a structured code review against a checklist | Before committing or opening a PR |
| `/write-tests` | Generate tests with existing-test conflict detection | After implementation, or alongside it |
| `/check-scope` | Verify implementation matches the design document | During or after implementation |

### Example workflow

```
/analyze Add cursor-based pagination to property list API
  → produces docs/phase1-pagination-analysis.md

/design Implement cursor pagination per analysis
  → produces docs/phase1-pagination-design.md

  ... write code ...

/check-scope docs/phase1-pagination-design.md
  → flags any drift from the design

/write-tests Cover the new pagination logic
  → generates tests, warns about conflicting existing tests

/review
  → structured review of staged changes
```

## Global rules

`global-claude.md` is symlinked to `~/.claude/CLAUDE.md` and loaded into **every** Claude Code session. It contains:

- **Code quality** — clean code, SOLID, minimal complexity
- **Testing** — always write tests, never silently modify existing ones
- **Safety** — no destructive prod calls, no force push, confirm before risky actions
- **Process** — verify existing code before designing, document decisions
- **Commits** — never amend, always new commits, ask before merging

These are strong defaults. Override per-project in the project's own `CLAUDE.md`.

## Setup status

Run `./setup.sh status` anytime to see what's linked and what needs attention:

```
$ ./setup.sh status

claude-code-kit status
======================
  Global CLAUDE.md    ✓ linked
  commands/analyze    ✓ linked
  commands/design     ✓ linked
  commands/review     ✓ linked
  commands/init       ✓ linked
  commands/new-cmd    ✗ not linked  ← run ./setup.sh to fix

  1 command(s) need linking. Run: ./setup.sh
```

## Templates

Templates live in `templates/` and are meant to be **copied, not symlinked** — each project customizes them.

| Template | Usage |
|----------|-------|
| `CLAUDE.md` | Starting point for project-specific CLAUDE.md |
| `analysis.md` | Fact-based investigation: problem, data, alternatives, decision |
| `design.md` | Implementation spec with Scope Boundary + Acceptance Criteria + Changelog |
| `policy.md` | Runtime-tunable values (thresholds, TTLs, feature flags) |
| `project-readme.md` | Index page for a project's docs/ folder |

The `/init` command uses `CLAUDE.md` template automatically. Other templates are used by `/analyze` and `/design`.

## Development process

See [docs-process/README.md](docs-process/README.md) for the full process guide.

**TL;DR:**

| Step | Document | Required? |
|------|----------|-----------|
| 1. Investigate | `analysis.md` | For medium+ features |
| 2. Design | `design.md` | For medium+ features |
| 3. Define values | `policy.md` | Only if many tunable values |
| 4. Track work | `tasks.md` | Only if many subtasks |
| 5. Implement | code + tests | Always |
| 6. Review | `/review` | Always |
| 7. Archive | move to `_archive/` | After deploy + stabilize |

Scale by project size:

| Size | What you need | Example |
|------|--------------|---------|
| Large | analysis → design → policy → tasks | Architecture migration |
| Medium | design → tasks | New feature, new API |
| Small | Just code it | Bug fix, config change |

## Customization

### Add your own commands

```bash
# Create a new command
cat > ~/claude-code-kit/commands/my-command.md << 'EOF'
Do something useful with: $ARGUMENTS
EOF

# Link it
./setup.sh

# Use it anywhere
/my-command some arguments
```

### Override global rules per project

Project `CLAUDE.md` takes precedence over global. Add project-specific overrides there:

```markdown
# CLAUDE.md (in your project root)

## Project-specific rules
- Use tabs not spaces (overrides global)
- Database tests must use real DB, not mocks
```

## Philosophy

1. **Portable** — One `git clone && ./setup.sh` on any machine
2. **Consistent** — Same commands, same rules, same quality everywhere
3. **Non-invasive** — Symlinks only touch `~/.claude/`, never your projects
4. **Composable** — Global defaults + per-project overrides
5. **Process over prompts** — Not just "write better code" — a full analysis → design → implement → review cycle

## Contributing

PRs welcome. If you've found a command or rule that makes Claude Code significantly better, open a PR.

## License

MIT