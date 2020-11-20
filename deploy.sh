# 提交Git
git add .
git commit -m "up"
git push origin main:master

# 部署脚本
hexo clean
hexo generate
hexo deploy

export HEXO_ALGOLIA_INDEXING_KEY=5d669d3553911eb2f2752fb6526c7b82
hexo algolia
