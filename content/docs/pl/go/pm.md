---
weight: 50
title: "Go 包管理"
bookCollapseSection: true
---

# Go 包管理

## Go 包管理的发展历史？

- `Go 1.4` 及之前
  - 所有的依赖包都是存放在 `GOPATH` 下，没有版本控制
- `Go 1.5` 至 `Go 1.10`
  - 每个项目的根目录下可以有一个 `vendor` 目录，里面存放了该项目的依赖的包
- `Go 1.11` 至 `Go 1.12`
  - 默认使用的还是 `GOPATH` 的管理方式
  - 运行 `export GO111MODULE=on`，使用 `Go Modules`
- `Go 1.13` 及之后
  - 默认使用 `Go Modules`

---

## 你用过哪些 Go 包管理工具，说说它们的优缺点？

- [golang/dep](https://github.com/golang/dep) ![Github stars](https://img.shields.io/github/stars/golang/dep.svg)

- [Masterminds/glide](https://github.com/Masterminds/glide) ![Github stars](https://img.shields.io/github/stars/Masterminds/glide.svg)

- [kardianos/govendor](https://github.com/kardianos/govendor) ![Github stars](https://img.shields.io/github/stars/kardianos/govendor.svg)

---

## Go Mod 相对之前的版本管理有哪些优点？

- 可以指定版本

---

## Go Mod 如何找到引用的包？

一般情况：

查看 `$GOPATH/pkg/mod/`

设置 `go mod vendor`，使用 `go build -mod=vendor` 来构建项目时：

---

## 参考

- [Go 包管理](https://kingye.me/study-go/docs/basic/practice/pm/)
