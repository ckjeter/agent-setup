---
name: save-session
description: Summarize the current session to .claude/session.md for later resumption
user-invocable: true
disable-model-invocation: true
allowed-tools:
  - Write
  - Bash(date:*)
  - Bash(git branch:*)
  - Bash(git status:*)
  - Bash(gh pr view:*)
---

## Your Task

Summarize the current conversation session and write it to `.claude/session.md`
in the current working directory.

## Output Format

Write exactly this structure to `.claude/session.md`:

```markdown
# Session — <date>

## Goal
<1–2 sentences: what the user was trying to accomplish this session>

## What Was Done
<bullet list of concrete actions taken, decisions made, files changed>

## Current State
- **Branch:** <current branch from git>
- **Open PRs:** <from gh pr view, or "none">
- **Uncommitted changes:** <yes/no — summarize what's staged/unstaged>

## Next Steps
<ordered list of what remains to be done, as specific as possible>

## Key Decisions
<any architectural or design decisions made that affect future work — omit section if none>
```

## Steps

1. Run `date` to get today's date
2. Run `git branch --show-current` to get the current branch
3. Run `git status --short` to summarize uncommitted state
4. Run `gh pr view --json number,title,url 2>/dev/null` to check for open PRs (skip if gh not available)
5. Synthesize the session from conversation history into the format above
6. Write to `.claude/session.md` (overwrite if it exists)
7. Confirm: "Session saved to .claude/session.md"
