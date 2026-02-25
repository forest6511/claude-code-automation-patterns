---
name: deploy
description: >
  デプロイスキル。
  1. npm test を実行してテストがすべて通ることを確認
  2. npm run build でビルド
  3. git push origin main でデプロイ
  4. https://app.example.com でデプロイ完了を確認
  5. Slack の #deployments チャンネルに通知
---

本番環境へのデプロイを実行します。
