Pandoc 支持文献引用，常用格式为 BibTeX 或 BibLaTeX，结合 Markdown 或 LaTeX 进行引用。以下是一个简单的 Pandoc 文献引用示例：

### 1. 准备 BibTeX 文件
创建一个名为 `references.bib` 的文件，内容如下：

```bib
@book{knuth1997,
  author = {Donald E. Knuth},
  title = {The Art of Computer Programming, Volume 1: Fundamental Algorithms},
  year = {1997},
  publisher = {Addison-Wesley},
  address = {Reading, MA}
}

@article{lamport1994,
  author = {Leslie Lamport},
  title = {LaTeX: A Document Preparation System},
  journal = {Software: Practice and Experience},
  volume = {24},
  number = {3},
  year = {1994},
  pages = {307--317}
}
```

### 2. Markdown 文件
创建一个 Markdown 文件，例如 `document.md`，内容如下：

```markdown
# 示例文档

这是对 Knuth 的引用[@knuth1997]。  
Lamport 的 LaTeX 系统也很重要[@lamport1994, p. 310]。

# 参考文献

[^bib]: 这里会自动生成参考文献列表。
```

### 3. 使用 Pandoc 编译
运行以下 Pandoc 命令，将 Markdown 文件转换为目标格式（如 PDF 或 HTML）：

```bash
pandoc document.md --bibliography=references.bib --citeproc -o output.pdf
```

- `--bibliography=references.bib`：指定 BibTeX 文件。
- `--citeproc`：启用 Pandoc 的引用处理功能。

### 4. 输出结果
生成的 PDF（或 HTML）会包含引用的格式化内容和参考文献列表，例如：

```
示例文档
这是对 Knuth 的引用 (Knuth, 1997)。
Lamport 的 LaTeX 系统也很重要 (Lamport, 1994, p. 310)。

参考文献
Knuth, D. E. (1997). The Art of Computer Programming, Volume 1: Fundamental Algorithms. Reading, MA: Addison-Wesley.

Lamport, L. (1994). LaTeX: A Document Preparation System. Software: Practice and Experience, 24(3), 307–317.
```

### 5. 自定义引用样式
如果需要特定的引用样式（如 APA、MLA），可以指定 CSL 文件：

```bash
pandoc document.md --bibliography=references.bib --citeproc --csl=apa.csl -o output.pdf
```

CSL 文件可从 [Zotero Style Repository](https://www.zotero.org/styles) 下载。

### 注意事项
- 确保 `pandoc` 和 `pandoc-citeproc` 已安装。
- BibTeX 文件中的 `key`（如 `knuth1997`）用于 Markdown 中的引用标识 `[@key]`。
- 如果输出为 PDF，需安装 LaTeX（如 TeX Live 或 MiKTeX）。

更多详情可参考 [Pandoc 官方文档](https://pandoc.org/MANUAL.html#citations)。

---

注：Pandoc now uses the `citeproc` library, and no external filter `pandoc-crossref` is needed.

pandoc-crossref 主要用于交叉引用文档中的图表、公式、代码块和章节等元素，**它本身并不能直接交叉引用参考文献（bibliography）**。

pandoc-crossref 的设计重点在于自动编号和引用文档内部的这些特定元素。

**要实现参考文献的交叉引用，通常需要结合 Pandoc 的另一个强大功能：`pandoc-citeproc`。**

以下是如何将两者结合起来以实现包含交叉引用的文档：

1.  **使用 Pandoc 的标准引用语法：** 在 Markdown 或其他 Pandoc 支持的格式中，使用 `[@citation_key]` 的语法来引用你的参考文献。这些 `citation_key` 需要与你的 bibliography 文件（例如 `.bib` 文件）中的条目相对应。

2.  **使用 `pandoc-citeproc` 处理参考文献：** 在 Pandoc 转换文档时，使用 `--filter pandoc-citeproc` 选项。`pandoc-citeproc` 会读取你的 bibliography 文件，并根据你指定的引用样式（通过 `--csl` 选项）格式化参考文献和文内引用。它会生成包含参考文献列表的文档。

3.  **`pandoc-crossref` 处理其他交叉引用：** 同时使用 `--filter pandoc-crossref` 选项来处理图表、公式、章节等的交叉引用。你需要按照 `pandoc-crossref` 的语法为这些元素添加标签（例如 `{#fig:myfigure}`，`{#eq:myequation}`，`{#sec:mysection}`），然后使用 `[@fig:myfigure]`，`[@eq:myequation]`，`[@sec:mysection]` 的语法进行引用。

**处理顺序很重要：** 通常情况下，你需要先运行 `pandoc-crossref`，然后再运行 `pandoc-citeproc`。这是因为 `pandoc-crossref` 使用了与 `pandoc-citeproc` 相似的 `[@...]` 引用语法，先运行 `pandoc-crossref` 可以避免两者之间的冲突。

**总结来说：**

* **`pandoc-crossref`**: 用于交叉引用图表、公式、代码块和章节等文档内部元素。
* **`pandoc-citeproc`**: 用于处理参考文献的引用和生成 bibliography。

要实现包含交叉引用的参考文献的完整工作流程，你需要同时使用这两个 Pandoc 滤镜。`pandoc-crossref` 本身不具备直接交叉引用参考文献的功能。