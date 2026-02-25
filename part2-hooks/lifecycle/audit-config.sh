#!/bin/bash
# audit-config.sh
INPUT=$(cat)
SOURCE=$(echo "$INPUT" | jq -r '.source')
FILE=$(echo "$INPUT" | jq -r '.file_path')
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# 監査ログに記録
echo "${DATE} | ${SOURCE} | ${FILE}" \
  >> ".claude/config-audit.log"

# プロジェクト設定ファイルへの外部変更をブロック
if [ "$SOURCE" = "project_settings" ]; then
  BASENAME=$(basename "$FILE")
  if [ "$BASENAME" = "settings.json" ]; then
    echo "設定ファイルの外部変更を検出: $FILE" >&2
    jq -n '{
      "decision": "block",
      "reason": "settings.json の外部変更を検出しました。変更内容を確認してください。"
    }'
    exit 0
  fi
fi

exit 0
