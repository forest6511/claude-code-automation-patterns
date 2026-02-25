#!/bin/bash
# multi-step-ci.sh

# Step 1: 解析してセッション ID を取得
SESSION_ID=$(claude -p \
  "リポジトリ全体を解析し、依存関係とアーキテクチャを把握してください。" \
  --allowedTools "Read,Grep,Glob" \
  --output-format json | jq -r '.session_id')

# Step 2: 解析結果を引き継いで問題を特定
claude -p "解析したコードから改善が必要な箇所を優先度順に3つ挙げてください。" \
  --resume "$SESSION_ID" \
  --output-format json | jq -r '.result'

# Step 3: 最優先の問題を修正
claude -p "優先度1番の問題を修正し、テストを実行してください。" \
  --resume "$SESSION_ID" \
  --allowedTools "Read,Edit,Bash(npm test *)" \
  --max-turns 10
