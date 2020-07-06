---
weight: 50
title: "Go 编译"
bookCollapseSection: true
---

# Go 编译

## Makefile

---

---

## Go 插件系统

Go 1.8 版本开始提供了一个创建共享库的新工具，称为 `Plugins`.

`go build -buildmode=plugin`

### Go 插件系统的应用场景？

- 通过 plugin 我们可以很方便的对于不同功能加载相应的模块；
- 针对不同语言 (英文、汉语、德语……) 加载不同的语言 so 文件，进行不同的输出；
- 编译出的文件给不同的编程语言用 (如：c/java/python/lua 等).
- 需要加密的核心算法，核心业务逻辑可以可以编译成 plugin 插件
- 黑客预留的后门 backdoor 可以使用 plugin
- 函数集动态加载

---

### Go 插件系统是如何实现的？

参考：

- [Go 插件系统](https://draveness.me/golang/docs/part4-advanced/ch08-metaprogramming/golang-plugin/)
