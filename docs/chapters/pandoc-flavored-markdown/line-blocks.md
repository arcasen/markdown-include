### 行块 Line Blocks

#### 扩展：`line_blocks`

行块是由一系列以竖线 (`|`) 开头、后跟空格的行组成的序列。行的划分以及前导空格将在输出中保留；否则，这些行将被格式化为 Markdown 格式。这对于诗句和地址很有用：

```markdown
![[ ../../examples/pandoc-flavored-markdown/line_blocks-1.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/line_blocks-1.md ]]

如果需要，可以将行硬换行，但续行必须以空格开头：

```markdown
![[ ../../examples/pandoc-flavored-markdown/line_blocks-2.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/line_blocks-2.md ]]

内容中允许使用行内格式（例如强调）（但不能跨越行边界）。块级格式（例如块引用或列表）无法识别。

此语法借用自 [reStructuredText](https://docutils.sourceforge.io/docs/ref/rst/introduction.html)。