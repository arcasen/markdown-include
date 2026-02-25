## 数学公式 Mathematical Expressions

数学公式包含两种：

Inline math

: 即**行内公式**或**内联公式**，指的是将数学公式嵌入到文本段落的行内，与其他文本内容混合排列。在 \LaTeX 中，行内公式通常用单个美元符号 `$` 包裹。

Displayed math

: 即**行间公式**或**显示公式**，指的是将数学公式单独占据一行显示，通常会居中排列，并且比行内公式具有更大的视觉突出性。在 \LaTeX 中，行间公式通常用双美元符号 `$$` 包裹。

总而言之，行内公式用于在文本中简短地插入数学表达式，而行间公式则用于更重要或更复杂的数学公式，使其在文档中更加醒目。

Pandoc 生成 HTML 或 EPUB 需要使用 MathML 或 MathJax，如：

```bash
pandoc -s --mathjax -o document.epub document.md
```

Pandoc 生成 docx 时将使用 OMML 数学标记来呈现：

```bash
pandoc -s -o document.docx document.md
```

Pandoc 生成 \LaTeX 时将逐字显示，周围环绕着`\(...\)`（行内公式）或`\[...\]`（行间公式）。

Pandoc 生成 PDF 时先调用 \LaTeX 引擎。

![[ math/inline-math.md ]]

![[ math/displayed-math.md ]]