## 模板与模板语法

当使用 `-s/--standalone` 选项时，Pandoc 会使用模板添加独立文档所需的头部和尾部内容。要查看使用的默认模板[^default-templates]，只需输入：  

[^default-templates]: https://github.com/jgm/pandoc-templates

```bash
pandoc -D <FORMAT>
```

其中 `FORMAT` 是输出格式的名称。可以使用 `--template` 选项指定自定义模板。

| 输出格式 | 模板名称 |
| :---: | :---: |
| pdf | default.latex |
| docx | default.openxml |
| html | default.html |

注意：`docx`、`odt` 和 `pptx` 输出还可以通过 `--reference-doc` 选项进行自定义。使用参考文档调整文档样式；使用模板处理变量插值、自定义元数据的呈现、目录位置、样板文本等。

模板包含变量，允许在文件的任意位置插入任意信息。变量可通过 `-V/--variable` 选项在命令行设置。如果变量未设置，Pandoc 会在文档的元数据中查找键，元数据可通过 YAML 元数据块或 `-M/--metadata` 选项设置。此外，Pandoc 会为某些变量赋予默认值[^default-meta]。

[^default-meta]: 为利用 Pandoc 这些默认值，最好通过修改 default.latex 或 eisvogel.latex 来自定义模板。例如：当 Markdown 文件中含有图片时，Pandoc 会设置 `graphics: true`，从而包含 `\usepackage{graphicx}` 等命令。

如果使用自定义模板，可能需要随着 Pandoc 的更新而修订模板。建议跟踪默认模板的变化，并相应修改自定义模板。

### 注释  

从 `$--` 到行末的任何内容都被视为注释，将从输出中省略。

### 分隔符  

在模板中标记变量和控制结构时，可使用 `$…$` 或 `${…}` 作为分隔符。同一模板中可混合使用这两种样式，但每个分隔符的开头和结尾必须匹配。开头分隔符后可跟一个或多个空格或制表符，这些将被忽略。结尾分隔符前也可有空格或制表符，同样会被忽略。

要在文档中包含字面 `$`，请使用 `$$`。

### 插值变量  

插值变量的占位符是一个由匹配分隔符包围的变量名。变量名必须以字母开头，可包含字母、数字、`_`、`-` 和 `.`。关键字 `it`、`if`、`else`、`endif`、`for`、`sep` 和 `endfor` 不可用作变量名。示例：  

```latex
$foo$
$foo.bar.baz$
$foo_bar.baz-bim$
$ foo $
${foo}
${foo.bar.baz}
${foo_bar.baz-bim}
${ foo }
```

带点的变量名用于访问结构化变量值。例如，`employee.salary` 将返回 `employee` 字段值中 `salary` 字段的值。

- 如果变量值是简单值，将按原样呈现（注意，不会进行转义；假设调用程序会为输出格式适当转义字符串）。
- 如果变量值是列表，则将连接所有值。
- 如果变量值是映射，则呈现字符串 `true`。
- 其他所有值将呈现为空字符串。

### 条件语句  

条件语句以 `if(variable)`（由匹配分隔符包围）开始，以 `endif`（由匹配分隔符包围）结束。可选择包含 `else`（由匹配分隔符包围）。如果变量值为真，则使用 `if` 部分；否则使用 `else` 部分（如果存在）。以下值视为真：  

- 任何映射
- 包含至少一个真值的数组
- 任何非空字符串
- 布尔值 `True`  

注意：在 YAML 元数据（或通过 `-M/--metadata` 在命令行指定的元数据）中，未加引号的 `true` 和 `false` 将被解释为布尔值。但通过 `-V/--variable` 在命令行指定的变量始终为字符串值。因此，`if(foo)` 条件在 `-V foo=false` 时会被触发，但在 `-M foo=false` 时不会触发。

示例：  

```latex
$if(foo)$bar$endif$

$if(foo)$
  $foo$
$endif$

$if(foo)$
part one
$else$
part two
$endif$

${if(foo)}bar${endif}

${if(foo)}
  ${foo}
${endif}

${if(foo)}
${ foo.bar }
${else}
no foo!
${endif}
```

关键字 `elseif` 可用于简化复杂的嵌套条件：  

```latex
$if(foo)$
XXX
$elseif(bar)$
YYY
$else$
ZZZ
$endif$
```

### 循环  

循环以 `for(variable)`（由匹配分隔符包围）开始，以 `endfor`（由匹配分隔符包围）结束。

- 如果变量是数组，循环内的内容将重复执行，变量依次设置为数组的每个值，并连接结果。
- 如果变量是映射，循环内的内容将设置为该映射。
- 如果关联变量的值不是数组或映射，将对其值执行单次迭代。

示例：  

```latex
$for(foo)$$foo$$sep$, $endfor$

$for(foo)$
  - $foo.last$, $foo.first$
$endfor$

${ for(foo.bar) }
  - ${ foo.bar.last }, ${ foo.bar.first }
${ endfor }

$for(mymap)$
$it.name$: $it.office$
$endfor$
```

可通过 `sep`（由匹配分隔符包围）指定连续值之间的分隔符。`sep` 和 `endfor` 之间的内容为分隔符。

