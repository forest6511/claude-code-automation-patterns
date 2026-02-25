---
name: deploy
description: >
  本番環境へデプロイする。/deploy コマンドで明示的に呼び出すこと。
  使うのは: 本番リリース時、緊急デプロイ時。
disable-model-invocation: true
---

# デプロイ手順

本番環境にデプロイします。

## 1. 事前確認

```bash
npm test
npm run build
git status
```

すべてのテストが通り、ビルドが成功し、未コミットの変更がないことを確認してください。

## 2. デプロイ実行

```bash
git push origin main
```

## 3. 動作確認

- https://app.example.com にアクセスして画面が表示されることを確認
- エラーログがないことを確認

## 4. Slack 通知

`#deployments` チャンネルにデプロイ完了を通知してください。
