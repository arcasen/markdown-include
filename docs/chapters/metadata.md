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

上述命令中，`metadata.yaml` 是包含YAML元数据的文件，`input.md` 是待转换的标记文件，`output.html` 是转换后的输出文件。

在实际应用中，读取 Pandoc 标记文件中的 YAML 元数据可以用于自动化文档处理、生成静态网页、构建电子书等场景。通过提取元数据，我们可以根据文档属性进行个性化处理，如根据作者生成不同样式的页面，根据日期进行归档等。

Pandoc 命令中的几个相关选项：

`--metadata-file=FILE`

: Read metadata from the supplied YAML (or JSON) file. 

`-M KEY[=VAL], --metadata=KEY[:VAL]`

: Set the metadata field KEY to the value VAL.

`-V KEY[=VAL], --variable=KEY[:VAL]`

: Set the template variable KEY to the string value VAL when rendering the document in standalone mode.

### Pandoc 对元数据的解析

Pandoc 将其解析为 Markdown 格式[^meta-md]。我们可以执行命令 `pandoc -t native input.md` 来查看 Pandoc 的解析结果。

[^meta-md]: <https://github.com/jgm/pandoc/issues/2139>

::: caution

- 如果将 `CJKmainfont: 方正楷体_GBK` 写入 metadata.yaml 时, 会被解析成 `方正楷体\\_GBK`, 导致 \LaTeX 编译出错。
- 在 `header-includes` 加入 \LaTeX 代码时，有可能会解析成 Markdown 文本而发生错误。
- 能够正确以原始代码形式插入的是：`--include-in-header`、`--include-before-body` 和 `--include-after-body`。（见*[通用写入器选项]*）

:::

示例 1：含有下面的 \LaTeX 代码：

 ```markdown
 ![[ ../examples/metadata/latex-code-snippet-1.md]]
 ```

Pandoc 解析结果：

```haskell
![[ ../examples/metadata/latex-code-snippet-1.hs]]
```

示例 2： 含有下面的 \LaTeX 代码：

 ```markdown
 ![[ ../examples/metadata/latex-code-snippet-2.md]]
 ```

 Pandoc 解析结果：

 ```haskell
 ![[ ../examples/metadata/latex-code-snippet-2.hs]]
 ```

::: caution

后者 \LaTeX 代码被解析成字符串文本，编译时将出现错误。

:::

### `--include-in-header` 与 `header-includes`

Pandoc 的 `--include-in-header` 命令行选项允许将原始内容直接包含到生成输出文档的头部区域。此内容可以是目标文档格式头部中有效的任何内容，例如：

- \LaTeX 前导代码：为 PDF 输出添加自定义命令、包或设置。
- HTML `<head>` 元素：包括样式表（`<link>`）、脚本（`<script>`）或元标签。
- 其他特定于格式的头部元素：根据输出格式，此选项允许直接注入将出现在文档头部的内容。

该选项通常通过指定包含内容的文件名或直接以字符串形式提供内容来使用：

1. 使用文件：
   
   ```bash
   pandoc input.md --include-in-header=header.tex -o output.pdf
   ```

   在此示例中，`header.tex` 的内容将被插入到生成的 `output.pdf` 的 \LaTeX 前导代码中。

2. 直接提供内容：
   
   ```bash
   pandoc input.md --include-in-header='<style>body { color: blue; }</style>' -o output.html
   ```

   在此示例中，CSS 样式定义被直接插入到 `output.html` 的 `<head>` 部分。

::: caution

Pandoc `--include-in-header` 选项直接修改使用的模板，允许对文档头部内容进行精细控制。

- 如果同时存在 `header-includes` 元数据变量或在过滤器中写入 `header-includes` 变量
  （见*[过滤器 Filters]*，则该元数据将被 `--include-in-header` 文件内容覆盖，见：

  - <https://github.com/jgm/pandoc/issues/3139>
  - <https://github.com/jgm/pandoc/issues/3138>

- 由于 Pandoc 会自动设置一些 `header-includes` 变量（见*[自动设置的变量]*），建议使用 `--include-in-header` 时先包含这部分代码，见<https://github.com/arcasen/markdown-include/blob/main/preamble.tex>。

:::

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

特殊说明：

- 如果同时使用多个来源定义同一个变量，Pandoc 会按照上述优先级采用值
- YAML 元数据块中可以包含复杂结构（如列表、嵌套对象），而命令行参数只适合简单键值对
- 可以通过 `--variable` (`-V`) 定义的变量属于 \LaTeX 模板变量系统，与元数据系统不同但可能有交互

建议实践：

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
| 影响范围     | 控制整个转换流程（格式、模板等） | 仅设置文档元数据          |
| 文件内容     | Pandoc 选项 + 元数据             | 仅元数据                  |
| 优先级       | 低于命令行选项                   | 与文档内元数据合并        |
| 常用字段示例  | `from`, `to`, `filters`          | `title`, `author`, `date` |

示例：结合使用两者

```bash
pandoc -d defaults.yaml --metadata-file meta.yaml input.md -o output.pdf
```

- `defaults.yaml` 定义转换规则（如 PDF 模板、字体）。
- `meta.yaml` 定义文档内容相关的元数据（如标题、作者）。
