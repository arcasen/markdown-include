### 锚链接 Anchor Links{#anchor-links}

许多 Markdown 解析器都支持为 标题（headings） 自定义 ID，某些 Markdown 解析器会自动为标题添加 ID。通过添加自定义 ID， 能够让你直接链接到这个标题，并且还能使用 CSS 修改其样式。如需为标题添加自定义 ID，请将自定义 ID 用花括号括起来并与标题一起放在同一行。

```
### My Great Heading {#custom-id}
```

输出的 HTML 如下所示：

```
<h3 id="custom-id">My Great Heading</h3>
```

你可以为文档中的标题创建一个 标准链接 ，链接的格式是井号（#）开头，其后面跟着自定义的标题 ID ，从而能够链接到这个标题。这类链接通常被称为 锚链接（anchor links）。

```
[Heading IDs](#heading-ids)
```

如: [锚链接](#anchor-links)