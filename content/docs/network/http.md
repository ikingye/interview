---
weight: 10
title: "HTTP"
---

# HTTP

## HTTP 基础

### HTTP 状态码有哪些？

- 2XX 成功
  - 200 ok（请求成功）
  - 204 no content （请求成功，但是没有结果返回）
  - 206 partial content （客户端请求一部分资源，服务端成功响应，返回一范围资源）
- 3XX 重定向
  - 301 move permanently （永久性重定向）
  - 302 found （临时性重定向）
  - 303 see other （示由于请求对应的资源存在着另一个 URI，应使用 GET 方法定向获取请求的资源）
  - 304 not modified （表示在客户端采用带条件的访问某资源时，服务端找到了资源，但是这个请求的条件不符合。跟重定向无关）
  - 307 temporary redirect （跟 302 一个意思）
- 4XX 客户端错误
  - 400 bad request （请求报文存在语法错误）
  - 401 unauthorized （需要认证（第一次返回）或者认证失败（第二次返回））
  - 403 forbidden （请求被服务器拒绝了）
  - 404 not found （服务器上无法找到请求的资源）
- 5XX 服务器错误
  - 500 internal server error （服务端执行请求时发生了错误）
  - 503 service unavailable （服务器正在超负载或者停机维护，无法处理请求）

### 301 和 302 有什么区别？分别适用于什么场景？

### 101， 304， 307 分别是什么？

**101 协议升级**

主要用于 websocket，也可以用于 http2 的升级。

**304 协商缓存**

浏览器缓存分为强制缓存和协商缓存，优先读取强制缓存。

强制缓存分为 expires 和 cache-control，而 expires 是一个特定的时间，是比较旧的标准和 cache-control 通常是一个具体的时间长度，比较新，优先级也比较高。

**307 hsts 跳转**

原本的用法是用于让 post 请求的跳转去新的 post 请求，但也用于 hsts 跳转。

hsts 全称 HTTP 严格传输安全（HTTP Strict Transport Security，縮寫：HSTS），功能是要求浏览器下次访问该站点时使用 https 来访问，而不再需要先是 http 再转 https。这样可以避免 ssl 剥离攻击，即攻击者在用户使用 http 访问的过程中进行攻击，对服务器冒充自己是用户，在攻击者和服务器中使用 https 访问，在用户和服务器中使用 http 访问。

具体使用方法是在服务器响应头中添加 Strict-Transport-Security，可以设置 max-age

参考：

- [面试必考之 http 状态码有哪些](http://hpoenixf.com/%E9%9D%A2%E8%AF%95%E5%BF%85%E8%80%83%E4%B9%8Bhttp%E7%8A%B6%E6%80%81%E7%A0%81%E6%9C%89%E5%93%AA%E4%BA%9B.html)

---

### HTTP chunk 是什么？解决了什么问题？

---

### HTTP/1.1 有哪些问题？

1. TCP 连接数限制

- 问题：对于同一个域名，浏览器最多只能同时创建 6~8 个 TCP 连接 (不同浏览器不一样)
- 解决：域名分片 技术，其实就是资源分域，将资源放在不同域名下 (比如二级子域名下)
  - 还有问题：每个 TCP 连接本身需要经过 DNS 查询、三步握手、慢启动等，还占用额外的 CPU 和内存

2. [队头阻塞（ Head-of-line blocking 或缩写为 HOL blocking ）](https://www.wikiwand.com/zh-cn/%E9%98%9F%E5%A4%B4%E9%98%BB%E5%A1%9E)

- 问题：每个 TCP 连接同时只能处理一个请求 - 响应，浏览器按 FIFO 原则处理请求，如果上一个响应没返回，后续请求 - 响应都会受阻。
- 解决： [HTTP 管线化](https://www.wikiwand.com/zh-cn/HTTP%E7%AE%A1%E7%B7%9A%E5%8C%96)
  - 还有问题：比如第一个响应慢还是会阻塞后续响应、服务器为了按序返回相应需要缓存多个响应占用更多资源、浏览器中途断连重试服务器可能得重新处理多个请求、还有必须客户端 - 代理 - 服务器都支持管线化

3. Header 内容多，而且每次请求 Header 不会变化太多，没有相应的压缩传输优化方案
4. 为了尽可能减少请求数，需要做合并文件、雪碧图、资源内联等优化工作，但是这无疑造成了单个请求内容变大延迟变高的问题，且内嵌的资源不能有效地使用缓存机制
5. 明文传输不安全

参考：

- [HTTP2 详解](https://blog.wangriyu.wang/2018/05-HTTP2.html)

---

---

## HTTP2

### HTTP2 有哪些特点？

1. 二进制分帧层 (Binary Framing Layer)
   - 帧是数据传输的最小单位，以二进制传输代替原本的明文传输，原本的报文消息被划分为更小的数据帧
2. 多路复用 (MultiPlexing)
3. 服务端推送 (Server Push)
4. Header 压缩 (HPACK)
5. 应用层的重置连接
6. 请求优先级设置
7. 流量控制
8. HTTP/1 的几种优化可以弃用
   - 合并文件、内联资源、雪碧图、域名分片对于 HTTP/2 来说是不必要的，使用 h2 尽可能将资源细粒化，文件分解地尽可能散，不用担心请求数多

参考：

- [HTTP2 详解](https://blog.wangriyu.wang/2018/05-HTTP2.html)

### HTTP2 多路复用是如何实现的？

---

---

## HTTPS
