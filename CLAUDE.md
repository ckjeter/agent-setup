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

**Current skills:**
| Skill | Location | Purpose |
|-------|----------|---------|
| `commit` | `claude/skills/commit/` | Conventional commit workflow |
| `pr` | `claude/skills/pr/` | Push branch and open PR |
| `branch` | `claude/skills/branch/` | Create branch from main |
| `db-coach` | `claude/skills/db-coach/` | CMU 15-445 study coach |
| `db-coach-ingest` | `claude/skills/db-coach-ingest/` | Ingest new lecture material |
| `db-coach-note` | `claude/skills/db-coach-note/` | Save insights to notes |

**Current commands:**
| Command | Location | Purpose |
|---------|----------|---------|
| `setup-git` | `claude/commands/setup-git.md` | Scaffold project-local git skills |

**Planned** (see `PLAN.md`):
- `pr-review` command — review PR diff against engineering standards

## What Lives Here vs. Dotfiles
- **agent-setup**: AI tool config (Claude, MCP, prompts, skills)
- **~/.dotfiles**: Shell, terminal, editor, git environment
