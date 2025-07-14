## 使用元数据 Metadata

在 Pandoc 中，YAML 元数据是指文档开头的一段 YAML 格式的内容，用于描述文档的属性和元信息。通过读取 Pandoc 标记文件中的 YAML 元数据，我们可以获取文档的各种属性，如标题、作者、日期等，以及自定义的元信息。

当 Pandoc 生成独立文档时，会利用标题、作者等元数据来填充部分信息。这些数据通常不会在 Markdown 源文件中直接指定——毕竟 Markdown 语法本身并未提供定义此类元数据的标注方式——但您可以通过 `--metadata` 选项或 YAML 格式进行设置（具体方法见下文说明）。

严格来说，生成输出时会用到两种类型的变量：

- 通过 `--metadata` 指定的元数据(metadata)，
- 通过 `--variable` 指定的模板变量(variable)。

二者的核心区别在于：元数据可被 Pandoc 及其过滤器（即在最终格式化前处理输入内容的脚本）识别和处理，而模板变量仅作用于模板系统。若您通过 `--metadata` 标签或元数据头文件设置某个变量，该变量同样可供模板系统调用，因此通常只需使用元数据即可。虽然最终输出可能存在细微差异（因为过滤器可能对元数据进行特殊处理而忽略普通变量），但坚持使用单一类型选项显然更简便。除非有充分理由，否则建议统一采用元数据设置方式。

### 读取 YAML 元数据

读取 Pandoc 标记文件中的 YAML 元数据可以通过使用 Pandoc 提供的命令行参数或 API 来实现。以下是一个示例命令行使用方式：

```bash
pandoc --metadata-file=metadata.yaml input.md -o output.html
```

上述命令中，metadata.yaml 是包含YAML元数据的文件，input.md 是待转换的标记文件，output.html 是转换后的输出文件。

在实际应用中，读取 Pandoc 标记文件中的 YAML 元数据可以用于自动化文档处理、生成静态网页、构建电子书等场景。通过提取元数据，我们可以根据文档属性进行个性化处理，如根据作者生成不同样式的页面，根据日期进行归档等。

Pandoc 命令中的几个相关选项：

`--metadata-file=FILE`

: Read metadata from the supplied YAML (or JSON) file. 

`-M KEY[=VAL], --metadata=KEY[:VAL]`

: Set the metadata field KEY to the value VAL.

`-V KEY[=VAL], --variable=KEY[:VAL]`

: Set the template variable KEY to the string value VAL when rendering the document in standalone mode.

**注意**：将 “CJKmainfont: 方正楷体_GBK” 写入 metadata.yaml 时, 会被解析成 “方正楷体\\_GBK”, 导致 LaTeX 编译出错。这是因为 Pandoc 将其解析为 Markdown 格式 [^underscore_issue]，可以将相关代码直接以 `header-includes` 形式加入。

[^underscore_issue]: <https://github.com/jgm/pandoc/issues/2139>

### 命令行选项、元数据块和元数据文件的优先顺序

在 Pandoc 中，元数据（metadata）的优先级遵循以下规则（从高到低）：

1. 命令行参数 (`--metadata` 或 `-M` 选项)
   - 最高优先级，会覆盖其他来源的同名元数据，例如：`pandoc -M title="New Title"`

2. YAML 元数据块 (位于文档头部)
   - 中等优先级，会被命令行参数覆盖，但会覆盖外部元数据文件
   - 例如：
     ```markdown
     ---
     title: Document Title
     author: John Doe
     ---
     ```

3. 外部元数据文件 (`--metadata-file` 或 `-d` 选项)
   - 最低优先级，会被以上两者覆盖
   - 例如：`pandoc --metadata-file=meta.yaml`

**特殊说明**：

- 如果同时使用多个来源定义同一个变量，Pandoc 会按照上述优先级采用值
- YAML 元数据块中可以包含复杂结构（如列表、嵌套对象），而命令行参数只适合简单键值对
- 可以通过 `--variable` (`-V`) 定义的变量属于 LaTeX 模板变量系统，与元数据系统不同但可能有交互

**建议实践**：

- 将通用元数据放在外部 YAML 文件中
- 文档特定的元数据放在文档头部的 YAML 块中
- 需要临时覆盖时使用命令行参数

### `--defaults`/`-d` 与 `--metadata-file`

Pandoc 的 `-d`（`--defaults`）和 `--metadata-file` 选项都用于从外部文件加载配置，但它们的用途和功能有显著区别：

1. `-d` / `--defaults`（默认配置文件）的用途：定义 Pandoc 转换的全局默认选项（如输入/输出格式、模板、变量、过滤器等）。

2. `--metadata-file`（元数据文件）的用途：仅用于定义文档的元数据（如标题、作者、日期等），不影响转换行为。

: `--defaults`/`-d` 与 `--metadata-file` 关键区别对比

| 特性             | `-d` / `--defaults`              | `--metadata-file`         |
| ---------------- | -------------------------------- | ------------------------- |
| **影响范围**     | 控制整个转换流程（格式、模板等） | 仅设置文档元数据          |
| **文件内容**     | Pandoc 选项 + 元数据             | 仅元数据                  |
| **优先级**       | 低于命令行选项                   | 与文档内元数据合并        |
| **常用字段示例** | `from`, `to`, `filters`          | `title`, `author`, `date` |

示例：结合使用两者

```bash
pandoc -d defaults.yaml --metadata-file meta.yaml input.md -o output.pdf
```

- `defaults.yaml` 定义转换规则（如 PDF 模板、字体）。
- `meta.yaml` 定义文档内容相关的元数据（如标题、作者）。

### 内置默认元数据

在使用 Pandoc 将文档转换为 PDF 时，Pandoc 会根据输入文件的内容、元数据（metadata）以及使用的模板自动生成一些变量。这些变量主要用于模板渲染，特别是在 LaTeX 或其他模板中生成 PDF 时。 例如，即使不设置 `header-includes`， Pandoc 也会有默认的元数据，可以查看生成的 LaTeX 即知。在元数据中定义了：

- `figurename`
- `tablename`
- `listfigurename`
- `listtablename`
- `lstlistlistingname`
- 等等

如果在文档中重新设置 `header-includes`，将被置于内置的 `header-includes` 之前，无法修改这些默认元数据。在 Stenciler 模板[^stenciler-url]中，在 `header-includes` 之后增加 `header-continue`。这样，我们就可以在文档中设置新的数据，如：

```yaml
header-continue: |
  \AtBeginDocument{%
    \renewcommand*\figurename{图}
    \renewcommand*\tablename{表}
    \renewcommand*\lstlistingname{代码}
    \renewcommand*\listfigurename{图表清单}
    \renewcommand*\listtablename{表格清单}
    \renewcommand*\lstlistlistingname{代码清单}
  }
```

[^stenciler-url]: <https://github.com/arcasen/markdown-include/tree/main/templates>
