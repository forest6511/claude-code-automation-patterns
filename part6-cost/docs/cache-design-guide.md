# プロンプトキャッシュ設計ガイド

## キャッシュヒット率を高めるための CLAUDE.md 設計方針

```markdown
<!-- CLAUDE.md での安定化パターン -->

## 安定した情報（先頭に置く）
- プロジェクト概要
- 技術スタック
- コーディング規約
- 固定の参照ドキュメント

## 変動する情報（末尾に置く）
- 現在の作業状況
- 最近の変更点
- TODO リスト
```

CLAUDE.md の先頭部分を変更しないことで、その部分のキャッシュが維持されます。
頻繁に変わる情報を後半に配置し、先頭の安定した部分のキャッシュを長く保持してください。

## デバッグ用: プロンプトキャッシュを無効化

```bash
# 全モデルでキャッシュを無効化
export DISABLE_PROMPT_CACHING=1

# モデル別に無効化
export DISABLE_PROMPT_CACHING_HAIKU=1
export DISABLE_PROMPT_CACHING_SONNET=1
export DISABLE_PROMPT_CACHING_OPUS=1
```

## セッション継続でキャッシュを活用

```bash
# 同じプロジェクトディレクトリから再接続
claude --continue  # 前回の会話を継続（キャッシュを最大活用）
```

## 注意事項

- キャッシュは会話の内容そのものはキャッシュしません
- コンテキストとして送られる「固定部分」（CLAUDE.md、システムプロンプト）がキャッシュの対象です
- 会話履歴は毎回変化するためキャッシュされません
- DISABLE_PROMPT_CACHING は 1 のみ有効です
