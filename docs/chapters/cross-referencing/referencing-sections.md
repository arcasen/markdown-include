### 引用章节 Referencing Sections

在文本中定义章节标签 `{#sec:label}`，然后引用该标签 `[@sec:label]`：

```
# This is a chapter {#sec:ch}

## This is the first section {#sec:a}

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

## This is the second section {#sec:b}

Sed iaculis pellentesque tempor. Etiam fringilla orci ut est efficitur, vitae iaculis odio convallis.

See [@sec:a] and [@sec:b].
```

编译时必须使用 `--number-sections`，如：

```
pandoc --number-sections --filter pandoc-crossref -o output.pdf input.md
```
