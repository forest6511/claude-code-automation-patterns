# 組み込み Sub-agent リファレンス

Claude Code に最初から組み込まれている Sub-agent の一覧です。

## 組み込み Sub-agent 一覧

| Sub-agent | モデル | ツール | 用途 |
|-----------|--------|--------|------|
| Explore | Haiku | 読み取り専用 | コードベース探索・検索 |
| Plan | 継承 | 読み取り専用 | Plan モード時のリサーチ |
| General-purpose | 継承 | 全ツール | 複雑な複数ステップタスク |
| Bash | 継承 | Bash のみ | ターミナルコマンドの独立実行 |
| statusline-setup | Sonnet | 読み書き | /statusline 設定時 |
| Claude Code Guide | Haiku | 読み取り | Claude Code 機能の質問応答 |

## Explore Sub-agent の thoroughness レベル

| レベル | 用途 |
|--------|------|
| quick | 特定ファイルの検索、ピンポイントの確認 |
| medium | バランスの取れた探索 |
| very thorough | コードベース全体の網羅的分析 |

## 特定 Sub-agent の無効化

```json
{
  "permissions": {
    "deny": [
      "Task(Explore)",
      "Task(general-purpose)"
    ]
  }
}
```

CLI フラグでも指定できます。

```bash
claude --disallowedTools "Task(Explore)"
```

## /agents コマンドで確認する

```bash
# インタラクティブメニュー
/agents

# CLI からの一覧表示
claude agents
```

## 注意事項

- Explore と Plan は読み取り専用ツールのみが有効
- Sub-agent は他の Sub-agent を生成できない（ネスト不可）
- ネストを回避するには Skills を使うか、メイン会話からチェーン実行する
