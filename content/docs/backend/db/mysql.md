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

---

## Mysql 如何保证数据一致性？

---

## Mysql 主从如何同步？
