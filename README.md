# 自我面试

- [自我面试](#自我面试)
  - [操作系统](#操作系统)
    - [Linux](#linux)
  - [网络](#网络)
  - [算法](#算法)
  - [编程语言](#编程语言)
    - [C](#c)
    - [C++](#c-1)
    - [`C#`](#c-2)
    - [Go](#go)
    - [Java](#java)
    - [JavaScript](#javascript)
    - [Kotlin](#kotlin)
    - [PHP](#php)
    - [Python](#python)
    - [Ruby](#ruby)
    - [Rust](#rust)
    - [Scala](#scala)
    - [Swift](#swift)
  - [软件工程](#软件工程)
    - [设计模式](#设计模式)
    - [架构设计](#架构设计)
    - [项目管理](#项目管理)
  - [云计算](#云计算)
    - [云原生](#云原生)
  - [大数据](#大数据)
  - [人工智能](#人工智能)
  - [后端](#后端)
    - [Web 后端](#web-后端)
      - [Go Web 后端](#go-web-后端)
      - [Java Web 后端](#java-web-后端)
      - [PHP Web 后端](#php-web-后端)
      - [Python Web 后端](#python-web-后端)
    - [数据库](#数据库)
    - [消息队列](#消息队列)
    - [缓存](#缓存)
    - [性能](#性能)
    - [搜索引擎](#搜索引擎)
    - [微服务](#微服务)
    - [其他](#其他)
  - [前端](#前端)
    - [Web 前端](#web-前端)
    - [Android](#android)
    - [iOS](#ios)
  - [运维](#运维)
    - [CI/CD](#cicd)
    - [DevOps](#devops)
  - [测试](#测试)
  - [安全](#安全)
    - [Web 安全](#web-安全)
  - [其他](#其他-1)

---

## 操作系统

- [ ] [进程/线程/协程](content/docs/os/process.md)
  - [ ] 进程
    - [ ] 一个进程包含哪些信息？
    - [ ] 进程切换时，操作系统做了哪些事情？
      - [ ] 进程切换时，需要保存哪些信息，保存在哪里？
  - [ ] 线程
    - [ ] 线程比进程轻量，体现在哪里？
    - [ ] 什么时候使用线程，什么时候使用进程？
  - [ ] 协程
    - [ ] 协程是什么，怎么实现的？
    - [ ] 既然协程那么好，那什么时候用进程和线程？
- [ ] [内存](content/docs/os/memory.md)
  - [ ] 综合
    - [ ] 程序加载的时候，是怎么分布的，哪些在堆里，哪些在栈里？
  - [ ] 堆
  - [ ] 栈

### Linux

- [ ] [系统信息](content/docs/os/linux/info.md)
  - [ ] 硬件信息
    - [ ] 如何查看内存大小？
    - [x] 如何查看 CPU 个数，CPU 核心数，逻辑 CPU 个数？
    - [x] 如何查看系统内核？
    - [x] 如何查看操作系统版本？
  - [ ] 运行信息
    - [ ] 如何查看占用内存最多的进程？
    - [ ] 如何查看占用 CPU 最多的进程？
    - [ ] 如何查看占用某个端口的进程？
- [ ] [shell](content/docs/os/linux/shell.md)
  - [ ] ps
    - [ ] ps aux 与 ps -ef 有什么区别？
  - [ ] lsof
  - [ ] awk
  - [ ] sed

---

---

## 网络

- [ ] [TCP/UDP/IP](content/docs/network/tcp.md)
  - [ ] TCP
  - [ ] UDP
  - [ ] IP
- [ ] [HTTP](content/docs/network/http.md)
  - [ ] HTTP 基础
    - [ ] HTTP 状态码有哪些？
    - [ ] 301 和 302 有什么区别，分别适用于什么场景？
    - [ ] 101， 304， 307 分别是什么？
    - [ ] HTTP chunk 是什么？解决了什么问题？
    - [x] HTTP/1.1 有哪些问题？
  - [ ] HTTP2
    - [x] HTTP2 有哪些特点？
    - [ ] HTTP2 多路复用是如何实现的？
  - [ ] HTTPS
- [ ] [抓包](content/docs/network/capture.md)
  - [ ] 综合
    - [ ] 常用抓包工具有哪些？分别有什么特点，适用于什么场景？
  - [ ] tcpdump
  - [ ] wireshark
- [ ] [发包](content/docs/network/send.md)
  - [ ] 综合
    - [ ] 常用发包工具有哪些？分别有什么特点，适用于什么场景？
  - [ ] PacketSender

---

---

## 算法

- [ ] 查找
  - [ ] 二分查找
- [ ] 排序
  - [ ] 快速排序
  - [ ] 堆排序
  - [ ] 排序算法时间复杂度与空间复杂度
- [ ] 链表
  - [ ] 链表逆序
- [ ] 二叉树
- [ ] 动态规划

---

---

## 编程语言

### C

---

### C++

---

### `C#`

---

### Go

- [ ] [Go 数据类型](content/docs/pl/go/type.md)
  - [ ] 什么时候使用数组？
  - [ ] slice 底层结构是什么？
- [ ] [Go 关键字](content/docs/pl/go/keyword.md)
  - [x] make, new 有什么区别？
  - [ ] panic, recover 是怎么实现的？
- [ ] [Go Channel](content/docs/pl/go/channel.md)
  - [ ] 通道如何优雅关闭？
- [ ] [Goroutine](content/docs/pl/go/goroutine.md)
  - [ ] Goroutine 为什么高效？
  - [ ] 为什么 Go 需要自己实现调度器？
  - [ ] Goroutine 如何调度？
- [ ] [Go 标准库](content/docs/pl/go/std.md)
  - [ ] time
    - [ ] 格式化
- [ ] [Go 包管理](content/docs/pl/go/pm.md)
  - [x] 简单说说 Go 包管理工具的发展历史？
  - [ ] 你用过哪些 Go 包管理工具，说说它们的优缺点？
  - [ ] Go Mod 相对之前的版本管理有哪些优点？
  - [ ] Go Mod 如何找到引用的包？
  - [ ] `replace` 语法有什么作用？
  - [ ] `go.sum` 文件有什么用？是否应该加入版本管理？是如何生成的？
- [ ] [Go 编译](content/docs/pl/go/compile.md)
  - [ ] Makefile
  - [ ] Go 插件系统
    - [ ] Go 插件系统的应用场景？
    - [ ] Go 插件系统是如何实现的？
- [ ] [Go 测试](content/docs/pl/go/test.md)
  - [ ] 单元测试
- [ ] [Go 性能](content/docs/pl/go/performance.md)
  - [ ] pprof
- [ ] [Go 版本](content/docs/pl/go/version.md)
  - [ ] 你现在使用的是什么版本？最新版本是什么，相对有哪些变化？

---

### Java

- [ ] 异常处理
- [ ] 垃圾回收
- [ ] JVM

---

### JavaScript

---

### Kotlin

---

### PHP

---

### Python

- [ ] 可迭代的，迭代器，生成器
- [ ] yield
  - [ ] 协程
- [ ] 装饰器
- [ ] 猴子补丁
- [ ] 标准库
- [ ] GIL
- [ ] ctypes

---

### Ruby

---

### Rust

---

### Scala

---

### Swift

---

---

## 软件工程

### 设计模式

- [ ] [综合](content/docs/se/design%20pattern/_index.md)
  - [x] 适配器模式、装饰模式、代理模式有哪些异同？
- [ ] [设计原则](content/docs/se/design%20pattern/principle.md)
  - [ ] 单一职责原则 (`SRP`)
  - [ ] 开闭原则 (`Open Closed Principle`)
  - [ ] 里氏替换原则 (`Liskov Substitution Principle`)
  - [ ] 依赖倒置原则 (`Dependence Inversion Principle`)
  - [ ] 接口隔离原则 (`Interface Segregation Principle`)
  - [ ] 迪米特原则 (`Demeter Principle`)
- [ ] 23 种设计模式
  - [ ] [创建型 (5 种)](content/docs/se/design%20pattern/creational.md)
    - [ ] 简单工厂模式
    - [ ] 工厂方法模式
    - [ ] 抽象工厂模式
    - [ ] 建造者模式
    - [ ] 单例模式
  - [ ] [结构型 (7 种)](content/docs/se/design%20pattern/structural.md)
    - [ ] 适配器模式
    - [ ] 桥接模式
    - [ ] 装饰模式
    - [ ] 外观模式
    - [ ] 享元模式
    - [ ] 代理模式
    - [ ] 组合模式
  - [ ] [行为型 (11 种)](content/docs/se/design%20pattern/behavioral.md)
    - [ ] 命令模式
    - [ ] 中介者模式
    - [ ] 观察者模式
    - [ ] 状态模式
    - [ ] 策略模式
    - [ ] 模板方法模式
    - [ ] 迭代子模式
    - [ ] 责任链模式
    - [ ] 备忘录模式
    - [ ] 访问者模式
    - [ ] 解释器模式
- [ ] [其他设计模式](content/docs/se/design%20pattern/others.md)
  - [ ] 并发型模式
  - [ ] 线程池模式

---

### [架构设计](content/docs/se/architecture/_index.md)

- [ ] [架构设计原则](content/docs/se/architecture/principle.md)
  - [ ] CAP (`Consistency`, `Availability`, `Partition tolerance`)
    - [ ] 如何理解 CAP，你在做系统设计时是如何取舍的？
  - [ ] ACID (`Atomicity`, `Consistency`, `Isolation`, `Durability`)
  - [ ] BASE (`Basically Available`, `Soft state`, `Eventual consistency`)
- [ ] [高性能](content/docs/se/architecture/high-performance.md)
- [ ] [高可用](content/docs/se/architecture/high-availability.md)
- [ ] [高并发](content/docs/se/architecture/high-concurrency.md)
- [ ] [高扩展性](content/docs/se/architecture/high-scalability.md)
  - [ ] 如何提高可扩展性？
  - [ ] 如何构建高扩展性网站？

---

### 项目管理

- [ ] 敏捷开发
  - [ ] 什么是敏捷开发？
- 绩效管理
  - [ ] KPI
  - [ ] OKR
    - [ ] 什么是 OKR，比 KPI 好在哪里？
    - [ ] 如何做好 OKR 制定？

---

---

## 云计算

### 云原生

- [ ] 云原生
  - [ ] 什么是云原生
  - [ ] 云原生解决了哪些痛点
  - [ ] 什么是声明式 API
  - [ ] 什么是不可变基础设施
- [ ] Kubernetes
  - [ ] 架构，各组件作用
  - [ ] 任务调度
  - [ ] 资源
    - [ ] Pod
      - [ ] 为什么要有 Pod
    - [ ] Deployment
      - [ ] 为什么要有 Deployment
  - [ ] Operator
  - [ ] CRD
  - [ ] 网络
    - [ ] CNI
      - [ ] Flannel
      - [ ] Calico
    - [ ] DNS
      - [ ] CoreDNS
    - [ ] 端口
      - [ ] containerPort
      - [ ] targetPort (pod)
      - [ ] port (service)
      - [ ] nodePort (service)
      - [ ] hostPort
- [ ] Service Mesh
  - [ ] 什么是 Service Mesh
  - [ ] 如何实现 sidecar 注入
  - [ ] 如何实现流量劫持
- [ ] Envoy
- [ ] Istio
  - [ ] 可观察指什么，如何实现

---

---

## 大数据

---

---

## 人工智能

---

---

## 后端

### Web 后端

#### Go Web 后端

- [ ] [Beego](content/docs/backend/web/go/beego.md)
- [ ] [Gin](content/docs/backend/web/go/gin.md)

#### Java Web 后端

- [ ] [Spring](content/docs/backend/web/java/spring.md)

#### PHP Web 后端

- [ ] fastcgi
- [ ] Laravel

#### Python Web 后端

---

### 数据库

- [ ] [综合](content/docs/backend/db/_index.md)
  - [ ] Mysql 与 PostgreSQL 各有什么优势？
  - [ ] NoSQL 与传统数据库主要区别是什么？
  - [ ] 常见的 NoSQL 有哪些，各自适用什么场景？
- [ ] [Mysql](content/docs/backend/db/mysql.md)
  - [ ] Mysql 有哪些引擎，分别有什么特点？
  - [ ] Mysql 索引是怎么实现的？
  - [ ] Mysql 事务是怎么实现的？
  - [x] Mysql 事务隔离级别有哪些？
  - [ ] 为什么 Oracle 等默认隔离级别是 `READ COMMITTED` ，而 Mysql 默认隔离级别是 `REPEATABLE READ`？
  - [ ] Mysql 有哪些锁，各自的使用场景是什么？
  - [ ] Mysql 什么情况下会出现死锁？
  - [ ] Mysql 如何保证数据一致性？
  - [ ] Mysql 主从如何同步？
- [ ] [Redis](content/docs/backend/db/redis.md)
  - [ ] Redis 有哪些数据结构，分别适用什么场景？
  - [ ] Redis 数据结构是如何实现的？
  - [ ] Redis 如何做持久化？
  - [ ] Redis 是单进程单线程，这么设计有什么优点？
- [ ] PostgreSQL

---

### 消息队列

- [ ] [综合](content/docs/backend/mq/_index.md)
  - [ ] 常见的消息队列有哪些，分别适用什么场景？
  - [ ] RocketMQ 相比于 Kafka 有哪些改进？
- [ ] [Kafka](content/docs/backend/mq/kafka.md)
  - [ ] Kafka 如何实现一致性？
- [ ] [RocketMQ](content/docs/backend/mq/rocketmq.md)
- [ ] [RabbitMQ](content/docs/backend/mq/rabbitmq.md)
- [ ] ActiveMQ
- [ ] ZeroMQ

---

### 缓存

---

### 性能

- [ ] 火焰图
  - [ ] perf

---

### 搜索引擎

---

### 微服务

---

### 其他

- [ ] [配置热加载](content/docs/backend/others/hot%20load.md)
- [ ] [程序热重启](content/docs/backend/others/hot%20restart.md)
  - [ ] 程序如何优雅退出？
  - [ ] 是如何实现热重启的？

---

---

## 前端

### Web 前端

- [ ] Vue
- [ ] React
- [ ] Angular

---

### Android

---

### iOS

---

---

## 运维

### CI/CD

- [ ] 什么是 CI/CD
- [ ] 你们公司如何实现 CI/CD

### DevOps

---

---

## 测试

---

---

## 安全

### Web 安全

- [ ] [综合](content/docs/security/web/_index.md)
  - [ ] Web 安全包括哪些内容？
- [ ] [XSS](content/docs/security/web/xss.md)
  - [ ] 什么是 XSS，为什么会发生 XSS？
  - [ ] 有哪些 XSS 攻击方法？
  - [ ] 如何防止 XSS 攻击？
- [ ] [CSRF](content/docs/security/web/csrf.md)
  - [ ] 什么是 CSRF，为什么会发生 CSRF？
  - [ ] 有哪些 CSRF 攻击方法？
  - [ ] 如何防止 CSRF 攻击？

---

---

## 其他

- [ ] [编译](content/docs/others/compile.md)
- [ ] [字符编码](content/docs/others/encode.md)
  - [ ] Unicode
    - [ ] UTF-8
  - [ ] base64
  - [ ] url 编程
- [ ] [加密](content/docs/others/encryption.md)
  - [ ] SSL/TLS
    - [ ] TLS 握手流程是什么样的？
