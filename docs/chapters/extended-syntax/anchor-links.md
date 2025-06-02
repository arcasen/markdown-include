### 锚链接 Anchor Links{#anchor-links}

许多 Markdown 处理器支持 标题 的自定义 ID——一些 Markdown 处理器会自动添加它们。添加自定义 ID 允许您直接链接到标题并使用 CSS 修改它们。要添加自定义标题 ID，请在与标题同行的花括号中括起自定义 ID。

```markdown
### My Great Heading {#custom-id}
```

输出的 HTML 如下所示：

```html
<h3 id="custom-id">My Great Heading</h3>
```

你可以为文档中的标题创建一个 标准链接 ，链接的格式是井号（`#`）开头，其后面跟着自定义的标题 ID ，从而能够链接到这个标题。这类链接通常被称为 锚链接（anchor links）。

```markdown
[Heading IDs](#heading-ids)
```

如: [锚链接](#anchor-links)