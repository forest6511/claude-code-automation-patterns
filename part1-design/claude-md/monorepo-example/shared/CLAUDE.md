# Shared Library

## 役割

このパッケージは frontend / backend 双方から参照される共有ユーティリティです。

## 設計方針

- フレームワーク依存のコードを含めない（Node.js / ブラウザ両対応）
- 外部依存は最小限に抑える
- すべてのエクスポートに JSDoc コメントを付ける

## ビルド

- ビルド: `npm run build`（ESM + CJS デュアル出力）
- 型定義: `npm run types`
