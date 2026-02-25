#!/bin/bash
# notify.sh
INPUT=$(cat)
TYPE=$(echo "$INPUT" | jq -r '.notification_type // "unknown"')
SLACK_WEBHOOK="${SLACK_WEBHOOK_URL}"

# macOS ネイティブ通知
osascript -e \
  'display notification "Claude が入力を待っています" with title "Claude Code"' \
  2>/dev/null

# Slack 通知（環境変数が設定されている場合のみ）
if [ -n "$SLACK_WEBHOOK" ]; then
  curl -s -X POST "$SLACK_WEBHOOK" \
    -H 'Content-type: application/json' \
    --data "{\"text\": \"Claude Code: $TYPE - 入力待ち\"}" \
    > /dev/null
fi

exit 0
