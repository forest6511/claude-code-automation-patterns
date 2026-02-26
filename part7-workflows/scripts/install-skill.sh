#!/usr/bin/env bash
# 使い方: ./install-skill.sh <スキル名> <GitHubリポジトリ URL>
# 例: ./install-skill.sh code-review \
#       https://github.com/example/skills

set -euo pipefail
SKILL_NAME=${1:?"スキル名が必要です"}
REPO_URL=${2:?"リポジトリ URL が必要です"}
SCOPE=${3:-"project"}   # project or personal

if [ "$SCOPE" = "personal" ]; then
  DEST="${HOME}/.claude/skills/${SKILL_NAME}"
else
  DEST=".claude/skills/${SKILL_NAME}"
fi

if [ -d "$DEST" ]; then
  echo "ERROR: $DEST は既に存在します" >&2
  exit 1
fi

TMP_CLONE_DIR=$(mktemp -d)
trap "rm -rf $TMP_CLONE_DIR" EXIT

git clone --quiet --depth=1 "$REPO_URL" "$TMP_CLONE_DIR/repo"

if [ ! -d "$TMP_CLONE_DIR/repo/skills/$SKILL_NAME" ]; then
  echo "ERROR: スキル '$SKILL_NAME' が見つかりません" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"
cp -r "$TMP_CLONE_DIR/repo/skills/$SKILL_NAME" "$DEST"
echo "インストール完了: $DEST"
