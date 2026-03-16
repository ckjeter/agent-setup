#!/bin/sh
# agent-setup/install.sh
# Run once on a new machine to wire up Claude global config.

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

link() {
  src="$1"
  dst="$2"
  if [ -L "$dst" ]; then
    echo "already linked: $dst"
  elif [ -e "$dst" ]; then
    echo "file exists (skipping): $dst — remove manually if you want to replace it"
  else
    ln -s "$src" "$dst"
    echo "linked: $dst -> $src"
  fi
}

link "$DOTFILES_DIR/claude/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
link "$DOTFILES_DIR/claude/skills" "$CLAUDE_DIR/skills"
link "$DOTFILES_DIR/claude/commands" "$CLAUDE_DIR/commands"
