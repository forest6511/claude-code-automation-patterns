# [プロジェクト名]

## ビルドコマンド
- 開発サーバー: `python manage.py runserver`
- テスト: `python manage.py test`
- マイグレーション確認: `python manage.py showmigrations`
- マイグレーション適用: `python manage.py migrate`
- 静的ファイル収集: `python manage.py collectstatic`

## Migration 規則
- 手動でマイグレーションファイルを編集しない
- `makemigrations` は開発環境でのみ実行
- `squashmigrations` を使う際は事前にチームレビュー

## モデル規則
- 作成日時: `created_at = models.DateTimeField(auto_now_add=True)`
- 更新日時: `updated_at = models.DateTimeField(auto_now=True)`
- 論理削除: `is_deleted` フラグを使う（物理削除不可）

## テスト方針
- `TestCase` ではなく `TransactionTestCase` は必要な場合のみ
- フィクスチャは `factory_boy` を使う
- 外部 API はすべてモックする
