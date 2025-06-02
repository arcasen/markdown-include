### 列表 Lists

Markdown 支持有序或无序列表 ( ordered/numbered lists & unordered/bulleted lists)。

#### 有序列表 Ordered Lists

要创建有序列表，请在每个列表项前添加数字并紧跟一个英文句点。数字**不必**按数学顺序排列，但是列表应当以数字 1 起始。

示例：

```markdown
![[ ../../examples/basic-syntax/lists/lists-ordered.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-ordered.md ]]

示例：

```markdown
![[ ../../examples/basic-syntax/lists/lists-ordered-with-disordered-numbers.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-ordered-with-disordered-numbers.md ]]

CommonMark 和其它几种轻量级标记语言可以让你使用括号（`)`）作为分隔符（例如 `1) First item`），但并非所有的 Markdown 应用程序都支持此种用法，因此，从兼容的角度来看，此用法不推荐。为了兼容起见，请只使用英文句点作为分隔符。

#### 无序列表（Unordered Lists）

要创建无序列表，请在每个列表项前面添加破折号 (`-`)、星号 (`*`) 或加号 (`+`) 。缩进一个或多个列表项可创建嵌套列表。

示例：

```markdown
![[ ../../examples/basic-syntax/lists/lists-unordered.md]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-unordered.md ]]

##### 以数字开头的无序列表项

如果你需要以数字开头并且紧跟一个英文句号（也就是 `.`）的无序列表项，则可以使使用反斜线（`\`）来 转义 这个英文句号。

示例：

```markdown
![[ ../../examples/basic-syntax/lists/lists-unordered-start-with-number-period.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-unordered-start-with-number-period.md ]]

Markdown 应用程序在如何处理同一列表中混用不同分隔符上并不一致。为了兼容起见，请不要在同一个列表中混用不同的分隔符，最好选定一种分隔符并一直用下去。

#### 在列表中添加元素{#adding-elements-in-lists}

要在保留列表连续性的同时在列表中添加另一种元素，请将该元素缩进四个空格或一个制表符，如下例所示：

##### 段落

列表中加入段落：

```markdown
![[ ../../examples/basic-syntax/lists/lists-including-paragraphs.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-including-paragraphs.md ]]

##### 引用

列表中加入引用：

```markdown
![[ ../../examples/basic-syntax/lists/lists-including-blockquotes.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-including-blockquotes.md ]]

##### 代码块

代码块通常缩进四个空格或一个制表符。当它们在列表中时，将它们缩进八个空格或两个制表符。

示例：

```markdown
![[ ../../examples/basic-syntax/lists/lists-including-codeblocks.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-including-codeblocks.md ]]

##### 图片

列表中加入图片：

```markdown
![[ ../../examples/basic-syntax/lists/lists-including-images.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-including-images.md ]]

##### 列表

你可以在有序列表中嵌套无序列表，反之亦然。

示例：

```markdown
![[ ../../examples/basic-syntax/lists/lists-nested.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/lists/lists-nested.md ]]

