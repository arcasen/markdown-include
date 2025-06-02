Pandoc 支持文献引用（bibliography citation），主要通过其内置的引用处理功能实现。它可以解析 Markdown 中的引用语法，并结合外部书目文件（例如 BibTeX 或 CSL JSON 格式）生成格式化的参考文献和引文。这对于学术写作或需要标准引文格式的文档非常有用。

以下是如何在 Pandoc 中使用文献引用的详细步骤：

### 1. 准备书目文件
Pandoc 支持多种书目文件格式，最常用的是 BibTeX（`.bib` 文件）。你需要先准备一个书目文件，包含你的参考文献条目。

#### 示例 BibTeX 文件（`references.bib`）
```bibtex
@book{knuth1997,
  author = {Donald E. Knuth},
  title = {The Art of Computer Programming, Volume 1: Fundamental Algorithms},
  year = {1997},
  publisher = {Addison-Wesley},
  address = {Reading, MA}
}

@article{smith2020,
  author = {John Smith},
  title = {A Study on Algorithms},
  journal = {Journal of Computing},
  year = {2020},
  volume = {15},
  pages = {123--145}
}
```

### 2. 在 Markdown 中添加引用
Pandoc 使用 CSL（Citation Style Language）语法来表示引文。引用通常以 `@` 开头，后面跟上书目文件中条目的 ID。以下是常见的引用方式：

#### 示例 Markdown 文件（`input.md`）
```markdown
# My Document

This is a statement backed by Knuth [@knuth1997]. For more details, see Smith [-@smith2020, p. 130].

Multiple citations can be combined like this [@knuth1997; @smith2020].

## References
```

- `@knuth1997`：直接引用 Knuth 的书，生成带括号的引文（例如 `(Knuth 1997)`）。
- `[-@smith2020, p. 130]`：抑制作者名，仅显示年份和页码（例如 `2020, p. 130`），常用于叙述性引用。
- `[@knuth1997; @smith2020]`：多个引文用分号分隔。

### 3. 指定书目文件和 CSL 样式
在运行 Pandoc 时，需要通过命令行参数指定书目文件和引文样式：
- `--bibliography`：指定书目文件。
- `--citeproc`：启用 Pandoc 的引用处理器（citeproc）。
- `--csl`（可选）：指定 CSL 样式文件，控制引文和参考文献的格式。如果不指定，默认使用 Chicago 著者-日期格式。

#### 基本命令
```bash
pandoc input.md --bibliography references.bib --citeproc -o output.pdf
```

#### 使用特定 CSL 样式
CSL 样式文件可以从 [Zotero Style Repository](https://www.zotero.org/styles) 下载。例如，使用 APA 样式：
```bash
pandoc input.md --bibliography references.bib --citeproc --csl apa.csl -o output.pdf
```

### 4. 输出结果
运行上述命令后，Pandoc 会：
1. 将 Markdown 中的引用替换为格式化的引文。
2. 在文档末尾自动生成“References”或“Bibliography”部分，列出所有引用的文献。

#### 示例输出（PDF 或 HTML）
假设使用 APA 样式，生成的输出可能如下：
```
This is a statement backed by Knuth (1997). For more details, see Smith (2020, p. 130).

Multiple citations can be combined like this (Knuth, 1997; Smith, 2020).

References
Knuth, D. E. (1997). The art of computer programming, volume 1: Fundamental algorithms. Addison-Wesley.

Smith, J. (2020). A study on algorithms. Journal of Computing, 15, 123–145.
```

### 5. 高级用法
#### 元数据配置
你可以在 Markdown 文件的 YAML 元数据块中指定书目文件和 CSL 样式，避免在命令行中重复输入：

```markdown
---
title: My Document
bibliography: references.bib
csl: apa.csl
---

This is a statement backed by Knuth [@knuth1997].
```

命令简化为：
```bash
pandoc input.md --citeproc -o output.pdf
```

#### 自定义参考文献标题
默认情况下，参考文献部分的标题是“References”。你可以通过在 Markdown 中手动添加标题（例如 `## References`）来控制其位置和名称，或者在 YAML 中指定：
```markdown
---
reference-section-title: Bibliography
---
```

#### 行内引用
如果不想生成单独的参考文献部分，可以使用行内引用。例如：
```markdown
Knuth wrote a famous book [@knuth1997, p. 50].
```
配合 `--citeproc` 和书目文件，引文会直接嵌入文本中。

### 6. 注意事项
- **书目文件格式**：除了 BibTeX，Pandoc 还支持 CSL JSON、CSL YAML 等格式，但 BibTeX 是最常用的。
- **CSL 样式**：如果不指定 `--csl`，Pandoc 默认使用 Chicago 著者-日期格式。常见的样式包括 `apa.csl`、`ieee.csl`、`mla.csl` 等。
- **依赖工具**：生成 PDF 时需要 LaTeX 环境（如 TeX Live）。如果只生成 HTML，则无需额外依赖。
- **调试**：如果引文未正确解析，检查书目文件中条目 ID 是否与 Markdown 中的引用一致。

### 7. 示例完整工作流
1. 创建 `input.md`：
   ```markdown
   ---
   bibliography: references.bib
   csl: apa.csl
   ---

   # My Document

   Knuth says hello [@knuth1997]. Smith agrees [-@smith2020].
   ```

2. 创建 `references.bib`（如上）。
3. 下载 `apa.csl`（从 Zotero 网站）。
4. 运行命令：
   ```bash
   pandoc input.md --citeproc -o output.pdf
   ```

5. 检查生成的 PDF 文件。

### 总结
Pandoc 的文献引用功能强大且灵活，只需准备好书目文件、在 Markdown 中使用 `@` 语法引用，然后通过 `--citeproc` 和相关参数生成格式化输出即可。无论是 PDF、HTML 还是其他格式，都能轻松实现标准化的引文管理。

如果有具体问题（例如某样式不起作用或引用未显示），可以告诉我，我会帮你排查！