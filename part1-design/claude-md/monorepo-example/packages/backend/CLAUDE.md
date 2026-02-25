# Backend Package

## フレームワーク

- Node.js 22 / Express 5
- TypeScript 5（strict モード必須）

## API 規則

- REST API: `/api/v1/` プレフィックス
- レスポンス形式: `{ data, error, meta }` 統一
- 認証: Bearer トークン（JWT）

## データベース

- ORM: Prisma
- マイグレーション: `prisma migrate dev` でのみ実行
- 直接 SQL 操作禁止
