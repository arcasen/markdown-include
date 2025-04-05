### 列表 Lists

你可以将多个条目组织成有序或无序列表。

#### 有序列表（Ordered Lists）

要创建有序列表，请在每个列表项前添加数字并紧跟一个英文句点。数字不必按数学顺序排列，但是列表应当以数字 1 起始。

```
![[ snippets/lists-ordered.md]]
```

渲染效果:

![[snippets/lists-ordered.md]]

##### 有序列表（Ordered List）用法的最佳实践

CommonMark 和其它几种轻量级标记语言可以让你使用括号（)）作为分隔符（例如 1) First item），但并非所有的 Markdown 应用程序都支持此种用法，因此，从兼容的角度来看，此用法不推荐。为了兼容起见，请只使用英文句点作为分隔符。

#### 无序列表（Unordered Lists）

要创建无序列表，请在每个列表项前面添加破折号 (`-`)、星号 (`*`) 或加号 (`+`) 。缩进一个或多个列表项可创建嵌套列表。

```
![[ snippets/lists-unordered.md]]
```

渲染效果:

![[snippets/lists-unordered.md]]

##### 以数字开头的无序列表项

如果你需要以数字开头并且紧跟一个英文句号（也就是 `.`）的无序列表项，则可以使使用反斜线（`\`）来 转义 这个英文句号。

```
![[ snippets/lists-unordered-start-with-number-period.md ]]
```

渲染效果如下：

![[ snippets/lists-unordered-start-with-number-period.md ]]

##### 无序列表（Unordered List）用法的最佳实践

Markdown 应用程序在如何处理同一列表中混用不同分隔符上并不一致。为了兼容起见，请不要在同一个列表中混用不同的分隔符，最好选定一种分隔符并一直用下去。

#### 在列表中添加列表项

要在保留列表连续性的同时在列表中添加另一种元素，请将该元素缩进四个空格或一个制表符，如下例所示：

```
![[ snippets/lists-items-including-paragraphs.md ]]
```

渲染效果如下：

![[ snippets/lists-items-including-paragraphs.md ]]

```
![[ snippets/lists-items-including-blockquotes.md ]]
```

渲染效果如下：

![[ snippets/lists-items-including-blockquotes.md ]]

