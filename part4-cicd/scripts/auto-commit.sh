#!/bin/bash
# auto-commit.sh
set -e

if ! git diff --cached --quiet; then
  echo "ステージ済み変更を検出。コミットメッセージ生成中..."
  claude -p "git status と git diff --cached を確認し、
    適切な Conventional Commits メッセージでコミットしてください。" \
    --allowedTools \
      "Bash(git status *),Bash(git diff *),Bash(git commit *)" \
    --max-turns 3
else
  echo "ステージ済み変更なし"
fi
