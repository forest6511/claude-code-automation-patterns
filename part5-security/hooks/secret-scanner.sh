#!/bin/bash
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""')

if [[ "$TOOL_NAME" == "Write" ]]; then
  CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // ""')
elif [[ "$TOOL_NAME" == "Edit" ]]; then
  CONTENT=$(echo "$INPUT" | jq -r '.tool_input.new_string // ""')
else
  exit 0
fi

declare -A PATTERNS
PATTERNS[AWS]="AKIA[0-9A-Z]{16}"
PATTERNS[GITHUB]="gh[ps]_[A-Za-z0-9]{36}"
PATTERNS[ANTHROPIC]="sk-ant-[A-Za-z0-9\-]{95}"
PATTERNS[OPENAI]="sk-[A-Za-z0-9]{48}"
PATTERNS[GOOGLE]="AIza[0-9A-Za-z\-_]{35}"
PATTERNS[STRIPE]="(sk|pk)_(test|live)_[A-Za-z0-9]{24}"
PATTERNS[PRIVKEY]="-----BEGIN (RSA|EC|DSA) PRIVATE KEY-----"

for NAME in "${!PATTERNS[@]}"; do
  if echo "$CONTENT" | grep -qE "${PATTERNS[$NAME]}"; then
    echo "{\"decision\":\"block\",\"reason\":\"シークレット検出: ${NAME}\"}" >&2
    exit 2
  fi
done
exit 0
