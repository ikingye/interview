---
weight: 10
title: "Mysql"
bookCollapseSection: true
---

# Mysql

## Mysql 有哪些引擎，分别有什么特点？

---

## Mysql 索引是怎么实现的？

---

## Mysql 事务是怎么实现的？

begin 命令并不代表事务的开始，事务开始于 begin 命令之后的第一条语句执行的时候。

```sql
begin;
select * from xxx;
commit; -- 或者 rollback;
```

---

## Mysql 事务隔离级别有哪些？

| 隔离级别                       | 脏读 | 不可重复读 | 幻读 | 锁     | 备注         |
| ------------------------------ | ---- | ---------- | ---- | ------ | ------------ |
| 读未提交（`READ UNCOMMITTED`） | √    | √          | √    | 不加锁 |              |
| 读提交 （`READ COMMITTED`）    | ×    | √          | √    |        | Oracle 默认  |
| 可重复读 （`REPEATABLE READ`） | ×    | ×          | √    |        | Mysql 默认   |
| 串行化 （`SERIALIZABLE`）      | ×    | ×          | ×    | 共享锁 | 相当于单线程 |

- 可重复读
  - 事务开始时读到的已有数据是什么，在事务提交前的任意时刻，这些数据的值都是一样的。

设置隔离级别

```sql
-- SET [SESSION | GLOBAL] TRANSACTION ISOLATION LEVEL {READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE}
set global transaction isolation level read committed;
```

查询当前有多少事务正在运行

```sql
select * from information_schema.innodb_trx;
```

---

### 可重复读

为了实现可重复读，MySQL 采用了 `MVVC` (多版本并发控制) 的方式

![](https://cdn.jsdelivr.net/gh/ikingye/imagehost/picgo/20200710153758.png)

我们在数据库表中看到的一行记录可能实际上有多个版本，每个版本的记录除了有数据本身外，还要有一个表示版本的字段，记为 row trx_id，而这个字段就是使其产生的事务的 id，事务 ID 记为 transaction id，它在事务开始的时候向事务系统申请，按时间先后顺序递增。

快照，学名叫做**一致性视图**，这也是可重复读和不可重复读的关键，

- **读提交**是每次执行语句的时候都重新生成一次快照
- **可重复读**是在事务开始的时候生成一个当前**事务全局性**的快照

---

**MySQL 的可重复读隔离级别其实解决了幻读问题**

读提交解决了脏读问题，行锁解决了并发更新的问题。
并发写问题的解决方式就是**行锁**，而解决幻读用的是**间隙锁**，
MySQL 把行锁和间隙锁合并在一起，解决了并发写和幻读的问题，这个锁叫做 `Next-Key 锁`。

参考：

- [MySQL 事务隔离级别和实现原理](https://zhuanlan.zhihu.com/p/117476959)

--

## 为什么 Oracle 等默认隔离级别是 `READ COMMITTED` ，而 Mysql 默认隔离级别是 `REPEATABLE READ`？

---

## Mysql 有哪些锁，各自的使用场景是什么？

|        | 行锁 | 表锁 | 页锁 |
| ------ | ---- | ---- | ---- |
| MyISAM |      | √    |      |
| BDB    |      | √    | √    |
| InnoDB | √    | √    |      |

BDB 已经被 InnoDB 所取代

---

- 表锁
  - 开销小，加锁快；不会出现死锁；锁定力度大，发生锁冲突概率高，并发度最低
- 行锁
  - 开销大，加锁慢；会出现死锁；锁定粒度小，发生锁冲突的概率低，并发度高
- 页锁
  - 开销和加锁速度介于表锁和行锁之间；会出现死锁；锁定粒度介于表锁和行锁之间，并发度一般

---

- 共享锁（S）
- 排他锁（X)
- 意向共享锁（IS）
- 意向排他锁（IX）

---

- 行锁（`Record Locks`）
  - 行锁一定是作用在**索引**上的
- 间隙锁（`Gap Locks`）
  - 间隙锁一定是**开区间**
  - 间隙锁的应用场景包括并发读取、并发更新、并发删除和并发插入
  - `可重复读`与`串行化`才有`间隙锁`，`读未提交`与`读提交`没有`间隙锁`
- 临键锁（`Next-key Locks`）
  - 临键锁是行锁 + 间隙锁，即临键锁是是一个**左开右闭**的区间
  - RR 级别下使用 `select ... in share mode` 或者 `select ... for update 语句`，那么 InnoDB 会使用**临键锁**，因而可以防止**幻读**（`读后写`的场景）
    - RR 级别下使用普通的 select 语句，InnoDB 将是**快照读**，不会使用任何锁，因而还是无法防止幻读。
- 共享锁 / 排他锁（`Shared and Exclusive Locks`）
  - 共享锁 / 排他锁都只是行锁，与间隙锁无关
  - 共享锁：`select ... in share mode`
  - 排他锁：`select ... for update`
  - 尽管共享锁 / 排他锁是行锁，与间隙锁无关，但一个事务在请求共享锁 / 排他锁时，获取到的结果却可能是行锁，也可能是间隙锁，也可能是临键锁，这取决于数据库的**隔离级别**以及**查询的数据是否存在**。
- 意向共享锁 / 意向排他锁（`Intention Shared and Exclusive Locks`）
  - 意向共享锁 / 意向排他锁属于**表锁**
  - 取得意向共享锁 / 意向排他锁是取得共享锁 / 排他锁的**前置条件**
- 插入意向锁（`Insert Intention Locks`）
  - 插入意向锁是一种特殊的**间隙锁**，该锁只用于**并发插入**操作
  - 如果说间隙锁锁住的是一个区间，那么插入意向锁锁住的就是一个点
- 自增锁（`Auto-inc Locks`）

---

- 增：插入意向锁
- 删改：排他锁
- 查：共享锁

参考：

- [MySQL 常见的七种锁详细介绍](https://blog.csdn.net/Saintyyu/article/details/91269087)

---

## Mysql 什么情况下会出现死锁？

- 在 InnoDB 引擎下，RR (`REPEATABLE-READ`) 级别，如果多个事务争抢同一个资源，会发生死锁。

`next-key lock`

---

## Mysql 如何保证数据一致性？

---

## Mysql 主从如何同步？
