---
weight: 40
title: "Goroutine"
bookCollapseSection: true
---

# Goroutine

## Goroutine 为什么高效？

---

## Goroutine 如何调度？

每个线程会都占用 `1MB` 以上的内存空间，在对线程进行切换时不止会消耗较多的内存，恢复寄存器中的内容还需要向操作系统申请或者销毁对应的资源，
每一次线程上下文的切换都需要消耗约为 `1us`，
但是 Go 调度器对 Goroutine 的上下文切换约为 `0.2us`，减少了 80% 的额外开销。

Go 语言的调度器通过**使用与 CPU 数量相等的线程**减少线程频繁切换的内存开销，
同时在每一个线程上执行额外开销更低的 Goroutine 来降低操作系统和硬件的负载。

参考：

- [Go 语言调度器与 Goroutine 实现原理](https://draveness.me/golang/docs/part3-runtime/ch06-concurrency/golang-goroutine/)
- [[译] Go 调度器: M, P 和 G](https://colobu.com/2017/05/04/go-scheduler/)
- [也谈 goroutine 调度器](https://tonybai.com/2017/06/23/an-intro-about-goroutine-scheduler/)
