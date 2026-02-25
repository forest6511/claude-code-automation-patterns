# [プロジェクト名]

## ビルドコマンド
- 開発: `npm run dev`
- ビルド: `npm run build`
- テスト: `npm run test`
- 型チェック: `npm run typecheck`
- Lint: `npm run lint`

## アーキテクチャ
- フレームワーク: Next.js 15 (App Router)
- スタイリング: Tailwind CSS
- 状態管理: Zustand（グローバル）/ useState（ローカル）
- API: tRPC または REST（`src/app/api/` 以下）

## コンポーネント規則
- Server Components がデフォルト
- Client Components は `"use client"` を先頭に書く
- Props の型は `interface` で定義
- コンポーネント名はパスカルケース

## インポート規則
- ES modules のみ（`require()` 不可）
- 絶対インポートは `@/` プレフィックス（例: `@/components/Button`）

## テスト方針
- 単体テスト: Vitest
- E2E テスト: Playwright
- テストファイル: `*.test.ts` または `*.spec.ts`
