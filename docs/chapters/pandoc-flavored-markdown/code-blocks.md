### 代码块 Verbatim (code) blocks

#### 缩进的代码块 Indented code blocks

缩进四个空格（或一个制表符）的文本块将被视为逐字文本：也就是说，特殊字符不会触发特殊格式，所有空格和换行符都会保留。例如：

```
![[ ../../examples/pandoc-flavored-markdown/code-blocks/indented-code-blocks.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/code-blocks/indented-code-blocks.md ]]

初始（四个空格或一个制表符）缩进不被视为逐字文本的一部分，并将在输出中删除。

**注意**：逐字文本中的空白行不必以四个空格开头。

#### 扩展：`fenced_code_blocks`

除了标准缩进的代码块外，Pandoc 还支持 带围栏的代码块。这些代码块以一行三个或更多波浪号 (`~`) 开始，以一行波浪号结束，波浪号的长度必须至少与起始行一样长。这些行之间的所有内容都被视为代码。无需缩进：

~~~~~~~
if (a > 3) {
  moveShip(5 * gravity, DOWN);
}
~~~~~~~

与常规代码块一样，围栏代码块必须用空行与周围文本分隔开。

如果代码本身包含一行波浪号或反引号，则只需在开始和结束处使用一排较长的波浪号或反引号：

~~~~~~~~~~~~~~~~
~~~~~~~~~~
code including tildes
~~~~~~~~~~
~~~~~~~~~~~~~~~~

#### 扩展： `backtick_code_blocks`

与 `fenced_code_blocks` 相同，但使用反引号 (\`) 而不是波浪号 (`~`)。

#### 扩展： `fenced_code_attributes`

或者，您可以使用以下语法将属性附加到隔离或反引号代码块：

```
![[ ../../examples/pandoc-flavored-markdown/code-blocks/fenced_code_attributes.md ]]
```

渲染效果如下：

![[ ../../examples/pandoc-flavored-markdown/code-blocks/fenced_code_attributes.md ]]

这里 `#helloworld` 是一个标识符，可以使用 `[Helloworld](#helloworld)` 建立链接； `c` 和 `numberLines` 是类，并且 `startFrom` 是一个值为 101 的属性。某些输出格式可以使用此信息进行语法高亮显示。目前，唯一使用此信息的输出格式是 HTML、LaTeX、Docx、Ms 和 PowerPoint。如果您的输出格式和语言支持高亮显示，则上面的代码块将高亮显示，并带有编号行。（要查看支持哪些语言，请输入 `pandoc --list-highlight-languages`。）

`numberLines`（或 `number-lines`）类 将使代码块的行以1或 `startFrom` 的属性值开始进行编号。`lineAnchors`（或 `line-anchors`）类将使这些行在 HTML 输出中成为可点击的锚点。

要阻止所有高亮显示，请使用 `--no-highlight` 标志。要设置高亮显示样式，请使用 `--highlight-style`。

