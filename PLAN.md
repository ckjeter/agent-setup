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
- [x] `prompts/new-project.md` — CLAUDE.md bootstrap template
- [x] `prompts/prompt-coach.md` — English prompt coaching mode (available as `/prompt-coach`)
- [ ] `prompts/code-review.md` — standard review prompt
- [ ] `prompts/debug.md` — structured debugging prompt

## 4. Settings
- [ ] Populate `~/.claude/settings.json` with preferred tool auto-approvals (Read, Grep, Glob)
- [ ] Track a copy at `claude/settings.json` and symlink

## 5. README Update
- [ ] Update `README.md` to reflect `agent-setup` rename
- [ ] Add GitHub repo URL once pushed

## 6. Git/GitHub Workflow Commands
- [ ] Install `commit-commands` plugin — provides `/commit`, `/commit-push-pr`, `/clean_gone`
- [ ] Install `pr-review-toolkit` plugin — provides 6 PR review agents
- [ ] Add `prompts/commit-override-template.md` — template for per-project `.claude/commands/commit.md` overrides
- Note: use commands (not skills) for workflow automation; override globally installed commands per-project via `.claude/commands/`

## 7. DB Coach (CMU 15-445)
- [ ] Create `claude/skills/db-coach/SKILL.md` — global coach persona
- [ ] Create `knowledge/cmu-db/` — curated concept summaries, tracked in repo
- [ ] Set up MCP filesystem server pointing to `~/db-course/` for raw slides/papers
- [ ] Add `mcp/db-course.json` MCP config and wire into `install.sh`
- [ ] Add memory accumulation pattern: project insights → `knowledge/cmu-db/notes/`
- [ ] Reference db-coach in `bustub-private/CLAUDE.md` for agent consultation

## Out of Scope
- No cursor rules here (handled per-project in `.cursor/rules/`)
- No shell aliases here (belong in dotfiles .zshrc)
