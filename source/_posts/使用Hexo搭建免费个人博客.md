---
title: 使用Hexo搭建免费个人博客
date: 2020-11-19 13:50:47
tags: Hexo
photos:
- https://d33wubrfki0l68.cloudfront.net/6657ba50e702d84afb32fe846bed54fba1a77add/827ae/logo.svg
---

Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 Markdown（或其他渲染引擎）解析文章，在很短的时间内，即可利用靓丽的主题生成静态网页。
本文利用Hexo + Github，详细介绍如何在没有自己服务器的情况下轻松搭建个人轻博客。

<!-- more -->

## 准备工作 
- Node.js
- Git
- Github账号
- 域名

## Hexo [环境搭建](https://hexo.io/zh-cn/docs/setup)

### 安装
```bash
$ npm install -g hexo-cli
```
### 生成博客文件
```bash
$ hexo init <folder>
$ cd <folder>
$ npm install
```

```bash
$ hexo server
```
访问网址为：`http://localhost:4000/`， 此时已经在你本地运行起一个博客系统了，接下来创建git仓库

## Github仓库

首先，你需要新建一个Github项目。如果你希望你的站点能通过`<你的GitHub用户名>.github.io`域名访问，你的项目应该直接命名为`<你的GitHub用户名>.github.io`。

创建仓库之后，开始准备部署博客。

## 部署博客

1. 首先安装 `hexo-deployer-git`，这个是一个依赖包，后面会用到

```bash
$ npm install hexo-deployer-git --save
```


2. 在 `_config.yml` 添加如下配置：

```bash
deploy:
  type: git
  repo: https://github.com/<yourname>/<project>
  branch: gh-pages
```

3. 部署项目

```bash
$ hexo generate
$ hexo deploy
```

4. 查看 `yourname.github.io` 上的网页，检查是否部署成功。

> 如果想了解`Travis CI`部署，可以移步[将 Hexo 部署到 GitHub Pages](https://hexo.io/zh-cn/docs/github-pages)

## 修改模板

此时如果前面运行都正常已经可以使用 `yourname.github.io` 访问你的博客了，但是你会发现默认的模板特别丑。没关系，社区提供了大量免费的模板可供你使用。[Hexo主题](https://hexo.io/themes/)

下面用 `hexo-theme-yilia` 模板举例

```bash
# 进入主题文件夹
$ cd themes
# 下载主题
$ git clone https://github.com/litten/hexo-theme-yilia
```
修改`_config.yml`中的`theme`为`hexo-theme-yilia`

每个模板都会有自己的一套配置，可以认真阅读自己喜欢模板的文档做修改，做完这一切，重新发布一次即可

```bash
$ hexo clean
$ hexo generate
$ hexo deploy
```

## 自定义域名

此时访问网站用的是 `yourname.github.io`，你可能对这个链接不太满意，想用自己的域名，往下看。

因为我的域名是阿里云注册的，咱们还是以阿里云为例：
1. 首先解析你的域名。[阿里云](https://homenew.console.aliyun.com/)
可以参考我的解析 
> `@` 指向到`yourname.github.io`的 ip 
> `www` 选择 `CNAME` 执行你的`yourname.github.io`

![解析截图](./20201119150858.jpg)

2. 返回Github，配置你的域名
进入你的项目`yourname.github.io`，然后`Settings`，把你的域名填写到`Custom domain`
下面是我自己的配置
![Github配置](./20201119151723.jpg)

3. 接下来，你就能用你的域名访问博客了。

## 日常部署

> 需要注意前面你的部署分支 `gh-pages` 是你的项目打包后的代码，跟你本地的代码是不一样的。不要在`gh-pages` 分支pull代码，切记。
> 如果你嫌每次都需要执行 `hexo clean` `hexo generate` `hexo deploy` 麻烦，可以写一个shell脚本，每次只需要 `sh deploy.sh`，我现在就是这么做的。
> 每次执行完`hexo clean`就会把 `CNAME` 文件清除掉。这个文件你可以写到 `source` 文件夹里面，这样每次打包都会把这个文件重新复制到`public`下了。


## 尾
本人也是刚接触Hexo，还正在熟悉。写的有什么错误的地方，欢迎指正，多谢🙏。

