在使用 Pandoc 将 Markdown 文档转换为 PDF（通常通过 LaTeX）时，图片插入位置默认是**浮动的**（floating）。这是因为 Pandoc 在处理带有标题（caption）的图片时，会将其转换为 LaTeX 的 `figure` 环境，而 LaTeX 的 `figure` 环境默认是浮动环境，图片位置会根据 LaTeX 的排版规则自动调整，可能不严格遵循 Markdown 源文件中的位置。以下是详细说明：

### 1. 为什么图片位置是浮动的？
- **LaTeX 浮动机制**：Pandoc 将 Markdown 中的图片（带有标题）转换为 LaTeX 的 `\begin{figure}...\end{figure}` 环境。LaTeX 会根据页面空间、排版规则（如避免图片与文本重叠）将图片“浮动”到合适位置（如页面顶部、底部或下一页）。
- **默认浮动参数**：Pandoc 默认使用 `[htbp]` 浮动参数（表示“here, top, bottom, page”），允许 LaTeX 在当前位置（here）、页面顶部（top）、底部（bottom）或单独页面（page）放置图片。
- **影响因素**：图片大小、页面剩余空间、周围文本量等都会导致图片位置偏离 Markdown 源文件中的预期位置。

### 2. 如何控制图片插入位置？
如果你希望图片位置更接近 Markdown 源文件中的位置，或者完全固定（非浮动），可以通过以下方法调整：

#### 方法 1：使用 LaTeX 的 `[H]` 浮动参数
- **效果**：强制图片固定在 Markdown 源文件中指定的位置，禁用浮动。
- **实现方式**：
  1. 创建一个 LaTeX 文件（例如 `disable_float.tex`），内容如下：
     ```latex
     \usepackage{float}
     \makeatletter
     \def\fps@figure{H}
     \makeatother
     ```
  2. 在 Pandoc 命令中通过 `--include-in-header` 引入此文件：
     ```bash
     pandoc -H disable_float.tex input.md -o output.pdf
     ```
  3. 这会将所有 `figure` 环境的浮动参数设置为 `[H]`，强制图片固定在文本流中的位置。[](https://stackoverflow.com/questions/49482221/pandoc-markdown-to-pdf-image-position)[](https://stackoverflow.com/questions/49482221/pandoc-markdown-to-pdf-image-position/58840456)
- **注意**：使用 `[H]` 需要安装 LaTeX 的 `float` 包，且可能导致排版问题（如图片过大时溢出页面）。建议同时指定图片大小（见下文）。

#### 方法 2：调整图片大小
- **效果**：通过控制图片大小，避免因尺寸过大而被 LaTeX 推到下一页。
- **实现方式**：
  在 Markdown 中为图片指定宽度或高度属性。例如：
  ```markdown
  ![caption](image.png){width=50%}
  ```
  或：
  ```markdown
  ![caption](image.png){width=4in}
  ```
  Pandoc 会将这些属性转换为 LaTeX 的 `\includegraphics[width=0.5\textwidth]{image.png}`，从而控制图片大小，减少浮动问题。[](https://quarto.org/docs/authoring/figures.html)[](https://pandoc.org/chunkedhtml-demo/8.17-images.html)
- **注意**：如果未指定单位，默认单位为像素。可以通过 `--dpi` 选项调整像素到物理单位的转换（默认 96dpi）。[](https://superuser.com/questions/796565/correctly-sizing-png-images-in-markdown-with-pandoc-for-html-pdf-docx)

#### 方法 3：使用 `flafter` 包
- **效果**：确保图片不会出现在引用它的文本之前，改善阅读流畅性。
- **实现方式**：
  在 YAML 头部添加 `flafter` 包：
  ```yaml
  ---
  output:
    pdf_document:
      extra_dependencies: ["flafter"]
  ---
  ```
  这会加载 LaTeX 的 `flafter` 包，强制图片出现在引用文本之后。[](https://bookdown.org/yihui/rmarkdown-cookbook/figure-placement.html)

#### 方法 4：使用非浮动图片（内联图片）
- **效果**：将图片作为内联（inline）元素插入，禁用 `figure` 环境，完全固定位置，但会失去标题。
- **实现方式**：
  在 Markdown 中确保图片不在单独的段落中，例如添加一个空格或文本：
  ```markdown
  ![alt text](image.png) Some text
  ```
  或使用非换行空格：
  ```markdown
  ![alt text](image.png)\
  ```
  这会生成 LaTeX 的 `\includegraphics{}` 而非 `figure` 环境，图片将严格保持在文本流中，但无法添加标题。[](https://tex.stackexchange.com/questions/101725/latex-figures-appear-before-text-in-pandoc-markdown)[](https://pandoc.org/chunkedhtml-demo/8.17-images.html)

#### 方法 5：调整 LaTeX 浮动参数
- **效果**：通过修改 LaTeX 的浮动参数，增加图片留在当前位置的可能性。
- **实现方式**：
  创建一个 LaTeX 文件（例如 `float_adjustment.tex`），内容如下：
  ```latex
  \renewcommand{\topfraction}{0.85}
  \renewcommand{\bottomfraction}{0.7}
  \renewcommand{\textfraction}{0.15}
  \renewcommand{\floatpagefraction}{0.66}
  \setcounter{topnumber}{3}
  \setcounter{bottomnumber}{3}
  \setcounter{totalnumber}{4}
  ```
  使用 Pandoc 命令引入：
  ```bash
  pandoc -H float_adjustment.tex input.md -o output.pdf
  ```
  这些参数放宽了 LaTeX 的浮动限制，允许更多图片留在当前位置。[](https://bookdown.org/yihui/rmarkdown-cookbook/figure-placement.html)

### 3. 注意事项
- **标题与浮动**：如果图片需要标题，Pandoc 默认生成 `figure` 环境，导致浮动。想保留标题又固定位置，需使用 `[H]` 或自定义 LaTeX 模板。
- **排版问题**：强制固定位置（如 `[H]`）可能导致图片溢出页面或排版不佳，建议检查图片大小和页面布局。
- **多图片对齐**：若需多张图片并排显示，可以使用 LaTeX 的 `minipage` 或 `subfigure` 环境，通过 Pandoc 的原始 LaTeX 语法嵌入：
  ```markdown
  \begin{minipage}{\textwidth}
  \includegraphics[width=0.45\textwidth]{image1.png}
  \hfill
  \includegraphics[width=0.45\textwidth]{image2.png}
  \captionof{figure}{Caption for both images}
  \end{minipage}
  ```
  [](https://tex.stackexchange.com/questions/101725/latex-figures-appear-before-text-in-pandoc-markdown)[](https://stackoverflow.com/questions/15367332/how-to-use-pandoc-image-alignment-to-align-two-images-in-the-same-row)
- **Quarto 替代**：如果使用 Quarto（Pandoc 的扩展），可以通过 `fig-pos` 属性直接控制浮动位置，例如：
  ```markdown
  ![caption](image.png){fig-pos="H"}
  ```
  [](https://quarto.org/docs/authoring/figures.html)

### 4. 总结
- 默认情况下，Pandoc 转换到 PDF 时，带标题的图片会使用 LaTeX 的 `figure` 环境，导致位置浮动。
- 固定图片位置的方法包括使用 `[H]` 参数、调整图片大小、添加 `flafter` 包、或使用内联图片（无标题）。
- 推荐方法：结合 `[H]` 参数和图片大小调整，既保留标题又尽量固定位置，同时避免排版问题。

如果你有具体的 Markdown 文件或图片插入需求（例如需要标题、并排图片或特定位置），可以提供更多细节，我可以帮你定制解决方案或进一步测试！