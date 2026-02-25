---
name: security-audit
description: セキュリティ監査を実行する。コードの脆弱性をチェックする際に使用
context: fork
agent: Explore
allowed-tools: Read, Grep, Glob
---

# セキュリティ監査

セキュリティ監査を実行します:

1. `src/` ディレクトリ以下のすべての TypeScript ファイルを Grep で検索
2. 以下のパターンを検出:
   - SQL インジェクション（文字列連結クエリ）
   - XSS（innerHTML への直接代入）
   - ハードコードされた認証情報（password/secret/key = "..."）
   - eval() の使用
   - 危険な正規表現（ReDoS の可能性）
3. 発見した問題をファイルパスと行番号付きで報告

## 出力形式

各問題について以下を報告してください:
- ファイルパス:行番号
- 問題の種類（SQLi / XSS / ハードコード資格情報 / その他）
- 重要度（Critical / High / Medium / Low）
- 修正の方向性（1〜2文で）
