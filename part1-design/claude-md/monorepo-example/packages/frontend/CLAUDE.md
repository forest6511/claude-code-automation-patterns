# Frontend Package

## フレームワーク

- Next.js 15 / React 19
- Tailwind CSS（他の CSS ライブラリは使わない）

## コンポーネント規則

- Server Components をデフォルトとする
- Client Components は `"use client"` を先頭に書く
- Props の型は `interface` で定義（`type` 不可）

## テスト

- ユニットテスト: Vitest
- E2E テスト: Playwright
