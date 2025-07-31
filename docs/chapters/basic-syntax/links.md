### 链接 Links

要创建链接，请将链接文本括在方括号中，后面紧跟着括在圆括号中的 URL，如：

```markdown
My favorite search engine is [Duck Duck Go](https://duckduckgo.com).
```

::: rendered

My favorite search engine is [Duck Duck Go](https://duckduckgo.com).

#### 添加标题

您可以选择为链接添加标题。当用户将鼠标悬停在链接上时，它将显示为工具提示。要添加标题，请在 URL 后用引号将其括起来，如：

```markdown
My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy").
```

::: rendered

My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy").

#### URL 和电子邮件地址

要快速将 URL 或电子邮件地址变成链接，请用尖括号将其括起来。

```markdown
<https://www.markdownguide.org>

<fake@example.com>
```

::: rendered

<https://www.markdownguide.org>

<fake@example.com>

#### 格式化链接

要 强调 链接，请在方括号和圆括号前后添加星号。要将链接表示为 代码，请在方括号中添加反引号。

示例：

```markdown
![[ ../../examples/basic-syntax/links/links-formatted.md ]]
```

::: rendered

![[ ../../examples/basic-syntax/links/links-formatted.md ]]

#### 引用式链接

假设您将一个 URL 作为 标准 URL 链接 添加到一个段落，并且在 Markdown 中看起来像这样：

```markdown
![[ ../../examples/basic-syntax/links/links-standard-url.md ]]
```

虽然它可能指向有趣的附加信息，但显示的 URL 除了使其更难阅读之外，实际上并没有给现有原始文本增加太多内容。要解决这个问题，您可以像这样格式化 URL：

```markdown
![[ ../../examples/basic-syntax/links/links-reference-style.md ]]
```

也可以采用隐式的链接名称：

```markdown
![[ ../../examples/basic-syntax/links/links-implicit-link.md ]]
```

在上面的实例中，呈现的输出将是相同的：

![[ ../../examples/basic-syntax/links/links-implicit-link.md ]]

**注意**：Markdown 应用程序对于如何处理 URL 中间的空格没有达成一致。为了兼容性，请尝试使用 `%20` 对 URL 中的任何空格进行 URL 编码。或者，如果您的 Markdown 应用程序 支持 HTML，则可以使用 a HTML 标签。URL 中间的括号也可能带来问题。为了兼容性，尝试使用 `%28` 对左括号 (`(`) 进行 URL 编码，使用 `%29` 对右括号 (`)`) 进行 URL 编码。或者，如果 Markdown 应用程序 支持 HTML，可以使用 a HTML 标签。

