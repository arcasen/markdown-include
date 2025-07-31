### 代码块 Code Blocks

Pandoc 支持两种代码块：

- 缩进式代码块（indented code blocks，Markdown 基本语法）
- 围栏式代码块（fenced code blocks）

#### 缩进式代码块

缩进四个空格（或一个制表符）的文本块将被视为逐字文本：也就是说，特殊字符不会触发特殊格式，所有空格和换行符都会保留。例如：

```markdown
![[ ../../examples/pandoc-flavored-markdown/code-blocks/indented-code-blocks.md ]]
```

::: rendered

![[ ../../examples/pandoc-flavored-markdown/code-blocks/indented-code-blocks.md ]]

:::

初始（四个空格或一个制表符）缩进不被视为逐字文本的一部分，并将在输出中删除。

::: caution

逐字文本中的空白行不必以四个空格开头。

:::

#### 扩展：`fenced_code_blocks`

除了标准缩进式代码块外，Pandoc 还支持 带围栏式代码块。这些代码块以一行三个或更多波浪号 (`~`) 开始，以一行波浪号结束，波浪号的长度必须至少与起始行一样长。这些行之间的所有内容都被视为代码。无需缩进：

```
~~~~~~~
if (a > 3) {
  moveShip(5 * gravity, DOWN);
}
~~~~~~~
```

与常规代码块一样，围栏式代码块必须用空行与周围文本分隔开。

如果代码本身包含一行波浪号或反引号，则只需在开始和结束处使用一排较长的波浪号或反引号：

~~~~~~~~~~~~~~~~
~~~~~~~~~~
code including tildes
~~~~~~~~~~
~~~~~~~~~~~~~~~~

#### 扩展：`backtick_code_blocks`

与 `fenced_code_blocks` 相同，但使用反引号 (\`) 而不是波浪号 (`~`)。

#### 扩展：`fenced_code_attributes`

或者，您可以使用以下语法将属性附加到隔离或反引号代码块：

~~~markdown
![[ ../../examples/pandoc-flavored-markdown/code-blocks/fenced_code_attributes.md ]]
~~~

::: rendered

![[ ../../examples/pandoc-flavored-markdown/code-blocks/fenced_code_attributes.md ]]

:::

这里 `#helloworld` 是一个标识符，可以使用 `[Helloworld](#helloworld)` 建立链接； `c` 和 `numberLines` 是类，并且 `startFrom` 是一个值为 101 的属性。某些输出格式可以使用此信息进行语法高亮显示。目前，唯一使用此信息的输出格式是 HTML、LaTeX、Docx、Ms 和 PowerPoint。如果您的输出格式和语言支持高亮显示，则上面的代码块将高亮显示，并带有编号行。（要查看支持哪些语言，请输入 `pandoc --list-highlight-languages`。）

`numberLines`（或 `number-lines`）类 将使代码块的行以1或 `startFrom` 的属性值开始进行编号。`lineAnchors`（或 `line-anchors`）类将使这些行在 HTML 输出中成为可点击的锚点。

#### 语法高亮显示

Pandoc 会在标记了语言名称的代码块中自动高亮语法，使用 Haskell 库 [skylighting] 进行高亮。目前仅支持 HTML、EPUB、Docx、Ms、Man 和 LaTeX/PDF 输出的高亮功能。要查看 pandoc 识别的语言名称列表，请输入 `pandoc --list-highlight-languages`。

[skylighting]: https://github.com/jgm/skylighting

语法高亮的风格通过样式表的变化进行控制：HTML 输出使用级联样式表（CSS），LaTeX（以及 PDF）输出使用一组 `\newcommand` 选项。这些高亮指令直接嵌入输出文件中（当生成独立文档时），因此不易覆盖。不过，你可以从预定义的高亮样式列表中选择。运行以下命令可查看完整样式列表：

```bash
pandoc --list-highlight-styles
```

默认配色方案是 `pygments`，模仿了 Python 库 [pygments] 的默认配色（尽管实际高亮并未使用 pygments）。使用 `--highlight-style` 选项选择样式。例如，我在构建书籍的打印版本时想要黑白输出，因此使用选项：

[pygments]: https://pygments.org/。

```bash
pandoc --highlight-style=monochrome
```

这会生成黑白高亮，使用斜体和粗体来显示不同的语言组件。你也可以在使用代码块的同时完全禁用语法高亮，只需使用选项 `--no-highlight`。

如果对预定义样式不满意，可以使用 `--print-highlight-style` 生成一个 JSON 格式的 `.theme` 文件，修改后可作为 `--highlight-style` 的参数。例如，获取 pygments 样式的 JSON 版本：

```bash
pandoc -o my.theme --print-highlight-style pygments
```

然后编辑 `my.theme`，并按以下方式使用：

```bash
pandoc --highlight-style my.theme
```

如果内置高亮不满意，或想高亮不支持的语言，可以使用 `--syntax-definition` 选项加载 KDE 风格的 XML 语法定义文件。在编写自己的语法定义前，可参考 KDE 的语法定义仓库。

如果遇到 pandoc 报错“无法读取高亮主题”，请检查 JSON 文件是否使用 UTF-8 编码且没有字节顺序标记 (BOM)。

输出格式为 LaTeX 或 PDF 时，

- 没有设置代码属性时，默认使用 `verbatim` 宏；
- 设置代码属性时，使用 Pandoc 自定义的 `Shaded` 宏[^shaded]；
- 在编译时采用选项 `--listings`（也可以在 YAML 中设置 `listings: true`），则输出文件使用 `listings` 宏。

[^shaded]: 此时 `--highlight-style` 和 `--no-highlight` 选项才起作用，使用 `--listings` 时，格式由 `listings` 宏设置。

