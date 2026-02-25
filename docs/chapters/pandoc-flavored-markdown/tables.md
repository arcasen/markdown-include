### 表格 Tables

Pandoc 中支持四种列表样式，前三种要求等宽字体（fixed-width font）[^fwf],最后一种可以使用比例间隔字体（proportionally spaced font）[^psf]：

- `simple_tables`
- `multiline_tables`
- `grid_tables`
- `pipe_tables`

[^fwf]: Fixed-width Font（等宽字体），又称为 Monospaced Font，是一种所有字符（包括字母、数字、标点符号等）占据相同水平宽度的字体。

[^psf]: Proportionally Spaced Font（比例间隔字体）是一种字符宽度不固定的字体，每个字符根据其实际形状占据不同的水平空间。现代中文字体（如思源黑体、苹方、微软雅黑）多为比例间隔字体，尤其在标点和中西文混排时体现宽度优化，适合出版、网页、UI 设计等。

::: caution

中文排版时该对齐是不好控制的，因为中文字体不属于等宽字体。

:::

#### 扩展：`table_captions`

所有 4 种表格类型均可选择添加标题（如下例所示）。标题是一个以字符串 `Table:`（或 `table:` 或仅 `:`）开头的段落，可以出现在表格之前或之后。

::: caution

- 当在表格之前使用 `: <table caption>` 形式的标题时，为避免解析成定义列表（见*[扩展：`definition_lists`]*），可在前面增加一空白行，或将其置于表格之后。

- Pandoc 的原生 Markdown 语法不支持在表格标题中直接添加脚注（见*[脚注 Footnotes]*）。当你在表格标题中使用脚注语法 `[^1]` 并尝试生成文件时，Pandoc 通常会将其作为纯文本处理，而不会将其渲染为正确的脚注格式。

:::

#### 扩展：`simple_tables`

表头和表行必须各占一行。列对齐由表头文本相对于其下方虚线的位置决定：

- 如果虚线与右侧的标题文本齐平，但左侧超出标题文本，则该列右对齐。
- 如果虚线与左侧的标题文本齐平，但在右侧超出标题文本，则该列左对齐。
- 如果虚线超出两侧的标题文本，则该列居中。
- 如果虚线与两侧的标题文本齐平，则使用默认对齐方式（在大多数情况下，将保持对齐）。
  
表格必须以一个空白行结束，或者以一行 dashes 后跟一个空白行结束。

可以省略列标题行，但表格结尾必须使用虚线。当省略标题行时，列对齐将根据表主体的第一行确定。

示例：

```markdown
![[ ../../examples/pandoc-flavored-markdown/tables/simple-tables.md ]]
```

::: rendered

![[ ../../examples/pandoc-flavored-markdown/tables/simple-tables.md ]]

:::

#### 扩展：`mutiline_tables`

多行表格允许标题行和表格行跨越多行文本（但不支持跨越表格多列或多行的单元格）。

多行表格的工作方式类似于简单表格，但有以下区别：

- 必须以一行 dashes 开头，位于标题文本之前（除非省略标题行）。
- 必须以一排 dashes 结尾，然后是一个空行。
- 行与行之间必须用空行分隔。
  
在多行表格中，表格解析器会关注列的宽度，编写器会尝试在输出中重现这些相对宽度。因此，如果您发现输出中某一列太窄，请尝试在 Markdown 源代码中将其加宽。

在多行表格可以省略表头。

多行表可能只有一行，但该行后面应该跟着一个空行（然后是结束表格的 dashes 行），否则该表可能会被解释为简单表格。

示例：

```markdown
![[ ../../examples/pandoc-flavored-markdown/tables/multiline-tables.md ]]
```

::: rendered

![[ ../../examples/pandoc-flavored-markdown/tables/multiline-tables.md ]]

:::

#### 扩展：`grid_tables`

`=` 行将表头与表体分隔开来，对于无表头的表格，可以省略该行。网格表格的单元格可以包含任意块元素（多个段落、代码块、列表等）。

