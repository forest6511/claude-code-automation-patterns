#!/bin/bash
# restore-context.sh
# 圧縮後のセッション用コンテキスト注入

BRANCH=$(git branch --show-current 2>/dev/null)
RECENT=$(git log --oneline -3 2>/dev/null)
UNCOMMITTED=$(git status --short 2>/dev/null | head -10)
SESSION_STATE=".claude/session-state.md"

echo "## 復元されたセッションコンテキスト"
echo ""
echo "### ブランチ: ${BRANCH}"
echo ""
echo "### 直近のコミット"
echo "$RECENT"
echo ""

if [ -n "$UNCOMMITTED" ]; then
  echo "### 未コミットの変更"
  echo "$UNCOMMITTED"
  echo ""
fi

# 前回セッションの保存状態があれば追記
if [ -f "$SESSION_STATE" ]; then
  echo "### 前回セッションの状態"
  cat "$SESSION_STATE"
fi
