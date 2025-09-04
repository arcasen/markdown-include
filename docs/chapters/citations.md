## 文献引用 Citations

Pandoc 支持文献引用，常用格式为 BibTeX 或 BibLaTeX，结合 Markdown 或 LaTeX 进行引用。Pandoc 支持通过 CSL（Citation Style Language）文件自定义引用文献风格，用于格式化参考文献和引文。Pandoc 支持多种文献数据格式，常用的是 BibTeX (.bib) 或 BibLaTeX，也支持 JSON、YAML 等格式。

### 创建 BibTeX 文件

创建一个名为 `references.bib` 的文件，内容如下：

```bibtex
![[ ../examples/citations/references.bib ]]
```

### CSL 文件

Pandoc 使用 CSL 文件定义引文和参考文献的格式。你可以从 CSL GitHub 仓库[^csl] 下载现成的 CSL 文件（如 APA、MLA、Chicago 等），或自定义 CSL 文件。例如：

[^csl]: <https://github.com/citation-style-language/styles>

- APA 风格：`apa.csl`
- Chicago 风格：`chicago-author-date.csl`

如果不指定 CSL 文件，Pandoc 默认使用 Chicago 作者-日期格式。

预览参考文献的风格：<https://www.zotero.org/styles>

以下是一些常见的 CSL 风格及其用途：

- **APA** (`apa.csl`)：心理学、社会科学常用，强调作者和年份。
- **MLA** (`modern-language-association.csl`)：人文学科，注重作者和标题。
- **Chicago** (`chicago-author-date.csl` 或 `chicago-note-bibliography.csl`)：历史学、文学等，分为作者-日期和笔记-书目两种。
- **IEEE** (`ieee.csl`)：工程技术领域，编号引文格式。

CSL 文件存储位置：

- Pandoc 有一个默认的数据目录，用于存储 CSL 文件、模板等资源。可以通过以下命令查 
  看 Pandoc 的数据目录：
   
  ```bash
  pandoc --version
  ```

  输出中会显示 `Default user data directory`，通常是：

    - Linux/macOS: `~/.pandoc/` 或 `~/.local/share/pandoc/`
    - Windows: `C:\Users\<用户名>\AppData\Roaming\pandoc\`
  
- 你可以将 CSL 文件放在这个目录下的 `csl/` 子文件夹中，例如 `~/.pandoc/csl/style.csl`。
- 放在这里后，Pandoc 可以直接识别文件名，无需指定完整路径。例如：

  ```bash
  pandoc input.md --csl=style.csl -o output.pdf
  ```

### 使用参考文献

#### 指定 .bib 文件和 .csl 文件

可以通过命令行选项设置，如：

`--bibliography=references.bib --csl=apa.csl`

或也可以通过 YAML 文件指定，见*[引文渲染]*：

```yaml
---
bibliography: references.bib
csl: apa.csl
---
```

#### 文献引用语法

语法：

`@knuth1997`

`@lamport1994, p. 310`

渲染效果与 CSL 格式有关。

#### 编译

运行以下 Pandoc 命令，将 Markdown 文件转换为目标格式（如 PDF 或 HTML）：

```bash
pandoc example.md --citeproc -o example.pdf
```

当与 `pandoc-crossref` 一起使用时，处理顺序很重要。通常情况下，你需要先运行 `pandoc-crossref`，然后再运行 `--citeproc`。这是因为 `pandoc-crossref` 使用了与 `--citeproc` 相似的 `[@...]` 引用语法，先运行 `pandoc-crossref` 可以避免两者之间的冲突。

```bash
pandoc example.md --filter pandoc-crossref --citeproc -o example.pdf
```

::: caution

`pandoc-crossref` 并不能为参考文献建立链接。

:::

#### `link-citations` 元数据

如果为 true，引文将超链接到对应的参考文献条目（仅适用于作者-日期和数字样式）。默认为 false。

在编译时加入：`-M link-citations=true` 或将 `link-citations=true` 写入元数据文件中（注意不是 defaults file）。

### 参考文献的位置

默认情况下，Pandoc 会将参考文献列表（由 `references.bib` 文件生成）自动放置在生成文档的末尾。这是学术写作的标准格式（如 APA、MLA、Chicago 等），因此也是 Pandoc 的默认行为。

如果你需要将参考文献放在其他位置怎么办？虽然不能通过一个简单的标记来改变位置，但有几种有效的方法可以实现你的需求：

#### 方法一：使用 `div` 包裹引用（推荐且标准）

这是最“Pandoc”的方式。你可以在你的 Markdown 主文件（例如 `paper.md`）中，**精确地指定**你希望参考文献列表出现的位置。

1.  在你希望参考文献出现的地方，插入一个特定的 `div` 容器，并为其设置一个唯一的 ID，例如 `#refs`。

    ```markdown
    # 正文内容

    这里是论文的正文内容，包含了各种引用 [@Author2020; @Scholar2018]。

    ## 参考文献

    ::: {#refs}
    :::

    ## 附录

    这里是附录内容。
    ```

2.  在使用 Pandoc 编译时，使用 `--citeproc` 或 `--filter=citeproc` 参数（它负责处理参考文献），Pandoc 会自动识别 `{#refs}` 这个特定的 div，并将生成的参考文献列表填充到里面。

    ```bash
    pandoc paper.md --bibliography=references.bib --citeproc -o paper.pdf
    # 或者使用 CSL 样式文件
    pandoc paper.md --bibliography=references.bib --csl chicago-author-date.csl --citeproc -o paper.pdf
    ```

关键点：`{#refs}` 这个 ID 是 `citeproc` 过滤器识别的一个**特殊信号**。当你使用它时，Pandoc 就不会再把参考文献放在文末，而是放在你指定的这个位置。

#### 方法二：后处理文档结构（更灵活但复杂）

如果方法一不满足需求，或者你需要更复杂的控制，可以采用“分体-合并”的策略。

1.  将文档分成两部分：主文 (`main.md`) 和附录 (`appendix.md`)。
2.  单独为主文生成带参考文献的文档：
    ```bash
    pandoc main.md --bibliography=references.bib --citeproc -o main_with_refs.md
    ```
    这会生成一个包含了正确格式参考文献的 Markdown 文件。
3.  合并文件：
    ```bash
    pandoc main_with_refs.md appendix.md -o final_paper.pdf
    ```

这种方法给你最大的灵活性，你可以把参考文献放在任何两个文件之间，但需要更多的步骤和文件管理。

#### 方法三：使用 LaTeX 指令（仅适用于 PDF/LaTeX 输出）

如果你输出的目标是 PDF（通过 LaTeX 引擎），你可以在 Markdown 文件中直接使用 LaTeX 命令来控制位置。

在你的 Markdown 文件中插入以下代码：

```markdown
# 正文内容

这里是论文的正文内容，包含了各种引用 [@Author2020; @Scholar2018]。

\begingroup
\renewcommand{\section}[2]{} % 可选：抑制参考文献部分的标题
\begin{thebibliography}{}
\end{thebibliography}
\endgroup

# 附录

这里是附录内容。
```

然后使用 Pandoc 编译：

```bash
pandoc paper.md --bibliography=references.bib --citeproc -o paper.pdf
```

Pandoc 的 `citeproc` 会将生成的参考文献列表填充到 `thebibliography` 环境中。注意：这种方法依赖于 LaTeX，因此只适用于输出格式为 PDF 的情况。
