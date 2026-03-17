# agent-setup

Personal portable AI configuration. Managed alongside ~/.dotfiles.

## Purpose
Makes Claude Code setup reproducible across machines:
- `claude/CLAUDE.md` → symlinked to `~/.claude/CLAUDE.md` (global Claude config)
- `claude/skills/` → symlinked to `~/.claude/skills/` (global skills)
- `claude/commands/` → symlinked to `~/.claude/commands/` (global commands)
- `mcp/` → MCP server configs (to be added)

## Install on a New Machine
```sh
git clone git@github.com:ckjeter/agent-setup.git ~/agent-setup
sh ~/agent-setup/install.sh
```

## Structure
| Path | Purpose |
|------|---------|
| `claude/CLAUDE.md` | Global Claude preferences and onboarding rules |
| `claude/skills/` | Custom Claude Code skills (symlinked to `~/.claude/skills/`) |
| `claude/commands/` | Global Claude commands (symlinked to `~/.claude/commands/`) |
| `mcp/` | MCP server configs (Jira/Confluence pending) |
| `install.sh` | Symlink setup script |

## Skills Architecture

Claude Code skills are slash commands (`/skill-name`) defined in `SKILL.md` files.

```
claude/skills/
└── <skill-name>/
    └── SKILL.md    ← frontmatter + system prompt injected on invocation
```

**Scopes:**
- `~/.claude/skills/` — global (all projects); managed via `claude/skills/` in this repo
- `<project>/.claude/skills/` — project-local, overrides global if same name

**SKILL.md frontmatter fields:**
| Field | Purpose |
|-------|---------|
| `name` | Display name |
| `description` | Shown in `/help`; used by Claude to assess relevance |
| `user-invocable: true` | Enables `/skill-name` invocation |
| `disable-model-invocation: true` | Prevents Claude from auto-triggering |

**Current skills (global):**
| Skill | Location | Purpose |
|-------|----------|---------|
| `db-coach` | `claude/skills/db-coach/` | CMU 15-445 study coach |
| `db-coach-ingest` | `claude/skills/db-coach-ingest/` | Ingest new lecture material |
| `db-coach-note` | `claude/skills/db-coach-note/` | Save insights to notes |
| `prompt-coach` | `claude/skills/prompt-coach/` | Prompt engineering coach |
| `resume-session` | `claude/skills/resume-session/` | Resume a prior session |
| `save-session` | `claude/skills/save-session/` | Save current session state |

**Current commands:**
| Command | Location | Purpose |
|---------|----------|---------|
| `setup-git` | `claude/commands/setup-git.md` | Scaffold project-local commit, pr, and branch skills |

> Note: `commit`, `pr`, and `branch` are **project-local** skills scaffolded by `/setup-git` — they are not global skills in this repo.

**Planned** (see `PLAN.md`):
- `pr-review` command — review PR diff against engineering standards

## What Lives Here vs. Dotfiles
- **agent-setup**: AI tool config (Claude, MCP, prompts, skills)
- **~/.dotfiles**: Shell, terminal, editor, git environment
