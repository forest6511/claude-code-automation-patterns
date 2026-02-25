# [プロジェクト名]

## ビルドコマンド
- ビルド: `go build ./...`
- テスト: `go test ./...`
- Lint: `golangci-lint run`
- フォーマット: `gofmt -w .`

## コードスタイル
- エラーハンドリング: `errors.New()` または `fmt.Errorf()` を使う
- エラーラップ: `fmt.Errorf("context: %w", err)` の形式
- ログ: `log/slog` パッケージを使う（`fmt.Println` 不可）
- テスト: テーブル駆動テストを基本とする

## アーキテクチャ
- ハンドラー: `internal/handler/`
- ビジネスロジック: `internal/service/`
- DB アクセス: `internal/repository/`
- 型定義: `internal/model/` または `internal/domain/`

## 禁止事項
- グローバル変数の使用禁止（テストが困難になる）
- `init()` 関数の副作用禁止
- パニックを業務ロジックのフロー制御に使わない
