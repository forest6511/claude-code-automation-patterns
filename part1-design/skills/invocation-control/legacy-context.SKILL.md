---
name: legacy-system-context
description: レガシーシステムの設計背景と制約事項。このシステムに関連する作業時に使用
user-invocable: false
---

# レガシー決済システムの背景

このシステムは2008年に構築されました。以下の制約があります:
- セッション管理はファイルベース（DB 不可）
- 文字コードは Shift-JIS
- PHP 5.6 互換が必要（モダン PHP 機能は使用不可）
- 外部 API との連携は XML-RPC のみ

## 重要な注意事項

- `payment_processor.php` は変更禁止（PCI DSS 準拠のため監査対象）
- `session/` ディレクトリ以下は直接書き込み不可
- ログは `logs/legacy/` に書き出すこと

## よくある問題

- 文字化け: すべての入出力で `mb_convert_encoding()` を通すこと
- セッション切れ: 30分のタイムアウトが設定されている
