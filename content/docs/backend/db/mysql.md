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

## Mysql 事务隔离级别有哪些？

| 隔离级别                       | 脏读 | 不可重复读 | 幻读 | 锁     | 备注        |
| ------------------------------ | ---- | ---------- | ---- | ------ | ----------- |
| 读未提交（`READ UNCOMMITTED`） | √    | √          | √    | 不加锁 |             |
| 读提交 （`READ COMMITTED`）    | ×    | √          | √    |        | Oracle 默认 |
| 可重复读 （`REPEATABLE READ`） | ×    | ×          | √    |        | Mysql 默认  |
| 串行化 （`SERIALIZABLE`）      | ×    | ×          | ×    |        |             |

---

begin 命令并不代表事务的开始，事务开始于 begin 命令之后的第一条语句执行的时候。

```sql
begin;
select * from xxx;
commit; -- 或者 rollback;
```

设置隔离级别

```sql
-- SET [SESSION | GLOBAL] TRANSACTION ISOLATION LEVEL {READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE}
set global transaction isolation level read committed;
```

查询当前有多少事务正在运行

```sql
select * from information_schema.innodb_trx;
```

参考：

- [MySQL 事务隔离级别和实现原理](https://zhuanlan.zhihu.com/p/117476959)

---

## Mysql 事务是怎么实现的？

---

## Mysql 如何保证数据一致性？

---

## Mysql 主从如何同步？
