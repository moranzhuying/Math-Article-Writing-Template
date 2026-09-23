#!/usr/bin/env bash
# 一键提交脚本：把当前项目的改动提交并推送到 GitHub
# 用法：bash commit.sh "提交说明"（不写说明则默认"更新文章"）

set -e
cd "$(dirname "$0")"

if [ -z "$(git status --porcelain)" ]; then
  echo "没有改动，无需提交。"
  exit 0
fi

MSG="${1:-更新文章}"

echo "==> 暂存改动"
git add -A

echo "==> 提交：$MSG"
git commit -m "$MSG"

echo "==> 推送到 GitHub"
git push

echo "完成，已同步到 GitHub。"
