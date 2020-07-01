---
weight: 10
title: "XSS"
---

# XSS

## 什么是 XSS，为什么会发生 XSS？

`Cross-site scripting`
跨站脚本
([wiki](https://www.wikiwand.com/zh-cn/%E8%B7%A8%E7%B6%B2%E7%AB%99%E6%8C%87%E4%BB%A4%E7%A2%BC))

### XSS 发生的原因

没有将**用户输入的文本**进行合适的**过滤**，就贸然插入到 HTML 中，这很容易造成注入漏洞。
攻击者可以利用漏洞，构造出恶意的**代码指令**，进而利用恶意代码危害数据安全。

不仅仅是业务上的 “用户的 UGC 内容” 可以进行注入，包括 URL 上的参数等都可以是攻击的来源。在处理输入时，以下内容都不可信：

- 来自用户的 UGC 信息
- 来自第三方的链接
- URL 参数
- POST 参数
- `Referer` （可能来自不可信的来源）
- `Cookie` （可能来自**其他子域**注入）

## 有哪些 XSS 攻击方法？

- 在 HTML 中内嵌的文本中，恶意内容以 script 标签形成注入。
- 在内联的 JavaScript 中，拼接的数据突破了原本的限制（字符串，变量，方法名等）。
- 在标签属性中，恶意内容包含引号，从而突破属性值的限制，注入其他属性或者标签。
- 在标签的 href、src 等属性中，包含 javascript: 等可执行代码。
- 在 onload、onerror、onclick 等事件中，注入不受控制代码。
- 在 style 属性和标签中，包含类似 `background-image:url("javascript:...");` 的代码（新版本浏览器已经可以防范）。
- 在 style 属性和标签中，包含类似 `expression(...)` 的 CSS 表达式代码（新版本浏览器已经可以防范）。

---

## 如何防止 XSS 攻击？

### 输入过滤

输入侧过滤能够在某些情况下解决特定的 XSS 问题，但会引入很大的不确定性和**乱码**问题。
在防范 XSS 攻击时应避免此类方法。

当然，对于明确的输入类型，例如数字、URL、电话号码、邮件地址等等内容，进行输入过滤还是必要的。

### 纯前端渲染

纯前端渲染，把代码和数据分隔开

纯前端渲染的过程：

1. 浏览器先加载一个静态 HTML，此 HTML 中不包含任何跟业务相关的数据。
1. 然后浏览器执行 HTML 中的 JavaScript。
1. JavaScript 通过 Ajax 加载业务数据，调用 DOM API 更新到页面上。

在纯前端渲染中，我们会明确的告诉浏览器：
下面要设置的内容是文本（`.innerText`），还是属性（`.setAttribute`），还是样式（`.style`）等等。
浏览器不会被轻易的被欺骗，执行预期外的代码了。

但纯前端渲染还需注意避免 DOM 型 XSS 漏洞（例如 `onload` 事件和 `href` 中的 `javascript:xxx` 等）。

在很多内部、管理系统中，采用纯前端渲染是非常合适的。
但对于**性能**要求高，或有 **SEO 需求**的页面，我们仍然要面对拼接 HTML 的问题。

### 对 HTML 做充分转义

对插入到页面中的数据进行**转义**，
通常是把 `& < > " ' /` 这几个字符转义掉，
确实能起到一定的 XSS 防护作用，但要完善 XSS 防护措施，我们要使用更完善更细致的**转义策略**。

HTML 转义是非常复杂的，在不同的情况下要采用不同的转义规则。如果采用了错误的转义规则，很有可能会埋下 XSS 隐患。
应当尽量避免自己写转义库，而应当采用成熟的、业界通用的**转义库**。

常用的模板引擎，如 `doT.js`、`ejs`、`FreeMarker` 等，
Java 工程里，常用的转义库为 `org.owasp.encoder`。

#### 验证 href 的值

对于**链接跳转**，如 `<a href="xxx"` 或 `location.href="xxx"`，要检验其内容，禁止以 `javascript:` 开头的链接，和其他非法的 `scheme`。

```js
// 根据项目情况进行过滤，禁止掉 "javascript:" 链接、非法 scheme 等
allowSchemes = ["http", "https"];

valid = isValid(getParameter("redirect_to"), allowSchemes);

if (valid) {
  <a href="<%= escapeHTML(getParameter("redirect_to"))%>">
    跳转...
  </a>
} else {
  <a href="/404">
    跳转...
  </a>
}
```

##### 不区分大小写，可以带空格

- JavaScript 不区分大小写： `jAvascRipt:alert('XSS')`
- 可以带空格 `%20`： `%20javascript:alert('XSS')`

---

#### escapeEmbedJSON

插入 JSON 的地方不能使用 `escapeHTML()`，因为转义 `"` 后，JSON 格式会被破坏。

```html
<script>
  var initData = <%= data.toJSON() %>
</script>
```

这样内联 JSON 也是不安全的

- 当 JSON 中包含 `U+2028` 或 `U+2029` 这两个字符时，不能作为 JavaScript 的**字面量**使用，否则会抛出**语法错误**。
- 当 JSON 中包含字符串 `</script>` 时，当前的 script 标签将会被闭合，后面的字符串内容浏览器会按照 HTML 进行解析；通过增加下一个 `<script>` 标签等方法就可以完成注入。

```html
<script>
  // 实现一个 escapeEmbedJSON() 函数，对内联 JSON 进行转义
  var initData = <%= escapeEmbedJSON(data.toJSON()) %>
</script>
```

---

### 预防 DOM 型 XSS 攻击

在使用 `.innerHTML`、`.outerHTML`、`document.write()` 时要特别小心，不要把不可信的数据作为 HTML 插到页面上，
而应尽量使用 `.textContent`、`.setAttribute()` 等。

如果用 Vue/React 技术栈，并且不使用 `v-html`/`dangerouslySetInnerHTML` 功能，
就在前端 render 阶段避免 `innerHTML`、`outerHTML` 的 XSS 隐患。

DOM 中的**内联事件监听器**，如 `location`、`onclick`、`onerror`、`onload`、`onmouseover` 等，
`<a>` 标签的 `href` 属性，
JavaScript 的 `eval()`、`setTimeout()`、`setInterval()` 等，
都能把字符串作为代码运行。

```html
<!-- 内联事件监听器中包含恶意代码 -->
![](https://awps-assets.meituan.net/mit-x/blog-images-bundle-2018b/3e724ce0.data:image/png,)

<!-- 链接内包含恶意代码 -->
<a href="UNTRUSTED">1</a>

<script>
  // setTimeout()/setInterval() 中调用恶意代码
  setTimeout("UNTRUSTED");
  setInterval("UNTRUSTED");

  // location 调用恶意代码
  location.href = "UNTRUSTED";

  // eval() 中调用恶意代码
  eval("UNTRUSTED");
</script>
```

---

### Content Security Policy

严格的 CSP 在 XSS 的防范中可以起到以下的作用：

- 禁止加载外域代码，防止复杂的攻击逻辑。
- 禁止外域提交，网站被攻击后，用户的数据不会泄露到外域。
- 禁止内联脚本执行（规则较严格，目前发现 GitHub 使用）。
- 禁止未授权的脚本执行（新特性，Google Map 移动版在使用）。
- 合理使用上报可以及时发现 XSS，利于尽快修复问题。

### 输入内容长度控制

对于不受信任的输入，都应该限定一个合理的长度。
虽然无法完全防止 XSS 发生，但可以增加 XSS 攻击的难度。

### 其他安全措施

- `HTTP-only Cookie`: 禁止 JavaScript 读取某些敏感 Cookie，攻击者完成 XSS 注入后也无法窃取此 Cookie。
- 验证码：防止脚本冒充用户提交危险操作。

---

## XSS 的检测

```shell
jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */oNcliCk=alert() )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert()//>\x3e
```

只要在网站的各输入框中提交这个字符串，或者把它拼接到 URL 参数上，就可以进行检测了。

能够检测到存在于 HTML 属性、HTML 文字内容、HTML 注释、跳转链接、内联 JavaScript 字符串、内联 CSS 样式表等多种上下文中的 XSS 漏洞，
也能检测 eval()、setTimeout()、setInterval()、Function()、innerHTML、document.write() 等 DOM 型 XSS 漏洞，
并且能绕过一些 XSS 过滤器。

### 自动扫描工具

- [Arachni](https://github.com/Arachni/arachni)
- [Mozilla HTTP Observatory](https://github.com/mozilla/http-observatory/)
- [w3af](https://github.com/andresriancho/w3af)

---

## 参考

- [在学习 XSS 前应该学习什么？](https://www.zhihu.com/question/21745144)
- [前端安全系列（一）：如何防止 XSS 攻击？](https://tech.meituan.com/2018/09/27/fe-security.html)
