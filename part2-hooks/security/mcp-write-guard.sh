#!/bin/bash
# mcp-write-guard.sh
INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name')

# filesystem サーバーの書き込み・削除ツールだけ審査
if echo "$TOOL" | grep -qE "mcp__filesystem__(write|delete|move)"; then
  FILE=$(echo "$INPUT" | jq -r '.tool_input.path // .tool_input.source // empty')
  if echo "$FILE" | grep -qE "\.(env|pem|key)$"; then
    echo "機密ファイルへの MCP アクセスをブロック: $FILE" >&2
    jq -n '{
      hookSpecificOutput: {
        hookEventName: "PreToolUse",
        permissionDecision: "deny",
        permissionDecisionReason: "機密ファイルへのアクセスは禁止されています"
      }
    }'
    exit 0
  fi
fi

exit 0
