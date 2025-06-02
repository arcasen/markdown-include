### HTML 标签

许多 Markdown 应用程序允许你在 Markdown 格式文本中使用 HTML 标签。如果你更喜欢某些 HTML 标签而不是 Markdown 语法，这会很有帮助。例如，有些人觉得使用 HTML 标签来处理图片更简单。当你需要更改元素的属性（例如指定 文本颜色 或更改图片的宽度）时，使用 HTML 也会很有帮助。

要使用 HTML，请将标签放置在 Markdown 格式文件文本中。

示例：

```markdown
This **word** is bold. This <em>word</em> is italic.
```

渲染效果如下：

This **word** is bold. This <em>word</em> is italic.

注意：出于安全原因，并非所有 Markdown 应用程序都支持 Markdown 文档中的 HTML。如有疑问，请查看 Markdown 应用程序的文档。一些应用程序仅支持 HTML 标签的子集。

使用空行来分隔块级 HTML 元素，如 `<div>`、`<table>`、`<pre>` 和 `<p>`，使其与周围内容分开。尽量不要使用制表符或空格缩进标签，因为这会影响格式。

您不能在块级 HTML 标签中使用 Markdown 语法。例如，`<p>italic and **bold**</p>` 将不起作用。