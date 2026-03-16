---
description: Scaffold project-local git skills (commit, pr, branch) under .claude/skills/
allowed-tools: Bash(mkdir:*), Write, Read, Glob
---

## Your Task

Interactively scaffold `.claude/skills/commit/`, `.claude/skills/pr/`, and `.claude/skills/branch/`
for the current project, customized to its conventions.

## Step 1 — Gather context automatically

Before asking the user anything, read the project silently:

- `git log --oneline -10` — infer commit message style (conventional commits? ticket prefix? free-form?)
- `git branch -a` — infer branching strategy (main/feature, gitflow, trunk-based)
- Look for `commitlint.config.*`, `.gitmessage`, `CONTRIBUTING.md`, `.github/pull_request_template.md`
- Look for existing `.claude/skills/commit/SKILL.md` — if it exists, tell the user and stop

## Step 2 — Ask the user (only what you couldn't infer)

Ask ALL remaining questions in a single message. At the top, offer a fast-path option:

> **"Let Claude decide"** — reply with just "you decide" and I'll pick sensible defaults based on the project context and skip all questions below.

If the user chooses the fast-path, infer everything from context (stack, directory name, existing files) and proceed directly to Step 3 without further questions. Use these defaults when inferring:
- Commit format: conventional commits
- Types: `feat|fix|chore|refactor|docs|test`
- Scopes: derive from top-level directories or major concerns visible in the repo
- Ticket system: none
- Base branch: `main` (or `master` if that's what exists)
- PR target: same as base branch
- AI attribution: no
- Files to never commit: none beyond `.env`

Otherwise, cover the remaining unanswered questions:

1. **Commit format** — conventional commits / Jira prefix `[PROJ-123]` / Linear `[TEAM-123]` / free-form?
2. **Commit types** — use defaults (`feat|fix|chore|refactor|docs|test`) or custom list?
3. **Commit scopes** — list the meaningful scopes for this project (e.g. `auth`, `api`, `ui`) or leave open?
4. **Ticket system** — Jira project key / Linear team / none? (affects commit message and PR body)
5. **Base branch** — `main` / `master` / other?
6. **PR target** — same as base branch, or different?
7. **AI attribution** — include `Co-authored-by: Claude` in commits? (default: no)
8. **Files to never commit** — any project-specific exclusions beyond `.env`?

## Step 3 — Generate the three skills

Create the directory: `.claude/skills/commit/`, `.claude/skills/pr/`, `.claude/skills/branch/`

### `.claude/skills/commit/SKILL.md`

```
---
name: commit
description: Create a git commit following <project-name> conventions
user-invocable: true
disable-model-invocation: true
allowed-tools:
  - Bash(git add:*)
  - Bash(git status:*)
  - Bash(git diff:*)
  - Bash(git log:*)
  - Bash(git commit:*)
---

## Your Task
...
## Commit Format
...
## Rules
...
## Steps
...
```

Fill in based on answers. If ticket prefix is required, add a step to extract the ticket ID from the branch name via `git rev-parse --abbrev-ref HEAD`.

### `.claude/skills/pr/SKILL.md`

```
---
name: pr
description: Push the current branch and open a pull request into <base-branch>
user-invocable: true
disable-model-invocation: true
allowed-tools:
  - Bash(git status:*)
  - Bash(git branch:*)
  - Bash(git push:*)
  - Bash(git log:*)
  - Bash(git diff:*)
  - Bash(gh pr create:*)
  - Bash(gh pr view:*)
---
```

Rules: never run on base branch, never force push, no duplicate PRs.
PR body format: Summary bullets + Test plan checklist. Include ticket link if ticket system was specified.

### `.claude/skills/branch/SKILL.md`

```
---
name: branch
description: Create and switch to a new branch from <base-branch>
user-invocable: true
disable-model-invocation: true
allowed-tools:
  - Bash(git status:*)
  - Bash(git checkout:*)
  - Bash(git branch:*)
argument-hint: "<goal description>"
---
```

Derive branch name from `$ARGUMENTS`. Format: `<type>/<kebab-scope>`.
Rules: always branch from base branch, abort on uncommitted changes, confirm before creating.
If ticket system is set: ask for ticket ID and prepend to branch name (e.g. `feat/PROJ-123-auth-refresh`).

## Step 4 — Confirm

After writing all three files, print:

```
Created:
  .claude/skills/commit/SKILL.md
  .claude/skills/pr/SKILL.md
  .claude/skills/branch/SKILL.md

Run /commit, /pr, or /branch <goal> in this project.
```
