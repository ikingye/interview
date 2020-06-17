---
weight: 30
title: "程序热重启"
bookCollapseSection: false
---

# 程序热重启

## 你使用的编程语言，是如何实现热重启的？

1. 服务端启动时多开启一个协程用来监听关闭信号
2. 当协程接收到关闭信号时，将拒绝接收新的连接，并处理好当前所有连接后断开
3. 启动一个新的服务端进程来接管新的连接
4. 关闭当前进程

{{< tabs "uniqueid" >}}
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