单元格可以跨越多列或多行^[对于含有中文的表格，可能会失效。]。

表头可能包含多行。

可以像管道表格一样指定对齐方式，通过在标题后的分隔线边界处放置冒号 `:`。

对于无表头的表，冒号位于顶行。

可以通过使用分隔线（`=`而不是`-`）来定义表格脚注。

表格脚注必须始终放在表格的最底部。

可以使用 Emacs 的表格模式 ( M-x table-insert) 轻松创建网格表。

示例：

```markdown
![[ ../../examples/pandoc-flavored-markdown/tables/grid-tables.md ]]
```

::: rendered

![[ ../../examples/pandoc-flavored-markdown/tables/grid-tables.md ]]

:::

#### 扩展：`pipe_tables`

管道表格语法与 PHP Markdown Extra 表格[^php-table] 表相同。起始和结束竖线字符（`|`）是可选的，但所有列之间都需要竖线。冒号指示列对齐方式。*表头不可省略*。要模拟无表头表格，请添加一个带有空白单元格的表头。由于管道指示列边界，因此列无需像上例那样垂直对齐。

[^php-table]: <https://michelf.ca/projects/php-markdown/extra/#table>

管道表格的单元格不能包含段落和列表等块元素，也不能跨越多行。如果 Markdown 源代码中的任何一行比列宽（参见[`--columns`](https://pandoc.org/MANUAL.html#option--columns)），则表格将占据整个文本宽度，单元格内容将换行，相对单元格宽度由表格标题和表格主体之间分隔线的虚线数量决定。（例如， `---|-`将第一列设置为整个文本宽度的 3/4，第二列设置为整个文本宽度的 1/4。）另一方面，如果没有行比列宽更宽，则单元格内容将不会换行，单元格将根据其内容调整大小。

示例：

```markdown
![[ ../../examples/pandoc-flavored-markdown/tables/pipe-tables.md ]]
```

::: rendered

![[ ../../examples/pandoc-flavored-markdown/tables/pipe-tables.md ]]

:::

#### Caveats

1. 在 Pandoc 表格中插入图片是支持的，而且相对简单。你可以使用标准的 Markdown 图片语法在表格的单元格中插入图片。

2. 在 Pandoc 中，直接在 Markdown 表格的单元格内插入多行围栏式代码块是不支持的。Pandoc 的标准 Markdown 表格语法（如 Pipe Tables、Simple Tables 和 Grid Tables）对单元格内容有一些限制。它们通常期望单元格内容是单行的，或者至少是不包含像围栏式代码块那样需要多行且有特定格式的块级元素。如果你尝试这样做，Pandoc 通常会将其解析为表格中断，或者将代码块视为表格之外的独立内容，导致表格结构被破坏。在 Pandoc Markdown 表格中直接插入多行围栏式代码块是不推荐且通常不可行的。Pandoc 的表格语法设计目的不是为了容纳这种复杂的块级内容。

3. 在 Pandoc 的 Markdown 表格中处理多行中文内容时，容易出现换行错乱、对齐错误或单元格溢出等问题。以下是具体原因和解决方案：

问题原因：

- 换行符不兼容：Pandoc 的 Markdown 表格默认用 `<br>` 或空格换行，但中文段落换行可能被忽略。
- 中文字符宽度计算错误：中文字符宽度是西文的 2 倍，导致自动列宽计算失效。
- 表格语法限制：Pandoc 的 pipe_tables（`|` 分隔表格）对多行支持较弱，尤其是跨行内容。

解决方法：

- 确保分隔线 `|---|` 的宽度足够（如 `|--------|`）。
- 在网格表格中用空行分隔段落。
  
示例：

```markdown
![[ ../../examples/pandoc-flavored-markdown/tables/multiline-chinese.md ]]
```

::: rendered

![[ ../../examples/pandoc-flavored-markdown/tables/multiline-chinese.md ]]

:::

