# 提交Git
git add .
git commit -m "up"
git push origin main:master

# 部署脚本
hexo clean
hexo generate
hexo deploy

export HEXO_ALGOLIA_INDEXING_KEY=059bddc683e48371246625af624fb5ac
hexo algolia
