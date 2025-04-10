## 使用元数据 Metadata

YAML 最初是 "Yet Another Markup Language" 的缩写，但后来为了强调其数据导向（而非标记语言）的特性，官方将其重新定义为 "YAML Ain't Markup Language"（一种递归缩写，即“YAML 不是标记语言”）。最初设计时，YAML 被视作类似 XML 的标记语言，但后来转向更简洁的 数据描述格式，专注于存储和传输结构化数据（如配置、API 请求等）。与 XML（标记语言）不同，YAML 避免使用标签（< >），而是依赖缩进和符号表示结构。

在 Pandoc 中，YAML 元数据是指文档开头的一段 YAML 格式的内容，用于描述文档的属性和元信息。通过读取 Pandoc 标记文件中的 YAML 元数据，我们可以获取文档的各种属性，如标题、作者、日期等，以及自定义的元信息。

读取 Pandoc 标记文件中的 YAML 元数据可以通过使用 Pandoc 提供的命令行参数或API来实现。以下是一个示例命令行使用方式：

```
pandoc --metadata-file=metadata.yaml input.md -o output.html
```

上述命令中，metadata.yaml 是包含YAML元数据的文件，input.md 是待转换的标记文件，output.html 是转换后的输出文件。

在实际应用中，读取 Pandoc 标记文件中的 YAML 元数据可以用于自动化文档处理、生成静态网页、构建电子书等场景。通过提取元数据，我们可以根据文档属性进行个性化处理，如根据作者生成不同样式的页面，根据日期进行归档等。

Pandoc 命令中的几个相关选项：

`--metadata-file=FILE`
: Read metadata from the supplied YAML (or JSON) file. This option can be used with every input format, but string scalars in the metadata file will always be parsed as Markdown. (If the input format is Markdown or a Markdown variant, then the same variant will be used to parse the metadata file; if it is a non-Markdown format, pandoc’s default Markdown extensions will be used.) This option can be used repeatedly to include multiple metadata files; values in files specified later on the command line will be preferred over those specified in earlier files. Metadata values specified inside the document, or by using -M, overwrite values specified with this option. The file will be searched for first in the working directory, and then in the metadata subdirectory of the user data directory (see --data-dir).

`-M KEY[=VAL], --metadata=KEY[:VAL]`
: Set the metadata field KEY to the value VAL. A value specified on the command line overrides a value specified in the document using YAML metadata blocks. Values will be parsed as YAML boolean or string values. If no value is specified, the value will be treated as Boolean true. Like --variable, --metadata causes template variables to be set. But unlike --variable, --metadata affects the metadata of the underlying document (which is accessible from filters and may be printed in some output formats) and metadata values will be escaped when inserted into the template.

`-V KEY[=VAL], --variable=KEY[:VAL]`
: Set the template variable KEY to the string value VAL when rendering the document in standalone mode. If no VAL is specified, the key will be given the value true. Structured values (lists, maps) cannot be assigned using this option, but they can be assigned in the variables section of a defaults file.

注意：`CJKmainfont="方正楷体_GBK"` 写入 metadata.yaml 时, 会被解析成 "方正楷体\_GBK", 导致编译出错。
