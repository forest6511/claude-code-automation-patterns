---
name: take-screenshot
description: "URLのスクリーンショットを撮影する。引数: URL"
---

# スクリーンショット撮影

引数: $ARGUMENTS

## 手順

以下のスクリプトを実行してスクリーンショットを撮影してください:

```bash
npx playwright screenshot --browser chromium \
  "$ARGUMENTS" \
  "screenshots/$(date +%Y%m%d-%H%M%S).png"
```

撮影後、ファイルパスを報告してください。
