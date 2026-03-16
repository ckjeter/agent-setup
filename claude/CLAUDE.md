# Global Claude Config — Kuan-Lin Wu

## About Me
- MSE student at Carnegie Mellon University (graduating Dec 2026)
- Based in Pittsburgh, PA
- Background: full-stack engineer, AI/ML, cloud infra, startup co-founder (KOLab Technology)
- Strong in: Python, TypeScript/JS, Java, C++, Django, React/Next.js, GraphQL, PostgreSQL, Kubernetes

## Environment
| Tool | Detail |
|------|--------|
| Shell | zsh + oh-my-zsh + Starship prompt |
| Terminal | Ghostty |
| Multiplexer | tmux (C-a prefix, Gruvbox theme, tpm) |
| Editor | Cursor (primary), Neovim (quick terminal edits only) |
| Python | pyenv |
| Node | nvm |
| Java | jenv |
| Packages | brew (arm), brew86 (x86) |
| Dotfiles | ~/.dotfiles (github: ckjeter/oh_my_dotfiles) |
| Agent config | ~/agent-setup (this repo) |

## Active Projects
| Project | Path | Context |
|---------|------|---------|
| Database (BusTub) | ~/bustub_private | CMU 15-445 coursework |
| Studio Project | — | Tracked in Jira + Confluence (MCP setup pending) |

## Behavioral Preferences
- Concise responses — no preamble, no trailing summaries
- No emojis
- Lead with the action or answer, not the reasoning
- Don't over-engineer: simplest solution that works, no speculative abstractions
- Don't add comments, docstrings, or type annotations to code I didn't ask you to change
- Ask before destructive git operations (force push, reset --hard, branch delete)
- I handle git commits and pushes myself unless I explicitly ask

## New Project Onboarding
When I open a project directory that has no `CLAUDE.md`, run this checklist before starting work:

1. **Detect the stack** — read `package.json`, `pyproject.toml`, `pom.xml`, `go.mod`, `Makefile`, or equivalent
2. **Detect conventions** — scan for linters (`.eslintrc`, `ruff.toml`, `.flake8`), formatters, test frameworks
3. **Detect run/test commands** — look for `Makefile`, `scripts/` in package.json, `Dockerfile`, `docker-compose.yml`
4. **Check for CI** — `.github/workflows/`, `Jenkinsfile`, etc.
5. **Detect git conventions** — check for existing `.claude/skills/commit/SKILL.md`, `commitlint.config.*`, `.gitmessage`, or hints in `CONTRIBUTING.md`
6. **Summarize findings** and offer to create a `CLAUDE.md` using the template at `~/agent-setup/prompts/new-project.md`
7. **Offer to set up git skills** — if no `.claude/skills/commit/SKILL.md` exists, ask:
   - Commit message format? (conventional commits / Jira prefix / free-form)
   - Branching strategy? (trunk-based / gitflow / feature branches)
   - PR requirements? (required reviewers, linked issue, test checklist)
   - Ticket system? (Jira project key, Linear team, none)
   Then scaffold `.claude/skills/commit/` using `~/agent-setup/prompts/commit-override-template.md` as the base.
8. **Don't assume** — if the stack is ambiguous, ask before proceeding

## Notes
- Linc Global projects (~/analytics, ~/prox2, ~/prox-ui, ~/internal-portal-backend, ~/internal-portal-ui, ~/linc-portal) are archived — do not treat as active
- AWS profile `linc_eks` is defunct
- .zshrc is not tracked in dotfiles (contains secrets)
