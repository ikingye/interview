---
weight: 40
title: "Goroutine"
bookCollapseSection: true
---

# Goroutine

## Goroutine 为什么高效？

---

## 为什么 Go 需要自己实现调度器？

- Goroutine 的引入是为了方便高并发程序的编写。 一个 Goroutine 在进行阻塞操作（比如系统调用）时，会把**当前线程**中的其他 Goroutine 移交到**其他线程**中继续执行， 从而避免了整个程序的阻塞。
- 由于 Golang 引入了垃圾回收（gc），**在执行 gc 时就要求 Goroutine 是停止的**。通过自己实现调度器，就可以方便的实现该功能。 通过多个 Goroutine 来实现并发程序，既有异步 IO 的优势，又具有多线程、多进程编写程序的便利性。
- 引入 Goroutine，也意味着引入了极大的复杂性。一个 Goroutine 既要包含要执行的代码， 又要包含用于执行该代码的栈和 PC、SP 指针。

---

## 调度器解决了什么问题？

1. 栈管理

   既然每个 Goroutine 都有自己的栈，那么在创建 Goroutine 时，就要同时创建对应的栈。 Goroutine 在执行时，栈空间会不停增长。 栈通常是连续增长的，由于每个进程中的各个线程共享虚拟内存空间，当有多个线程时，就需要为每个线程分配不同起始地址的栈。 这就需要在分配栈之前先预估每个线程栈的大小。如果线程数量非常多，就很容易栈溢出。

   为了解决这个问题，就有了 Split Stacks 技术： 创建栈时，只分配一块比较小的内存，如果进行某次函数调用导致栈空间不足时，就会在其他地方分配一块新的栈空间。 新的空间不需要和老的栈空间连续。函数调用的参数会拷贝到新的栈空间中，接下来的函数执行都在新栈空间中进行。

   Golang 的栈管理方式与此类似，但是为了更高的效率，使用了连续栈 （Golang 连续栈） 实现方式也是先分配一块固定大小的栈，在栈空间不足时，分配一块更大的栈，并把旧的栈全部拷贝到新栈中。 这样避免了 Split Stacks 方法可能导致的频繁内存分配和释放。

1. 抢占式调度

   Goroutine 的执行是可以被抢占的。如果一个 Goroutine 一直占用 CPU，长时间没有被调度过， 就会被 runtime 抢占掉，把 CPU 时间交给其他 Goroutine。

---

## Goroutine 如何调度？

Golang 调度器引入了三个结构来对调度的过程建模：

- G 代表一个 Goroutine；
- M 代表一个操作系统的**线程**； `Machine`
- P 代表一个 CPU 处理器，通常 P 的数量等于 CPU 核数（`GOMAXPROCS`）。

三者都在 runtime2.go 中定义，他们之间的关系如下：

- G 需要绑定在 M 上才能运行；
- M 需要绑定 P 才能运行；
- 程序中的多个 M 并不会同时都处于执行状态，最多只有 `GOMAXPROCS` 个 M 在执行。

早期版本的 Golang 是没有 P 的，调度是由 G 与 M 完成。 这样的问题在于每当创建、终止 Goroutine 或者需要调度时，需要一个**全局锁**来保护调度的相关对象 (`sched`)。 全局锁严重影响 Goroutine 的并发性能。 ([Scalable Go Scheduler](https://docs.google.com/document/d/1TTj4T2JO42uD5ID9e89oa0sLKhJYD0Y_kqxDv3I3XMw/edit))

通过引入 P，实现了一种叫做 `work-stealing` 的调度算法：

- 每个 P 维护一个 G 队列；
- 当一个 G 被创建出来，或者变为可执行状态时，就把他放到 P 的可执行队列中；
- 当一个 G 执行结束时，P 会从队列中把该 G 取出；如果此时 P 的队列为空，即没有其他 G 可以执行， 就随机选择另外一个 P，从其可执行的 G 队列中偷取一半。

该算法避免了在 Goroutine 调度时使用全局锁。

### 抢占

- 在 Go 中，一个 `goroutine` 最多占用 CPU 10ms，防止其他 goroutine 被饿死
- 在 coroutine 中要等待一个协程主动让出 CPU 才执行下一个协程

### 全局 G 队列

在新的调度器中依然有全局 G 队列，但功能已经被弱化了，当 M 执行 work stealing 从其他 P 偷不到 G 时，它可以从全局 G 队列获取 G。
