# Compact Instructions サンプル

CLAUDE.md の末尾に追加するコンテキスト圧縮指示のサンプルです。

## Compact Instructions

コンテキスト圧縮時には以下を必ず保持すること:

- 変更したファイルの完全なパス一覧
- 実行したビルドコマンドとその成否
- 発見したバグと修正方針
- このセッションで決定した設計上の判断
- 未完了のタスク（何が残っているか）

---

# PreCompact Hook との組み合わせ

PreCompact Hook を設定することで、圧縮前にファイルへ状態を保存できます。

```json
{
  "hooks": {
    "PreCompact": [
      {
        "matcher": "auto",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/save-session-state.sh"
          }
        ]
      }
    ]
  }
}
```

## セッション状態保存スクリプト

```bash
#!/bin/bash
SESSION_FILE=".claude/session-state.md"
DATE=$(date '+%Y-%m-%d %H:%M')

cat > "$SESSION_FILE" << EOF
# セッション状態（${DATE} に自動保存）

## 変更ファイル
$(git diff --name-only)
$(git diff --name-only --cached)

## 未コミット変更サマリー
$(git diff --stat)

## 直近のコミット
$(git log --oneline -5)
EOF

echo "セッション状態を ${SESSION_FILE} に保存しました"
```
