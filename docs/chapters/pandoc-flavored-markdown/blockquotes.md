### 引用块 Block quotations{#pandoc-blockquotes}

Markdown 使用电子邮件约定来引用文本块。块引用是指一个或多个段落或其他块元素（例如列表或标题），每行前面都有一个 `>` 字符和一个可选的空格。（引用 `>` 不必从左边距开始，但缩进不应超过三个空格。）

```
![[ ../../examples/pandoc-flavored-markdown/blockquotes.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/blockquotes.md ]]

还允许使用“懒惰”形式，即 `>` 仅要求在每个块的第一行出现字符：

```
![[ ../../examples/pandoc-flavored-markdown/blockquotes-lazy-form.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/blockquotes-lazy-form.md ]]

块引用中可以包含其他块引用的块元素。也就是说，块引用可以嵌套：

```
![[ ../../examples/pandoc-flavored-markdown/blockquotes-nested.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/blockquotes-nested.md ]]

如果该 `>` 字符后跟一个可选空格，则该空格将被视为块引用标记的一部分，而不是内容缩进的一部分。因此，要将缩进的代码块放入块引用中，你需要在 `>` 后添加五个空格：

```
![[ ../../examples/pandoc-flavored-markdown/blockquotes-code.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/blockquotes-code.md ]]

#### 扩展： `blank_before_blockquote`

原始 Markdown 语法并不要求块引用前有空行。Pandoc 则要求这样做（当然，文档开头除外）。这样做的原因是， a 很容易意外地>出现在行首（例如由于换行）。因此，除非 markdown_strict 使用这种格式，否则以下代码在 Pandoc 中不会生成嵌套的块引用：

```
![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-1.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-1.md ]]

注意：上面的嵌套块引用中需要加入空行。不加入空行则不会变成块引用：

```
![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-2.md ]]
```



```
![[ ../../examples/pandoc-flavored-markdown/blank_before_blockquote-3.md ]]
```