```latex
${ for(foo) }${ foo }${ sep }, ${ endfor }
```

在循环中，可使用特殊代词关键字 `it` 代替变量名。

```latex
${ for(foo.bar) }
  - ${ it.last }, ${ it.first }
${ endfor }
```

### 部分模板

部分模板（存储在不同文件中的子模板）可通过部分模板名称后跟 `()` 包含，例如：  

```latex
${ styles() }
```

部分模板将在主模板所在目录中查找。如果文件名没有扩展名，将假设与主模板的扩展名相同。调用部分模板时，也可使用包含文件扩展名的完整名称：  

```latex
${ styles.html() }
```

（如果在模板目录中未找到部分模板，且模板路径为相对路径，还将在用户数据目录的 `templates` 子目录中查找。）  

部分模板可通过冒号应用于变量：  

```latex
${ date:fancy() }

${ articles:bibentry() }
```

如果 `articles` 是数组，将对其值迭代，依次应用 `bibentry()` 部分模板。因此，上述第二个示例等价于：  

```latex
${ for(articles) }
${ it:bibentry() }
${ endfor }
```

注意，迭代部分模板时，必须使用代词关键字 `it`。在上述示例中，`bibentry` 部分模板应包含 `it.title`（依此类推），而不是 `articles.title`。

包含的部分模板会省略末尾换行符。

部分模板可包含其他部分模板。

数组值之间的分隔符可在变量名或部分模板后立即用方括号指定：  

```latex
${months[, ]}

${articles:bibentry()[; ]}
```

此处的分隔符为字面值（与显式 `for` 循环中的 `sep` 不同），不能包含插值变量或其他模板指令。

### 嵌套  

为确保内容“嵌套”（即后续行缩进），使用 `^` 指令：  

```latex
$item.number$  $^$$item.description$ ($item.price$)
```

在此例中，如果 `item.description` 包含多行，所有行将缩进以与首行对齐：  

```latex
00123  A fine bottle of 18-year old
       Oban whiskey. ($148)
```

要将多行嵌套到同一级别，请在模板中将它们与 `^` 指令对齐。例如：  

```latex
$item.number$  $^$$item.description$ ($item.price$)
               (Available til $item.sellby$.)
```

将生成：  

```
00123  A fine bottle of 18-year old
       Oban whiskey. ($148)
       (Available til March 30, 2020.)
```

如果变量单独出现在一行，前有空格且同一行后无其他文本或指令，且变量值包含多行，则会自动嵌套。

### 可断行空格  

通常，模板本身的空格（区别于插值变量的值）不可断行，但可通过使用 `~` 关键字（以另一个 `~` 结束）使部分模板中的空格可断行。

```
$~$This long line may break if the document is rendered
with a short line length.$~$
```

### 管道  

管道用于转换变量或部分模板的值。管道通过变量名（或部分模板）与管道名称之间的斜杠 (`/`) 指定。示例：  

```latex
$for(name)$
$name/uppercase$
$endfor$

$for(metadata/pairs)$
- $it.key$: $it.value$
$endfor$

$employee:name()/uppercase$
```

管道可链式使用：  

```latex
$for(employees/pairs)$
$it.key/alpha/uppercase$. $it.name$
$endfor$
```

某些管道接受参数：  

```latex
|----------------------|------------|
$for(employee)$
$it.name.first/uppercase/left 20 "| "$$it.name.salary/right 10 " | " " |"$
$endfor$
|----------------------|------------|
```

当前预定义的管道包括：  

- `pairs`：将映射或数组转换为包含 `key` 和 `value` 字段的映射数组。如果原始值是数组，`key` 将为数组索引，从 1 开始。
- `uppercase`：将文本转换为大写。
- `lowercase`：将文本转换为小写。
- `length`：返回值的长度：文本值的字符数，映射或数组的元素数。
- `reverse`：反转文本值或数组，对其他值无影响。
- `first`：返回非空数组的第一个值；否则返回原始值。
- `last`：返回非空数组的最后一个值；否则返回原始值。
- `rest`：返回非空数组除第一个值外的所有值；否则返回原始值。
- `allbutlast`：返回非空数组除最后一个值外的所有值；否则返回原始值。
- `chomp`：移除尾随换行符（和可断行空格）。
- `nowrap`：禁用可断行空格的换行。
- `alpha`：将可解读为整数的文本值转换为小写字母 `a..z`（模 26）。可用于从数组索引生成字母编号。链式使用 `uppercase` 可生成大写字母。
- `roman`：将可解读为整数的文本值转换为小写罗马数字。可用于从数组索引生成罗马数字编号。链式使用 `uppercase` 可生成大写罗马数字。
- `left n "leftborder" "rightborder"`：将文本值渲染为宽度 `n` 的块，左对齐，带可选的左右边界。对其他值无影响。可用于表格内容对齐。宽度为正整数，表示字符数。边界为双引号中的字符串；字面 `"` 和 `\` 字符必须反斜杠转义。
- `right n "leftborder" "rightborder"`：将文本值渲染为宽度 `n` 的块，右对齐，对其他值无影响。
- `center n "leftborder" "rightborder"`：将文本值渲染为宽度 `n` 的块，居中对齐，对其他值无影响。
