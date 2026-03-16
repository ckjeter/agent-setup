# Claude Code Best Practices

## 1. CLAUDE.md — Your System Prompt

This is the most important setup. Claude reads `CLAUDE.md` automatically at the start of every session.

### Two levels

| Level | Path | Purpose |
|-------|------|---------|
| Global | `~/.claude/CLAUDE.md` | Your preferences, persona, tools you use everywhere |
| Project | `<project>/CLAUDE.md` | Tech stack, conventions, commands for that project |

### Example: `~/.claude/CLAUDE.md`

```markdown
# Global Preferences
- Editor: neovim
- Shell: zsh with oh-my-zsh + starship
- Use Python via pyenv, Node via nvm, Java via jenv
- Prefer concise responses, no trailing summaries
- AWS profiles: linc_eks for EKS work
```

### Example: `<project>/CLAUDE.md`

```markdown
# Project: my-app

## Stack
- Backend: Python (pyenv), FastAPI
- Frontend: React + pnpm

## Commands
- Run: `pnpm dev`
- Test: `pytest`

## Conventions
- snake_case for Python, camelCase for TypeScript
```

---

## 2. Multiple Tmux Windows / Parallel Claude Sessions

Your setup (`C-a` prefix, tmux-pain-control, tmux-sessionist) is already solid. The key practice is **one Claude instance per project or task** — each in its own tmux window or pane. They share no state, so you can parallelize freely.

```
window 1: cd ~/project-a && claude   # feature work
window 2: cd ~/project-b && claude   # separate bugfix
window 3: cd ~/project-a && claude   # code review / Q&A
```

### Name your tmux sessions by project

```bash
tmux new-session -s project-a
tmux new-session -s project-b
```

Then use `C-a g` (tmux-sessionist) to jump between them cleanly.

---

## 3. Permission Modes

Claude prompts you before destructive or risky actions by default. You can control this:

| Mode | When to use |
|------|-------------|
| Default (prompt) | Day-to-day work |
| `--dangerously-skip-permissions` | Long autonomous tasks in an isolated/throwaway branch |

---

## 4. Settings (`~/.claude/settings.json`)

Currently empty. Useful options:

```json
{
  "autoUpdates": true
}
```

You can also configure per-tool auto-approval here to skip prompts for safe tools like `Read`, `Grep`, and `Glob`.

---

## 5. Workflow Tips for Your Stack

- **Open Claude in the project directory** — it picks up context from `git log`, `CLAUDE.md`, and file structure automatically
- **Use `/clear`** to reset context mid-session when switching tasks
- **Use `/memory`** to see what Claude has remembered about you across sessions
- **Reference files directly** in your prompts: *"look at `src/api/routes.py` and add error handling"*

---

## 6. Useful Aliases for `.zshrc`

```bash
# Open claude in current dir (short alias)
alias cl="claude"

# Open new tmux window with claude in a named project folder
function cproject() {
  tmux new-window -n "$1" "cd ~/$1 && claude"
}
```

---

## 7. Slash Commands Reference

| Command | What it does |
|---------|-------------|
| `/clear` | Reset conversation context |
| `/memory` | View persisted memories about you |
| `/help` | Show all available commands |
| `/commit` | Smart git commit with generated message |
| `/review-pr` | Review a pull request |
| `/fast` | Toggle fast mode (faster output) |

---

## Next Steps

1. Create `~/.claude/CLAUDE.md` with your global preferences
2. Add a `CLAUDE.md` to each active project
3. Add the aliases above to your `.zshrc`
4. Name your tmux sessions by project for easy navigation
