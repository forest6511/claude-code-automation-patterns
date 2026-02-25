#!/bin/bash
# basic-ci.sh - claude -p の基本的な使用パターン

# 直接プロンプトを渡す
claude -p "プロンプトテキスト"

# ファイル内容をパイプで渡す
cat build-error.txt | \
  claude -p "このビルドエラーの根本原因を1文で説明してください"

# CI/CD パイプラインでの基本パターン（GitHub Actions 相当）
# env:
#   ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
claude -p "src/ ディレクトリのコードを解析し、
  重大な問題があれば報告してください" \
  --allowedTools "Read,Grep,Glob" \
  --max-turns 5
