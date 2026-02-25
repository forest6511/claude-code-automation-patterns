# Monorepo: my-project

## 共通ルール

- コミットメッセージ: Conventional Commits 形式
- ブランチ命名: `feat/`, `fix/`, `chore/` プレフィックス
- PR は1機能1PR

## ビルドコマンド

- 全パッケージビルド: `npm run build --workspaces`
- 特定パッケージ: `cd packages/[name] && npm run build`

## 禁止事項

- `packages/` 直下へのファイル作成禁止（必ずパッケージ内に作成）
- ルートの `package.json` への直接依存追加禁止
