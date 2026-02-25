---
paths:
  - "src/api/**/*.ts"
---

# API 開発ルール

- すべてのエンドポイントに入力バリデーションを含める
- エラーレスポンスは `ApiError` 型を使う
- OpenAPI コメントを必ず追加する

---

# コーディング規約（全体）

## インポート規則
- ES modules のみ（`require()` 不可）
- 非同期: `async/await` を使う（コールバック不可）

## アーキテクチャ
- API レスポンスは必ず `src/types/api.ts` の型を使う
- DB アクセスは `src/repositories/` 経由のみ

## 命名規則
- ファイル名: kebab-case
- クラス名: PascalCase
- 関数名: camelCase
- 定数: UPPER_SNAKE_CASE
