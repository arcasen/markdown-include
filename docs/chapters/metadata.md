## 使用元数据 Metadata

### YAML 介绍

YAML 最初是 "Yet Another Markup Language" 的缩写，但后来为了强调其数据导向（而非标记语言）的特性，官方将其重新定义为 "YAML Ain't Markup Language"（一种递归缩写，即“YAML 不是标记语言”）。最初设计时，YAML 被视作类似 XML 的标记语言，但后来转向更简洁的 数据描述格式，专注于存储和传输结构化数据（如配置、API 请求等）。与 XML（标记语言）不同，YAML 避免使用标签（< >），而是依赖缩进和符号表示结构。

在 Pandoc 中，YAML 元数据是指文档开头的一段 YAML 格式的内容，用于描述文档的属性和元信息。通过读取 Pandoc 标记文件中的 YAML 元数据，我们可以获取文档的各种属性，如标题、作者、日期等，以及自定义的元信息。

当 Pandoc 生成独立文档时，会利用标题、作者等元数据来填充部分信息。这些数据通常不会在 Markdown 源文件中直接指定——毕竟 Markdown 语法本身并未提供定义此类元数据的标注方式——但您可以通过 `--metadata` 选项或 YAML 格式进行设置（具体方法见下文说明）。

严格来说，生成输出时会用到两种类型的变量：

- 通过 `--metadata` 指定的元数据(metadata)，
- 通过 `--variable` 指定的模板变量(variable)。

二者的核心区别在于：元数据可被 Pandoc 及其过滤器（即在最终格式化前处理输入内容的脚本）识别和处理，而模板变量仅作用于模板系统。若您通过 `--metadata` 标签或元数据头文件设置某个变量，该变量同样可供模板系统调用，因此通常只需使用元数据即可。虽然最终输出可能存在细微差异（因为过滤器可能对元数据进行特殊处理而忽略普通变量），但坚持使用单一类型选项显然更简便。除非有充分理由，否则建议统一采用元数据设置方式。

###  Pandoc 读取 YAML 元数据

读取 Pandoc 标记文件中的 YAML 元数据可以通过使用 Pandoc 提供的命令行参数或API来实现。以下是一个示例命令行使用方式：

```
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

注意：将 “CJKmainfont: 方正楷体_GBK” 写入 metadata.yaml 时, 会被解析成 “方正楷体\\_GBK”, 导致 \LaTeX 编译出错。这是因为 Pandoc 将其解析为 Markdown 格式 [^underscore_issue]，可以将相关代码直接以 `header-includes` 形式加入。

[^underscore_issue]: <https://github.com/jgm/pandoc/issues/2139>
