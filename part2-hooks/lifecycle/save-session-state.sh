#!/bin/bash
# save-session-state.sh
INPUT=$(cat)
TRIGGER=$(echo "$INPUT" | jq -r '.trigger // "n/a"')
DATE=$(date '+%Y-%m-%d %H:%M')
STATE_FILE=".claude/session-state.md"

cat > "$STATE_FILE" << EOF
# セッション状態（${DATE} 保存 / trigger: ${TRIGGER}）

## ブランチ
$(git branch --show-current 2>/dev/null)

## 未コミット変更
$(git diff --name-only 2>/dev/null)
$(git diff --name-only --cached 2>/dev/null | \
  sed 's/^/[staged] /')

## 直近コミット（5件）
$(git log --oneline -5 2>/dev/null)

## 変更サマリー
$(git diff --stat 2>/dev/null | tail -5)
EOF

echo "セッション状態を保存しました: ${STATE_FILE}" >&2
exit 0
