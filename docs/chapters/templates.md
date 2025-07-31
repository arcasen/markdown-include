## 使用模板 Templates

当使用 `-s/--standalone` 选项时，Pandoc 会使用模板添加独立文档所需的头部和尾部内容。要查看使用的默认模板[^default-templates]，只需输入：  

[^default-templates]: <https://github.com/jgm/pandoc-templates>

```bash
pandoc -D <FORMAT>
```

其中 `FORMAT` 是输出格式的名称。可以使用 `--template` 选项指定自定义模板。

| 输出格式          |    模板名称      |
| :-------------: | :-------------: |
|   pdf           |  default.latex  |
|   docx          | default.openxml |
|   html          |  default.html   |

::: caution

`docx`、`odt` 和 `pptx` 输出还可以通过 `--reference-doc` 选项进行自定义。使用参考文档调整文档样式；使用模板处理变量插值、自定义元数据的呈现、目录位置、样板文本等。

:::

模板包含变量，允许在文件的任意位置插入任意信息。变量可通过 `-V/--variable` 选项在命令行设置。如果变量未设置，Pandoc 会在文档的元数据中查找键，元数据可通过 YAML 元数据块或 `-M/--metadata` 选项设置。此外，Pandoc 会为某些变量赋予默认值[^default-meta]。

[^default-meta]: 为利用 Pandoc 这些默认值，最好通过修改 default.latex 或 eisvogel.latex 来自定义模板。例如：当 Markdown 文件中含有图片时，Pandoc 会设置 `graphics: true`，从而包含 `\usepackage{graphicx}` 等命令。

如果使用自定义模板，可能需要随着 Pandoc 的更新而修订模板。建议跟踪默认模板的变化，并相应修改自定义模板。

![[ templates/template-syntax.md ]]

![[ templates/variables.md ]]
