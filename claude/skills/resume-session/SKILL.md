---
name: resume-session
description: Restore context from .claude/session.md at the start of a new session
user-invocable: true
disable-model-invocation: true
allowed-tools:
  - Read
  - Bash(git branch:*)
  - Bash(git status:*)
---

## Your Task

Restore context from a previously saved session.

## Steps

1. Attempt to read `.claude/session.md`
   - If it does not exist: tell the user "No session file found at .claude/session.md — nothing to resume." and stop
2. Read the file and present a concise recap:
   - **Goal** of the previous session
   - **What was done** (brief, not exhaustive)
   - **Current state** (branch, PRs, uncommitted changes)
   - **Next steps** — list them clearly so the user knows exactly where to pick up
3. Run `git branch --show-current` and `git status --short` to verify the current repo state matches what was saved — flag any discrepancies
4. End with: "Ready to continue. What would you like to work on first?"
