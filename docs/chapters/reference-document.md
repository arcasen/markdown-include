## 使用样式参考文档

`--reference-doc` 是 Pandoc 中用于指定模板文档（docx、ODT 或 pptx 格式）的选项[^ref-doc]，可在转换为同类文件时保留模板的样式和格式。尤其适用于需要严格匹配 Word（.docx）、LibreOffice（.odt）或 PowerPoint（.pptx）模板的场景。基本用法：

[^ref-doc]: <https://pandoc.org/MANUAL.html#option--reference-doc>

```bash
pandoc input.md --reference-doc=reference.docx -o output.docx
```

这个命令会使用 `reference.docx` 中的样式来格式化 `output.docx`。

核心功能：

- 样式继承

  - Pandoc 会沿用参考文档中的样式（标题、列表、表格等）。
  - 适用于需要符合机构/学校模板要求的场景。

- 格式控制

  - 字体、页边距、页面大小、页眉/页脚等布局设置均从模板继承。

- 兼容性

  - 支持 .docx、.odt（LibreOffice）和 .pptx（演示文稿）。

### 参考 docx 文件

为了获得最佳结果，参考的 docx 文件应是使用 Pandoc 生成的 docx 文件的修改版本。参考 docx 文件的内容会被忽略，但其样式表和文档属性（包括边距、页面大小、页眉和页脚）将被用于新的 docx 文件。如果在命令行中未指定参考 docx 文件，Pandoc 将在用户数据目录（参见 `--data-dir` 选项）中查找名为 reference.docx 的文件。

`--reference-docx` 选项的参数应该是指向 reference.docx 文件的路径[^ref-dir]。如果你在数据目录（而非工作目录）中放置了一个 reference.docx 文件，并使用 `--reference-docx reference.docx` 命令，程序将无法找到该文件。这不是错误，而是设计如此。当不使用 `--reference-docx` 选项时，用户数据目录中的 reference.docx 文件会覆盖系统默认设置。

[^ref-dir]: https://github.com/jgm/pandoc/issues/2965

要创建自定义 reference.docx 文件，首先获取默认 reference.docx 文件的副本： `pandoc -o custom-reference.docx --print-default-data-file reference.docx` 。然后在 Word 中打开 custom-reference.docx，修改样式并保存文件。为获得最佳结果，除修改 Pandoc 使用的样式外，不要对该文件进行其他更改：

段落样式：

- 普通
- 正文
- 首段
- 紧凑
- 标题
- 副标题
- 作者
- 日期
- 摘要
- 摘要标题
- 参考文献
- 标题 1
- 标题 2
- 标题 3
- 标题 4
- 标题 5
- 标题 6
- 标题 7
- 标题 8
- 标题 9
- 块文本 [用于块引用]
- 脚注块文本 [用于脚注中的块引用]
- 源代码
- 脚注文本
- 定义术语
- 定义
- 说明文字
- 表格说明
- 图片说明
- 图表
- 带说明的图表
- 目录标题

字符样式：

- 默认段落字体
- 逐字字符
- 脚注引用
- 超链接
- 章节编号
  
表格样式：
 
- 表格

### 参考 pptx 文件

微软 PowerPoint 2013 包含的模板（扩展名为 .pptx 或 .potx）已知是可用的，大多数基于这些模板衍生的模板也是如此。

具体要求是模板必须包含以下名称的布局（在 PowerPoint 中可见）：

- 标题幻灯片
- 标题和内容
- 节标题
- 双内容
- 比较
- 带说明的内容
- 空白
  
对于每个名称，将使用找到的第一个具有该名称的布局。如果找不到某个名称的布局，Pandoc 将输出警告，并使用默认参考文档中该名称的布局。（这些布局的使用方式在 PowerPoint 布局选择中有描述。）

最近版本的 MS PowerPoint 包含的所有模板都符合这些标准。（您可以在“开始”菜单下点击“布局”来检查。）

您还可以修改默认的 reference.pptx：首先运行命令 `pandoc -o custom-reference.pptx --print-default-data-file reference.pptx` ，然后在 MS PowerPoint 中修改 custom-reference.pptx（Pandoc 将使用上述列出的布局名称）。

### pptx 分页

在使用 Pandoc 生成 PowerPoint（.pptx）文件时，可以通过在 Markdown 文件中设置标题级别或使用特定的分隔符来实现分页（即创建新的幻灯片）。以下是具体的方法和步骤：

#### 使用标题级别控制分页
   
Pandoc 在生成 pptx 时，会根据 Markdown 文件中的标题级别（#, ##, ### 等）来决定幻灯片的划分。默认情况下，Pandoc 使用最高级别标题之后有内容的标题级别作为幻灯片标题（slide level）。

示例：

```markdown
# 章节标题
## 第一页标题
这里是第一页的内容。
- 列表项 1
- 列表项 2

## 第二页标题
这里是第二页的内容。
- 列表项 A
- 列表项 B
```

说明：

- `#` 级别（H1）通常用作章节标题（title slide），表示一个部分的开始。
- `##` 级别（H2）被用作每页幻灯片的标题。
- 如果你希望更低级别的标题（如 `###`）作为幻灯片标题，可以通过 --slide-level 参数指定，例如：

  ```bash
  pandoc -t pptx --slide-level=3 input.md -o output.pptx
  ```

  这会将 `###` 作为幻灯片标题级别。

命令：

```bash
pandoc -t pptx input.md -o output.pptx
```

结果：

- 每个 `##` 标题会生成一个新的幻灯片，标题内容为 `##` 的文本，后面跟着该标题下的内容。

**注意**：

- 如果文档中没有足够的标题级别，Pandoc 会自动选择最高标题级别作为幻灯片标题。
- 如果你不想用标题来分页，可以设置 `--slide-level=0`，然后使用其他方式（如分隔符）来控制分页。

#### 使用分隔符手动分页

Pandoc 支持使用水平线（`---`）作为幻灯片的分隔符来手动分页。这种方式适用于不需要严格标题结构的场景。

示例：

```markdown
# 章节标题
## 第一页标题
这里是第一页的内容。
- 列表项 1
- 列表项 2

---

## 第二页标题
这里是第二页的内容。
- 列表项 A
- 列表项 B
```

说明：

- `---` 表示一个新的幻灯片开始。
- 在 PowerPoint 输出中，Pandoc 不需要额外的 `-s`（standalone）参数，因为 pptx 文件本身就是独立的。

命令：

```bash
pandoc -t pptx input.md -o output.pptx
```

结果：

- 每个 `---` 会创建一个新的幻灯片，`---` 之前的标题（如 `# 演示标题`）会成为演示文稿的标题页。
