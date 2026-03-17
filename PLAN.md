# agent-setup Roadmap

## 1. Wire Up Global CLAUDE.md
- [x] Create `claude/CLAUDE.md`
- [x] Create `install.sh` with symlink guard
- [x] Run `sh install.sh` to activate: `~/.claude/CLAUDE.md` → `claude/CLAUDE.md`

## 2. MCP: Studio Project (Jira + Confluence)
- [ ] Identify the right MCP server (e.g., `@anthropic/mcp-server-jira`, community alternatives)
- [ ] Create `mcp/studio.json` with server config
- [ ] Document setup steps in `mcp/README.md`
- [ ] Add to `install.sh` or as a separate `mcp/install.sh`

## 3. Prompts Library
- `prompts/` directory removed — templates moved into `claude/commands/` as invocable commands
- [ ] `claude/commands/code-review.md` — standard review command
- [ ] `claude/commands/debug.md` — structured debugging command

## 4. Settings
- [ ] Populate `~/.claude/settings.json` with preferred tool auto-approvals (Read, Grep, Glob)
- [ ] Track a copy at `claude/settings.json` and symlink

## 5. README Update
- [x] Update `README.md` to reflect `agent-setup` rename
- [x] Add GitHub repo URL once pushed

## 6. Git/GitHub Workflow Commands
- [x] `claude/skills/commit/SKILL.md` — conventional commit skill
- [x] `claude/skills/pr/SKILL.md` — push branch and open PR
- [x] `claude/skills/branch/SKILL.md` — create branch from main
- [x] `claude/commands/setup-git.md` — scaffold project-local git skills interactively
- [ ] `claude/commands/pr-review.md` — PR review command

## 7. DB Coach (CMU 15-445)
- [x] Create `claude/skills/db-coach/SKILL.md` — global coach persona
- [x] `claude/skills/db-coach/concepts/` — curated concept summaries with slides
- [x] `claude/skills/db-coach/notes/` — memory accumulation for project insights
- [x] `claude/skills/db-coach-ingest/SKILL.md` — ingest new lecture material
- [x] `claude/skills/db-coach-note/SKILL.md` — save insights to notes
- [ ] Set up MCP filesystem server pointing to `~/db-course/` for raw slides/papers
- [ ] Add `mcp/db-course.json` MCP config and wire into `install.sh`
- [ ] Reference db-coach in `bustub-private/CLAUDE.md` for agent consultation

## Out of Scope
- No cursor rules here (handled per-project in `.cursor/rules/`)
- No shell aliases here (belong in dotfiles .zshrc)
