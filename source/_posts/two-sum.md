---
title: 【LeetCode】Two Sum 两数之和
mypath: archive
date: 2020-11-24 15:00:43
keywords: 力扣, 力扣中国, leetcode, lingkou, leetcode中国, leetcode官网, 在线编程, lc, leetcode题解, leetcode答案, 面经, 算法, 面试, 求职, 招聘, 校招, 社招, 内推, 笔试, 面试题, 面试经验, 刷题, leetcode题库, 机器学习, 算法岗, 数据结构, 代码, 互联网, 编程, 开发, 程序员, 工程师, 白板面试, 码农, 程序猿, 领扣, 领扣网, 领扣网络, 领扣中国, BAT, BAT面试, OJ, online judge, coding interview, 技术面试, leetcode中文版, leetcodechina
description:
tags: 刷题
---

> 给定一个整数数组 `nums` 和一个目标值 `target`，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

### 实例
```javascript
给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
```
<!-- more -->
[LeetCode地址](https://leetcode-cn.com/problems/two-sum/)


### 我的提交
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    for(var j = 0; j <= nums.length; j++) {
        for(var i = 1; i <= nums.length; i++) {
            if ((nums[j] + nums[i]) === target && i != j) {
                return [j, i]
            }
        }
    }
};
```
![执行结果](leetcode_1.jpg)

解题思路：做两层遍历，然后判断判断目标是否符合。然后再排除两个元素是同一个值情况。

写的很糙，然后参考一下别人的提交

### indexOf写法

```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    for (var i = 0, len = nums.length; i < len; i++) {
        var d = target - nums[i];
        if (nums.indexOf(d) > -1 && i !== nums.indexOf(d)) {
            return [i, nums.indexOf(d)]
        }
    }
    return []
};
```
借助数组的 `indexOf` 方法，写法上做了优化， `indexOf` 内部实现其实也是循环检索，跟我的思路没差多少


### Object索引
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
const twoSum = function(nums, target) {
    let mapsObj = {}
    let resArr = []
    nums.forEach((item,index) => mapsObj[item] = index)

    for(let i = 0, len = nums.length; i <= len;i++) {
        let j = mapsObj[target - nums[i]]
        if(j && i != j) {
            resArr = [i, j]
            break;
        }
    }
    
    return resArr
};
```
借助一个对象，对象键名是检索值，对象键值是索引值。然后直接从对象中取出符合条件的数据，而不是遍历。这种思路我没想到


### Map 索引
```javascript
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
const twoSum = function(nums, target) {
    let mapsObj = new Map()
    let resArr = []
    nums.forEach((item,index) => mapsObj.set(item,index))

    for(let i = 0, len = nums.length; i <= len;i++) {
        let j = mapsObj.get(target - nums[i])
        if(j && i != j) {
            resArr = [i, j]
            break;
        }
    }
    
    return resArr
};
```
这种解法应该算是上面对象解法的优化版本。据官方文档上说，`Map`在查找速度跟性能上比`Object`要优秀很多。其实它俩最大的区别还是键名的类型，Map比Object支持更多的类型

### 补充

首先看一下Javascript对 `Map` 的定义
> Map 对象保存键值对，并且能够记住键的原始插入顺序。任何值(对象或者原始值) 都可以作为一个键或一个值。

然后对比 `Map` 与 `Object`

|         | Map    | Object |
| :-----  | :----: | :----: |
| 默认值   | Map 默认情况不包含任何键。只包含显式插入的键。 | 一个 Object 有一个原型, 原型链上的键名有可能和你自己在对象上的设置的键名产生冲突。 |
| 键的类型 | 一个 Map的键可以是任意值，包括函数、对象或任意基本类型。 | 一个Object 的键必须是一个 String 或是Symbol。 |
| 键的顺序 | Map 中的 key 是有序的。因此，当迭代的时候，一个 Map 对象以插入的顺序返回键值。 | 一个 Object 的键是无序的 |
| Size    | Map 的键值对个数可以轻易地通过size 属性获取 | Object 的键值对个数只能手动计算 |
| 性能    | 在频繁增删键值对的场景下表现更好。 | 在频繁添加和删除键值对的场景下未作出优化。 |




