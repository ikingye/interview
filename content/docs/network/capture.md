---
weight: 10
title: "抓包"
---

# 抓包

## 综合

### 常用抓包工具有哪些？分别有什么特点，适用于什么场景？

---

## tcpdump

- `tcpdump -D`: 列出所有可监听设备
- `tcpdump -i`: 指定网络接口（网卡）
  - `tcpdump -i any`: 不确定走哪个网卡
- `tcpdump host`: 指定主机
  - `tcpdump src host`: 指定主机发送出去的包
  - `tcpdump dst host`: 发送到指定主机的包
- `tcpdump tcp`: 指定协议
- `tcpdump port`: 指定端口
- `tcpdump -n`: 直接显示 IP，而不把 IP 解析为主机名
- `tcpdump -nn`: 直接显示 IP 与端口，而不解析为主机名与服务
- `tcpdump -N`: 不打印 host 的域名部分，比如打印 `nic` 而不是 `nic.ddn.mil`
- `tcpdump -w`: 输出到文件
- `tcpdump -tttt`: 更具有可读性的时间格式
- `tcpdump -c`: 抓 n 个包，然后退出

```shell
# 监视第一个网络接口上所有流过的数据包
tcpdump

# 监视指定网络接口的数据包
tcpdump -i eth1

# 截获主机 210.27.48.1 和主机 210.27.48.2 或 210.27.48.3 的通信
tcpdump host 210.27.48.1 and \ (210.27.48.2 or 210.27.48.3 \)
# 截获主机 ace 与任何其他主机之间通信的 IP 数据包，但不包括与 helios 之间的数据包
tcpdump ip host ace and not helios
# 截获主机 hostname 发送的所有数据
tcpdump -i eth0 src host hostname
# 截获所有送到主机 hostname 的数据包
tcpdump -i eth0 dst host hostname

# 获取主机 210.27.48.1 接收或发出的 telnet 包
tcpdump tcp port 23 and host 210.27.48.1
# 对本机的 udp 端口 123 进行监视
tcpdump udp port 123
```

参考：

- [A tcpdump Tutorial with Examples — 50 Ways to Isolate Traffic](https://danielmiessler.com/study/tcpdump/)
- [tcpdump 指南](https://zzyongx.github.io/blogs/tcpdump-tutorial.html)
- [Linux tcpdump 命令详解](https://www.cnblogs.com/ggjucheng/archive/2012/01/14/2322659.html)

---

## wireshark
