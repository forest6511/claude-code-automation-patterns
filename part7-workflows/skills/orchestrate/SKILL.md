---
name: orchestrate
description: タスク種別（feature/bugfix/refactor/security）に応じた
  ワークフローを選択して実行します。
  引数: feature|bugfix|refactor|security [タスク名]
disable-model-invocation: true
argument-hint: "[feature|bugfix|refactor|security] [タスク名]"
---

# Orchestrate: $ARGUMENTS

以下のワークフローを選択して実行してください。

## feature（機能追加）
1. 要件・受け入れ条件を定義
2. 実装前チェック（/confidence-check）
3. 設計ドキュメントを作成（`docs/design/`）
4. TDD で実装
5. ドキュメント更新

## bugfix（バグ修正）
1. 再現手順を確認・記録
2. 根本原因を特定（Grep + Read で調査）
3. 修正を最小範囲で実施
4. 再現テストを追加
5. 回帰テストを実行

## refactor（リファクタリング）
1. 変更前にテストカバレッジを確認
2. Strangler Fig パターンで段階的移行
3. 各ステップで既存テストが通ることを確認
4. パフォーマンスを計測して改善を数値で示す

## security（セキュリティ対応）
1. 影響範囲を read-only で調査（Write 禁止）
2. CVE・脆弱性パターンを照合
3. 修正を隔離 worktree で実施
4. セキュリティレビューエージェントで検証
5. リリースノートに CVE 番号を記載

## custom
引数に定義がない場合は、タスクを説明してください。
適切なワークフローを提案します。
