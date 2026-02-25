---
name: pr-summary
description: Pull Request の内容を要約する
context: fork
agent: Explore
allowed-tools: Bash(gh *)
---

## Pull Request の情報
- PR 差分: !`gh pr diff`
- PR コメント: !`gh pr view --comments`
- 変更ファイル一覧: !`gh pr diff --name-only`
- PR 概要: !`gh pr view`

## タスク

上記の Pull Request の内容を以下の観点で要約してください:

1. 変更の目的と背景
2. 主な変更内容（ファイル別）
3. レビューで注意すべき点
4. 潜在的なリスク

---

# branch-analysis スキルのサンプル

以下は動的コンテキスト注入の別の例です（ブランチ分析用）:

```yaml
name: branch-analysis
description: 現在のブランチの変更を分析する
```

## 現在のブランチ情報（実行時に注入される）

- ブランチ: !`git branch --show-current`
- ベースブランチからの差分: !`git diff origin/main --stat`
- コミット履歴: !`git log origin/main..HEAD --oneline`
- 未コミット変更: !`git diff --stat`
