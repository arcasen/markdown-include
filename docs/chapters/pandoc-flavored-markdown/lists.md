### 列表 Lists

#### 无序列表

项目符号列表是由项目符号列表项组成的列表。项目符号列表项以项目符号（`*`、`+` 或 `-`）开头，**列表前必须添加空行**。如：

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-bullet.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-bullet.md ]]

列表项可以包含其他列表。在这种情况下，前面的空行是可选的。嵌套列表必须缩进，以与包含列表项的列表标记后的第一个非空格字符对齐。

#### 列表项含有代码

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-with-block-contents.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-with-block-contents.md ]]

#### 嵌套列表

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-nested.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-nested.md ]]

#### 有序列表

有序列表的工作方式与项目符号列表相同，只是项目以枚举器而不是项目符号开头。

在原始 Markdown 中，枚举器是十进制数字，后跟一个句点和一个空格。数字本身会被忽略，如：

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-ordered.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-ordered.md ]]

#### 扩展：`fancy_lists`

与原始 Markdown 不同，Pandoc 允许使用大小写字母和罗马数字以及阿拉伯数字来标记有序列表项。列表标记可以用括号括起来，也可以后跟一个右括号或句点。它们必须与后面的文本至少间隔一个空格；如果列表标记是带句点的大写字母，则必须至少间隔两个空格。

该` fancy_lists` 扩展还允许使用 `#` 代替数字作为有序列表标记：

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-fancy.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-fancy.md ]]


#### 扩展：`task_lists`

Pandoc 支持任务列表，使用 GitHub-Flavored Markdown 的语法。

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-task.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-task.md ]]

#### 扩展：`definition_lists`

每个术语必须占一行，行尾可以空一行，并且必须跟一个或多个定义。定义以冒号或波浪号开头，可以缩进一至两个空格。

一个术语可能有多个定义，每个定义可以由一个或多个块元素（段落、代码块、列表等）组成，每个块元素缩进四个空格或一个制表位。定义的主体（不包括第一行）应该缩进四个空格。但是，与其他 Markdown 列表一样，除了段落或其他块元素的开头外，你可以“懒惰地”省略缩进。

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-definition.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-definition.md ]]

#### 结束列表

如果您想在列表后放置缩进的代码块怎么办？要“截断”第二项之后的列表，您可以插入一些非缩进的内容，例如 HTML 注释，这样不会以任何格式产生可见的输出；如果您想要两个连续的列表而不是一个大列表，则可以使用相同的技巧：

```
![[ ../../examples/pandoc-flavored-markdown/lists/lists-end.md ]]
```

渲染效果：

![[ ../../examples/pandoc-flavored-markdown/lists/lists-end.md ]]







