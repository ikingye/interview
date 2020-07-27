---
weight: 20
title: "关键字"
bookCollapseSection: true
---

# 关键字

## make, new 有什么区别？

- make
  - 初始化
  - 设置数组的长度、容量等
  - 返回变量本身
- new
  - 只初始化
  - 返回变量的指针

```go
list := new([]int)
// 不能对未设置长度的指针执行 append 操作
list = append(list, 1)

s1 := []int{1, 2, 3}
s2 := []int{4, 5}
// 编译错误，s2需要展开
// s1 = append(s1, s2)
s1 = append(s1, s2...)
fmt.Println(s1)
```

---

```go
// The make built-in function allocates and initializes an object of type
// slice, map, or chan (only). Like new, the first argument is a type, not a
// value. Unlike new, make's return type is the same as the type of its
// argument, not a pointer to it. The specification of the result depends on
// the type:
//	Slice: The size specifies the length. The capacity of the slice is
//	equal to its length. A second integer argument may be provided to
//	specify a different capacity; it must be no smaller than the
//	length. For example, make([]int, 0, 10) allocates an underlying array
//	of size 10 and returns a slice of length 0 and capacity 10 that is
//	backed by this underlying array.
//	Map: An empty map is allocated with enough space to hold the
//	specified number of elements. The size may be omitted, in which case
//	a small starting size is allocated.
//	Channel: The channel's buffer is initialized with the specified
//	buffer capacity. If zero, or the size is omitted, the channel is
//	unbuffered.
func make(t Type, size ...IntegerType) Type

// The new built-in function allocates memory. The first argument is a type,
// not a value, and the value returned is a pointer to a newly
// allocated zero value of that type.
func new(Type) *Type
```

---

## panic, recover 是怎么实现的？

参考：

- [Go 语言 panic 和 recover 的原理](https://draveness.me/golang/docs/part2-foundation/ch05-keyword/golang-panic-recover/)
