---
name: dev-workflow
description: 7ステージ開発ワークフローを開始します。
  新機能・バグ修正・リファクタリングの起点として使用してください。
disable-model-invocation: true
---

# 7ステージ開発ワークフロー

**タスク**: $ARGUMENTS

## Step 1: Brainstorming
- タスクを1-3文で定義してください
- 完了条件を明示してください
- スコープ外の内容を列挙してください

## Step 2: Worktree
- `git worktree add ../work-$ARGUMENTS-$(date +%s) -b feature/$ARGUMENTS`
  （タスク名にスペースは使えません。例: `user-auth` は OK、`user auth` は NG）
- 作業はこの worktree で行います

## Step 3: Plan（/confidence-check を実行）
- 実装前チェックリストを完了してください（T59 参照）
- 90% 以上で次のステップへ進みます

## Step 4: Subagent
- 調査・探索タスクを Explore エージェントに委譲してください

## Step 5: TDD
- テストを先に書いてから実装してください

## Step 6: Review
- `/review` を実行し、指摘事項をすべて解消してください

## Step 7: Completion
- コミット・worktree 削除・`/session-end` を実行してください
