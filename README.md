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
  - [后端](#后端)
    - [Web 后端](#web-后端)
      - [PHP Web 后端](#php-web-后端)
      - [Python Web 后端](#python-web-后端)
      - [Go Web 后端](#go-web-后端)
    - [微服务](#微服务)
    - [云原生](#云原生)
    - [数据库](#数据库)
    - [NOSQL](#nosql)
    - [消息队列](#消息队列)
    - [搜索引擎](#搜索引擎)
    - [缓存](#缓存)
    - [性能](#性能)
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
    - [其他](#其他)

---

## 操作系统

- [ ] 进程/线程/协程
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
- [ ] 内存
  - [ ] 综合
    - [ ] 程序加载的时候，是怎么分布的，哪些在堆里，哪些在栈里？
  - [ ] 堆
  - [ ] 栈

### Linux

- [ ] 系统信息
  - [ ] 硬件信息
    - [ ] 如何查看内存？
    - [ ] 如何查看 CPU？
  - [ ] 运行信息
    - [ ] 如何查看占用内存最多的进程？
    - [ ] 如何查看占用 CPU 最多的进程？
    - [ ] 如何查看占用某个端口的进程？
- [ ] shell
  - [ ] ps
    - [ ] ps aux 与 ps -ef 有什么区别？
  - [ ] lsof
  - [ ] awk
  - [ ] sed

---

## 网络

- [ ] TCP/UDP/IP
  - [ ] TCP
  - [ ] UDP
  - [ ] IP
- [ ] HTTP
  - [ ] HTTP 基础
    - [ ] HTTP 状态码有哪些，101， 304， 307 是什么？
    - [ ] HTTP Trunk 解决什么问题？
  - [ ] HTTP2
    - [ ] HTTP2 有哪些特点？
    - [ ] HTTP2 多路复用是如何实现的？
  - [ ] HTTPS
- [ ] 抓包
  - [ ] 综合
    - [ ] 常用抓包工具有哪些？分别有什么特点，适用于什么场景？
  - [ ] tcpdump
  - [ ] wireshark
- [ ] 发包
  - [ ] 综合
    - [ ] 常用发包工具有哪些？分别有什么特点，适用于什么场景？
  - [ ] PacketSender

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

## 编程语言

### C

### C++

### `C#`

### Go

- [ ] Go 数据类型
  - [ ] 什么时候使用数组？
  - [ ] slice 底层结构是什么？
- [ ] Go 关键字
  - [ ] make, new 有什么区别？
  - [ ] panic, recover 是怎么实现的？
- [ ] Goroutine
  - [ ] Goroutine 为什么高效？
  - [ ] Goroutine 如何调度？
- [ ] Go 包管理
  - [ ] Go 包管理的进化过程是什么样的？
  - [ ] Go Mod 相对之前的版本管理有哪些优点？
  - [ ] Go Mod 是怎么实现的，程序如何一步步找到引用的包？
- [ ] Go 版本
  - [ ] 你现在使用的是什么版本？最新版本是什么，相对有哪些变化？
- [ ] 标准库
  - [ ] time
    - [ ] 格式化
- [ ] 性能
  - [ ] pprof

### Java

- [ ] 异常处理
- [ ] 垃圾回收
- [ ] JVM

### JavaScript

### Kotlin

### PHP

### Python

- [ ] 可迭代的，迭代器，生成器
- [ ] yield
  - [ ] 协程
- [ ] 装饰器
- [ ] 猴子补丁
- [ ] 标准库

### Ruby

### Rust

### Scala

### Swift

---

## 软件工程

### 设计模式

- [ ] 设计原则
  - [ ] 单一职责原则 (`SRP`)
  - [ ] 开闭原则 (`Open Closed Principle`)
  - [ ] 里氏替换原则 (`Liskov Substitution Principle`)
  - [ ] 依赖倒置原则 (`Dependence Inversion Principle`)
  - [ ] 接口隔离原则 (`Interface Segregation Principle`)
  - [ ] 迪米特原则 (`Demeter Principle`)
- [ ] 23 种设计模式
  - [ ] 创建型 (5 种)
    - [ ] 简单工厂模式
    - [ ] 工厂方法模式
    - [ ] 抽象工厂模式
    - [ ] 建造者模式
    - [ ] 单例模式
  - [ ] 结构型 (7 种)
    - [ ] 适配器模式
    - [ ] 桥接模式
    - [ ] 装饰模式
    - [ ] 外观模式
    - [ ] 享元模式
    - [ ] 代理模式
    - [ ] 组合模式
  - [ ] 行为型 (11 种)
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
- [ ] 其他设计模式
  - [ ] 并发型模式
  - [ ] 线程池模式
- [ ] 适配器模式、装饰模式、代理模式有哪些异同？

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

- [ ] 什么是 OKR，比 KPI 好在哪里
- [ ] 如何做好 OKR 制定
- [ ] 什么是敏捷开发

---

## 后端

### Web 后端

#### PHP Web 后端

- [ ] fastcgi

#### Python Web 后端

#### Go Web 后端

---

### 微服务

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

### 数据库

- [ ] Mysql
  - [ ] Mysql 有哪些引擎，分别有什么特点？
  - [ ] Mysql 索引是怎么实现的？
  - [ ] Mysql 事务是怎么实现的？
  - [ ] Mysql 如何保证数据一致性？
  - [ ] Mysql 主从如何同步？

### NOSQL

- [ ] Redis
  - [ ] Redis 有哪些数据结构，分别适用什么场景？
  - [ ] Redis 如何做持久化？
  - [ ] Redis 是单进程单线程，这么设计有什么优点？

### 消息队列

- [ ] 综合
  - [ ] 有哪些消息队列，分别适用什么场景？
- [ ] Kafka
  - [ ] Kafka 如何实现一致性？
- [ ] RocketMQ
- [ ] RabbitMQ
- [ ] ActiveMQ
- [ ] ZeroMQ

### 搜索引擎

### 缓存

### 性能

- [ ] 火焰图
  - [ ] perf

---

## 前端

### Web 前端

---

### Android

---

### iOS

---

## 运维

### CI/CD

- [ ] 什么是 CI/CD
- [ ] 你们公司如何实现 CI/CD

### DevOps

---

## 测试

---

## 安全

### Web 安全

- [ ] [Web 安全包括哪些内容](content/docs/security/web/_index.md)
- [ ] [XSS](content/docs/security/web/xss.md)
  - [ ] [什么是 XSS，为什么会发生 XSS](content/docs/security/web/xss.md)
  - [ ] [如何防止 XSS 攻击](content/docs/security/web/xss.md)
- [ ] [CSRF](content/docs/security/web/csrf.md)
  - [ ] [什么是 CSRF，为什么会发生 CSRF](content/docs/security/web/csrf.md)
  - [ ] [如何防止 CSRF 攻击](content/docs/security/web/csrf.md)

---

### 其他

- [ ] 编译
- [ ] [字符编码](content/docs/other/encode.md)
  - [ ] Unicode
    - [ ] UTF-8
  - [ ] base64
  - [ ] url 编程
- [ ] 加密
  - [ ] SSL/TLS
