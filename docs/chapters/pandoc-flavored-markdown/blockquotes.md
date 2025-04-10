### 引用块 Block quotations

Markdown 使用电子邮件约定来引用文本块。块引用是指一个或多个段落或其他块元素（例如列表或标题），每行前面都有一个 `>` 字符和一个可选的空格。（引用 `>` 不必从左边距开始，但缩进不应超过三个空格。）

块引用中可以包含其他块引用的块元素。也就是说，块引用可以嵌套：

```
![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-1.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-1.md ]]

注意：上面的嵌套块引用中需要加入空行。不加入空行则不会变成块引用：

```
![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-2.md ]]
```

原始 Markdown 语法并不要求块引用前有空行。Pandoc 则要求这样做（当然，文档开头除外）。这样做的原因是， a 很容易意外地>出现在行首（例如由于换行）。因此，除非 markdown_strict 使用这种格式，否则以下代码在 Pandoc 中不会生成嵌套的块引用：

```
![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-3.md ]]
```

