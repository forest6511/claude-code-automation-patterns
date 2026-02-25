---
name: deploy
description: 本番環境にデプロイする
disable-model-invocation: true
---

# デプロイ手順

本番環境にデプロイします。以下の手順を実行してください。

## 事前チェック

```bash
npm test
npm run build
git status
```

## デプロイ

```bash
git push origin main
```

## 確認

- 本番 URL にアクセスして動作確認
- エラーログを確認
- Slack に完了通知
