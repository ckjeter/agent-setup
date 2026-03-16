# agent-setup

Personal portable AI configuration. Managed alongside ~/.dotfiles.

## Purpose
Makes Claude Code setup reproducible across machines:
- `claude/CLAUDE.md` → symlinked to `~/.claude/CLAUDE.md` (global Claude config)
- `prompts/` → reusable prompt templates
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
| `claude/tips.md` | Reference notes on Claude Code usage |
| `prompts/new-project.md` | Template for bootstrapping a project CLAUDE.md |
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
| Skill | Location | Status |
|-------|----------|--------|
| `prompt-coach` | `claude/skills/prompt-coach/` | Active — audits English prompts before task execution |

**Planned skills** (see `PLAN.md`):
- `commit` — enforce conventional commits, audit staged diff
- `pr-review` — review PR diff against engineering standards
- `jira` — structure Jira ticket descriptions

## Learning Goal (Active)

This repo is the workspace for learning to author and manage Claude Code skills.
Session context: authoring `SKILL.md` files, understanding frontmatter fields, designing
skill system prompts, and wiring `install.sh` to keep `~/.claude/skills/` in sync with
`claude/skills/` via symlink.

**Current state:**
- `prompt-coach` exists at `~/.claude/skills/` but is not yet tracked in this repo
- `claude/skills/` directory does not exist yet — next step is to migrate it here

## What Lives Here vs. Dotfiles
- **agent-setup**: AI tool config (Claude, MCP, prompts, skills)
- **~/.dotfiles**: Shell, terminal, editor, git environment
