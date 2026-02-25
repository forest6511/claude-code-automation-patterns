#!/bin/bash
# parallel-review.sh

# セキュリティ・パフォーマンス・テストを並列でレビュー
claude -w review-security -p "セキュリティ観点でレビューしてください" \
  --allowedTools "Read,Grep,Glob" &
PID1=$!

claude -w review-perf -p "パフォーマンス問題を洗い出してください" \
  --allowedTools "Read,Grep,Glob" &
PID2=$!

claude -w review-tests -p "テストカバレッジの不足を特定してください" \
  --allowedTools "Read,Grep,Glob" &
PID3=$!

wait $PID1 $PID2 $PID3
echo "並列レビュー完了"
