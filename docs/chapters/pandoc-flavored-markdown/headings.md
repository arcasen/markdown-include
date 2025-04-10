### 标题

Pandoc 可以使用两种标题格式：Setext 和 ATX。

#### Setext 样式

Setext 样式的标题是一行带有“下划线”的文本，其中带有一行=符号（对于一级标题）或 -符号（对于二级标题）。标题文本可能包括[内联格式](#inline-formatting)，例如强调和斜体。

```
![[ ../../examples/pandoc-flavored-markdown/setext-style-headings.md ]]
```

#### ATX 格式

ATX 样式标题由 1 到 6 个连续的`#`符号和一行文本组成，在行尾可能有任意数量的符号。行首的符号`#`数量即为标题的级别。与 Setext 标题一样，ATX 标题允许[内联格式](#inline-formatting)。

```
![[ ../../examples/pandoc-flavored-markdown/atx-style-headings.md ]]
```

#### Extension: `blank_before_header`

原始 Markdown 语法不需要标题前有空行。 Pandoc 确实需要这个（当然，文档的开头除外）。提出这一要求的原因是，`#` 很容易意外地出现在一行的开头（可能由于换行）。

```
![[ ../../examples/pandoc-flavored-markdown/blank_before_header.md ]]
```

#### Extension: `space_in_atx_header`

许多 Markdown 实现并不要求 ATX 标题开头的 `#` 与标题文本之间有空格，因此 `# heading 1` 和 `#heading 1` 都算作标题。Pandoc 默认要求`#` 与标题文本之间有空格，可以用 `-f markdown-space_in_atx_header` 来取消这个要求。

```
![[ ../../examples/pandoc-flavored-markdown/space_in_atx_header.md ]]
```

编译时运行：`pandoc -f markdown-space_in_atx_header input.md -o output.md`。

#### 标题标识符

#### Extension: `header_attributes`

可以在包含标题文本的行末尾使用以下语法为标题分配属性：

```
{#identifier .class .class key=value key=value}
```

请注意，虽然此语法允许分配类和键/值属性，但编写者通常不会使用所有这些信息。标识符、类和键/值属性用于 HTML 和基于 HTML 的格式（例如 EPUB 和 slidy）。标识符用于 LaTeX、ConTeXt、Textile、Jira 标记和 AsciiDoc 编写器中的标签和链接锚点。

即使指定了 ，带有 类的标题unnumbered也不会被编号--number-sections。属性上下文中的单个连字符 ( -) 相当于.unnumbered，并且在非英语文档中更可取。因此，

```
# My heading {-}
```

和

```
# My heading {.unnumbered}
```

如果存在 `unnumbered` 和 `unlisted` ，则标题将不会包含在目录中。（目前此功能仅适用于某些格式：基于 LaTeX 和 HTML、PowerPoint 和 RTF 的格式。）

```
![[ ../../examples/pandoc-flavored-markdown/header_attributes.md ]]
```

#### Extension: `implicit_header_references`

Pandoc 的行为就像每个标题都定义了引用链接 （reference links） 一样。因此，要链接到标题，只需要直接加上`[]`，如：

```
![[ ../../examples/pandoc-flavored-markdown/implicit_header_references.md ]]
```

如果有多个标题具有相同的文本，则相应的引用将仅链接到第一个标题，并且您需要使用明确的链接来链接到其他标题，如上所述。

与常规引用链接一样，这些引用不区分大小写。

显式链接引用定义始终优先于隐式标题引用。

