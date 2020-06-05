# 程序员面试自查清单

- [程序员面试自查清单](#程序员面试自查清单)
  - [基础](#基础)
    - [操作系统](#操作系统)
      - [Linux](#linux)
    - [网络](#网络)
    - [算法](#算法)
    - [编程语言](#编程语言)
      - [C](#c)
      - [C++](#c-1)
      - [C](#c-2)
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
      - [分布式系统](#分布式系统)
      - [高性能](#高性能)
      - [高可用](#高可用)
      - [高并发](#高并发)
      - [高扩展性](#高扩展性)
    - [项目管理](#项目管理)
  - [后端](#后端)
    - [Web 后端](#web-后端)
      - [PHP Web 后端](#php-web-后端)
      - [Python Web 后端](#python-web-后端)
      - [Go Web 后端](#go-web-后端)
    - [微服务](#微服务)
    - [云原生](#云原生)
    - [数据库](#数据库)
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

---

## 基础

- [ ] 编译
- [ ] [编码](content/docs/basic/encode/_index.md)
  - [ ] Unicode
    - [ ] UTF-8
  - [ ] base64
  - [ ] url 编程
- [ ] 加密
  - [ ] SSL/TLS

### 操作系统

- [ ] 进程
  - [ ] 线程
  - [ ] 协程
- [ ] 内存
  - [ ] 堆
  - [ ] 栈

#### Linux

- [ ] 系统信息
  - [ ] 硬件信息
    - [ ] 内存
    - [ ] CPU
  - [ ] 运行信息
    - [ ] 内存
    - [ ] CPU
    - [ ] 进程
    - [ ] 端口
- [ ] shell
  - [ ] ps
  - [ ] lsof
  - [ ] awk
  - [ ] sed

---

### 网络

- [ ] TCP/IP
  - [ ] TCP
  - [ ] UDP
- [ ] HTTP
- [ ] HTTPS
- [ ] 抓包
  - [ ] tcpdump
  - [ ] wireshark
- [ ] 发包
  - [ ] PacketSender

---

### 算法

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

### 编程语言

#### C

#### C++

#### C

#### Go

- [ ] panic, recover
- [ ] make, new
- [ ] Goroutine
  - [ ] Goroutine 为什么高效
  - [ ] Goroutine 如何调度
- [ ] 标准库
  - [ ] time
    - [ ] 格式化
- [ ] 性能
  - [ ] pprof

#### Java

- [ ] 异常处理
- [ ] 垃圾回收
- [ ] JVM

#### JavaScript

#### Kotlin

#### PHP

#### Python

- [ ] 可迭代的，迭代器，生成器
- [ ] yield
  - [ ] 协程
- [ ] 装饰器
- [ ] 猴子补丁
- [ ] 标准库

#### Ruby

#### Rust

#### Scala

#### Swift

---

## 软件工程

- [ ] 什么是敏捷开发

### 设计模式

- [ ] 6 大原则
  - [ ] 单一职责原则 (SRP)
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

### 架构设计

#### 分布式系统

- [ ] ACID (`Atomicity`, `Consistency`, `Isolation`, `Durability`)
- [ ] CAP (`Consistency`, `Availability`, `Partition tolerance`)
- [ ] BASE (`Basically Available`, `Soft state`, `Eventual consistency`)

#### 高性能

#### 高可用

#### 高并发

#### 高扩展性

- [ ] 如何提高可扩展性
- [ ] [如何构建高扩展性网站](content/docs/software-engineering/architecture/high-scalability/_index.md)

---

### 项目管理

- [ ] 什么是 OKR，比 KPI 好在哪里
- [ ] 如何做好 OKR 制定

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

### 消息队列

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
