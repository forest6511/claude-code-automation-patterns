#!/bin/bash
# json-output-patterns.sh - --output-format json の使用パターン

# 応答テキストのみを抽出
claude -p "このプロジェクトの概要を説明してください" \
  --output-format json | jq -r '.result'

# セッション ID を変数に保存（後続ステップで使う）
SESSION=$(claude -p "コードをレビューしてください" \
  --output-format json | jq -r '.session_id')

# --json-schema で出力スキーマを強制する
claude -p "auth.py の関数名を抽出してください" \
  --output-format json \
  --json-schema '{
    "type": "object",
    "properties": {
      "functions": {
        "type": "array",
        "items": {"type": "string"}
      }
    },
    "required": ["functions"]
  }' | jq '.structured_output'

# stream-json でリアルタイム処理する
claude -p "大規模なリファクタリングを実行してください" \
  --output-format stream-json \
  --verbose \
  --include-partial-messages | \
  jq -rj 'select(.type == "stream_event" and
    .event.delta.type? == "text_delta") |
    .event.delta.text'
