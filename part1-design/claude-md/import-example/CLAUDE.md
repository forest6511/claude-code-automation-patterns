# CLAUDE.md（@path インポート構文の実装例）

<!--
ファイル構成（@ の参照先）:

import-example/
├── CLAUDE.md                  ← このファイル
├── README.md                  ← @README.md が参照
├── package.json               ← @package.json が参照
└── docs/
    ├── git-workflow.md        ← @docs/git-workflow.md が参照
    ├── api-conventions.md     ← @docs/api-conventions.md が参照
    └── testing-guidelines.md  ← @docs/testing-guidelines.md が参照
-->

プロジェクト概要は @README.md を参照してください。
利用可能なコマンドは @package.json に記載されています。

# 追加指示

- Git ワークフロー: @docs/git-workflow.md
- API 設計規約: @docs/api-conventions.md
- テスト方針: @docs/testing-guidelines.md

# 個人設定の参照

個人設定は CLAUDE.local.md に記述してください。
CLAUDE.local.md は .gitignore に自動追加されます。
