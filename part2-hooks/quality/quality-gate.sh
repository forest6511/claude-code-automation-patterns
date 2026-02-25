#!/bin/bash
# quality-gate.sh
INPUT=$(cat)
# 無限ループ防止: stop_hook が既に動作中なら終了
STOP_HOOK_ACTIVE=$(echo "$INPUT" | jq -r '.stop_hook_active')
if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
  exit 0
fi
ISSUES=()
# 未コミット変更チェック
UNCOMMITTED=$(git diff --name-only 2>/dev/null)
STAGED=$(git diff --name-only --cached 2>/dev/null)
if [ -n "$UNCOMMITTED" ] || [ -n "$STAGED" ]; then
  ISSUES+=("未コミットの変更があります")
fi
# TODO コメントの残数チェック
TODO_COUNT=$(grep -r "<!-- TODO -->" chapters/ 2>/dev/null | wc -l | tr -d ' ')
if [ "$TODO_COUNT" -gt 0 ]; then
  ISSUES+=("TODO マーカーが ${TODO_COUNT} 件残っています")
fi
if [ ${#ISSUES[@]} -gt 0 ]; then
  jq -n \
    --arg reason "$(printf '%s\n' "${ISSUES[@]}" | \
      awk '{print NR". "$0}')" \
    '{"decision": "block", "reason": $reason}'
  exit 0
fi
exit 0
