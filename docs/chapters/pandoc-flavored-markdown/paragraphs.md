### 段落 Paragraphs

段落由一行或多行文本组成，后跟一行或多行空行。换行符被视为空格，因此您可以根据需要重新排列段落。*如果需要强制换行，请在行尾添加两个或更多空格。*

示例：

<!--
listings 的 showspaces=ture 属性设置对行尾空格不起作用:

https://tex.stackexchange.com/questions/296523/listings-package-last-whitespace-removed-before-the-newline-character-how-to-k
-->

```markdown
![[ ../../examples/pandoc-flavored-markdown/paragraphs/paragraphs-and-newline.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/paragraphs/paragraphs-and-newline.md ]]

#### 扩展：`escaped_line_breaks`

反斜杠后跟换行符也是一种硬换行符。

**注意**：在多行和网格表格单元格中，这是创建硬换行符的**唯一**方法，因为单元格中的尾随空格会被忽略，见*[扩展：`mutiline_tables`]* 和*[扩展：`grid_tables`]*。

示例：

```markdown
![[ ../../examples/pandoc-flavored-markdown/paragraphs/escaped_line_breaks.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/paragraphs/escaped_line_breaks.md ]]
