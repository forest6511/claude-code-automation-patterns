#!/bin/bash
# debug-hook.sh - 開発時のデバッグ用

INPUT=$(cat)

# 受け取ったデータをすべてログファイルに書き出す
echo "=== $(date) ===" >> /tmp/claude-hook-debug.log
echo "EVENT: $(echo "$INPUT" | jq -r '.hook_event_name')" \
  >> /tmp/claude-hook-debug.log
echo "INPUT:" >> /tmp/claude-hook-debug.log
echo "$INPUT" | jq '.' >> /tmp/claude-hook-debug.log
echo "" >> /tmp/claude-hook-debug.log

exit 0
