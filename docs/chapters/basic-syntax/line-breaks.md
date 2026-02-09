### 换行 Line Breaks

在一行的末尾添加两个或多个空格，然后按回车键（return），即可创建一个换行（line break）或新行 (`<br>`)。

如果你所使用的 Markdown 应用程序 支持 HTML 的话[^pandoc-linebreak]，你可以使用 HTML 的 `<br>` 标签来实现换行。

[^pandoc-linebreak]: Pandoc 在转换成 latex 或 pdf 时不支持 `<br>` 换行, 见：<https://github.com/jgm/pandoc/issues/10043>。

示例：

```markdown
![[ ../../examples/basic-syntax/line-breaks.md ]]
```

::: rendered

![[ ../../examples/basic-syntax/line-breaks.md ]]

:::