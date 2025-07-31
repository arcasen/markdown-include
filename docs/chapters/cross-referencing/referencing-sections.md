### 引用章节 Referencing Sections

在文本中定义章节标签 `{#sec:label}`，然后引用该标签 `[@sec:label]`：

```markdown
# This is a chapter {#sec:ch}

## This is the first section {#sec:a}

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

## This is the second section {#sec:b}

Sed iaculis pellentesque tempor. Etiam fringilla orci ut est efficitur, vitae iaculis odio convallis.

See [@sec:a] and [@sec:b].
```

编译时必须使用 `--number-sections`，如：

```bash
pandoc --number-sections --filter pandoc-crossref -o output.pdf input.md
```

::: caution

使用 Crossref 的 `[@sec:label]` 只能显示章节编号；而 Pandoc 的*[扩展：`implicit_header_references`]* 能够显示章节名称。

:::
