---
weight: 10
title: "Linux 系统信息"
---

# Linux 系统信息

## 硬件信息

### 如何查看内存大小？

```shell
free -m
```

### 如何查看 CPU 个数，CPU 核心数，逻辑 CPU 个数？

```shell
# 物理 cpu 个数
cat /proc/cpuinfo| grep 'physical id' | sort | uniq | wc -l
# 每个物理 cpu 的核心数
cat /proc/cpuinfo| grep 'core id' | sort | uniq | wc -l
# 逻辑 cpu 个数（线程数）
cat /proc/cpuinfo| grep 'processor' | sort | uniq | wc -l
```

例子：

- 2 个 cpu
- 每个 cpu 有 8 个核心（一共 16 个核心）
- 一共有 32 个逻辑 cpu / 线程（每个核心有 2 个逻辑 cpu / 线程）

![](https://cdn.jsdelivr.net/gh/ikingye/imagehost/picgo/20200622170954.png)

---

### 如何查看系统内核？

```shell
uname -a

cat /proc/version
```

### 如何查看操作系统版本？

```shell
cat /etc/issue

cat /etc/*release
```

---

## 运行信息

### 如何查看占用内存最多的进程？

### 如何查看占用 CPU 最多的进程？

### 如何查看占用某个端口的进程？
