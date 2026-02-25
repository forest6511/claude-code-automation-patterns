#!/bin/bash
# block-dangerous.sh
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# 危険なコマンドパターンを検出
PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "git push --force"
  "git push -f"
  "chmod -R 777"
  "DROP TABLE"
  "> /dev/sda"
)

for pattern in "${PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qF "$pattern"; then
    echo "ブロック: '$pattern' は実行禁止コマンドです" >&2
    exit 2
  fi
done

exit 0
