---
title: 使用JS获取数组内非零非负最小值的下标
mypath: archive
date: 2021-01-20 18:13:55
keywords:
description:
tags: 刷题
---

直接上结果吧。

> 1. 新构建一个不包含负数与0的新数组
> 2. 拿到新数组内最小值
> 3. 查出最小值在原数组内的位置

<!-- more -->

```html
<script type="text/javascript">
    ;(function() {
        var arr = [8, 21, 0, -3, 32, 18, 9, 28, 17]
        function getIndex(arr) {
            let index = -1
            if (!arr.length) {
                return 
            }
            let min = Math.min(...arr.filter((item) => {
                return item > 0
            }))

            index = arr.indexOf(min)
            return index
        }
        getIndex(arr)
    })()
</script>
```
