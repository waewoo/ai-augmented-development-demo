#!/usr/bin/env bash
set -euo pipefail

target="${1:-../ai-augmented-development-demo-start}"

if [ -e "$target" ]; then
  printf 'Refus : le chemin existe déjà : %s\n' "$target" >&2
  exit 1
fi

git worktree add --detach "$target" demo/start
printf 'Worktree de démonstration préparé dans %s\n' "$target"
