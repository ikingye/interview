---
weight: 20
title: "程序热重启"
bookCollapseSection: true
---

# 程序热重启

## 程序如何优雅退出？

### Linux 信号

信号是进程间通信的底层形式。

Linux 有标准信号 32 个，从 32-63 的信号是**实时**信号。

发送信号的原因：

- 硬件异常：如 0 作为除数，内核会发送 SIGFPE（信号值 8）
- 软件异常：如进程终止时，内核会给父进程发送 SIGCHLE（信号值 17），窗口大小调整，应用程序会收到 SIGWINCH（信号值 28）

- `SIGINT` 2
  - `ctrl + C`
- `SIGQUIT` 3
  - `ctrl + \`
- `SIGKILL` 9
  - **不可以**被阻塞、处理和忽略
- `SIGTERM` 15
  - `kill` 默认不带参数，发送的信号就是 `SIGTERM`
  - 可以被阻塞、处理和忽略
- `SIGTOP` 20
  - 停止（挂起）进程 `ctrl + D`

{{< tabs "graceful exit" >}}
{{< tab "Go" >}}

```go
sigs := make(chan os.Signal, 1)
signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)

fmt.Println("awaiting signal")
<-sigs
fmt.Println("exiting")
```

{{< /tab >}}
{{< tab "Java" >}}

{{< /tab >}}
{{< tab "Python" >}}

{{< /tab >}}
{{< /tabs >}}

---

## 如何实现热重启的？

1. 服务端启动时多开启一个协程用来监听关闭信号
2. 当协程接收到关闭信号时，将拒绝接收新的连接，并处理好当前所有连接后断开
3. 启动一个新的服务端**进程**来接管新的连接
4. 关闭当前**进程**

{{< tabs "graceful restart" >}}
{{< tab "Go" >}}

### Go 程序优雅关闭与重启

参考：

- [gracehttp: 优雅重启 Go 程序（热启动 - Zero Downtime）](https://segmentfault.com/a/1190000015232528)

{{< /tab >}}
{{< tab "Java" >}}

{{< /tab >}}
{{< tab "Python" >}}

{{< /tab >}}
{{< /tabs >}}
