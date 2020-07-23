---
weight: 20
title: "Redis"
bookCollapseSection: true
---

# Redis

## Redis 有哪些数据结构，分别适用什么场景？

---

## Redis 数据结构是如何实现的？

---

## Redis 如何做持久化？

### RDB

在指定的时间间隔能对你的数据进行快照存储

```shell
# 时间策略
save 900 1
save 300 10
save 60 10000

# 文件名称
dbfilename dump.rdb

# 文件保存路径
dir /home/work/app/redis/data/

# 如果持久化出错，主进程是否停止写入
stop-writes-on-bgsave-error yes

# 是否压缩
rdbcompression yes

# 导入时是否检查
rdbchecksum yes
```

### AOF

```shell
# 是否开启aof
appendonly yes

# 文件名称
appendfilename "appendonly.aof"

# 同步方式
appendfsync everysec

# aof重写期间是否同步
no-appendfsync-on-rewrite no

# 重写触发配置
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb

# 加载aof时如果有错如何处理
aof-load-truncated yes

# 文件重写策略
aof-rewrite-incremental-fsync yes
```

---

## Redis 是单进程单线程，这么设计有什么优点？
