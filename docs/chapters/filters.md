## 过滤器 Filters

### 使用过滤器

Pandoc 为用户提供了一个接口，用于编写程序（称为过滤器）[^filters]，这些程序作用于 Pandoc 的抽象语法树（AST）。

[^filters]: <https://pandoc.org/filters.html>

Pandoc 由一组读取器和写入器组成。在将文档从一种格式转换为另一种格式时，读取器会将文本解析为Pandoc 的文档中间表示——即“抽象语法树”或 AST ——然后由写入器将其转换为目标格式。

“过滤器”是一个在读取器和写入器之间修改 AST 的程序。

```
INPUT --readerv--> AST --filter(s)--> AST --writer--> OUTPUT
```

Pandoc支持两种类型的过滤器：

Lua 过滤器
: 使用 Lua 语言定义对 Pandoc AST 的转换。

JSON 过滤器
: 是从标准输入读取并向标准输出写入的管道，处理和生成 Pandoc AST 的 JSON 表示。

文档的 JSON 表示（representation）可以看作一棵树。文档包含段落，段落包含单词和空格，某些单词被强调，依此类推。Pandoc 过滤器包通常会遍历这种树结构，并对你提供的每个节点应用一个函数。这个函数可以保持局部树结构不变，也可以返回一个修改后的树。过滤器的输出将是带有你修改的输入树。你可以使用下面的命令查看文件的 JSON 表示（使用 json.tool 将 JSON 内容格式化输出）：

```bash
pandoc input.md --to json | python3 -m json.tool > output.json 
```

传递给 --filter/-F 参数的文件应为可执行文件。然而，如果文件的可执行位未设置，Pandoc 会尝试根据文件扩展名猜测合适的解释器[^interpreters]。

[^interpreters]: <https://pandoc.org/filters.html#supported-interpreters>


| 文件扩展名 |	解释器 |
| ------------- | ------------- |
|.py	| python     |
|.hs	| runhaskell |
|.pl	| perl       |
|.rb	| ruby       |
|.php	| php        |
|.js	| node       |
|.r	| Rscript    |

示例：

```bash
pandoc input.md --filter /path/to/thefilter
```

上面的实例中使用了过滤器的绝对路径或相对路径，我们也可以将过滤器放入 Pandoc 用户文件目录：

```bash
mkdir -p ~/.local/share/pandoc/filters
cp -p /path/to/thefilter ~/.local/share/pandoc/filters
```

::: caution

在 Linux/Unix 系统中， `cp` 命令的 `-p` 选项的作用是保留源文件的元数据，包括以下内容：

1. 文件权限：保留源文件的权限设置（读、写、执行等）。
2. 时间戳：保留源文件的访问时间（atime）、修改时间（mtime）和创建时间（ctime，如果系统支持）。
3. 文件所有者和所属组：尽可能保留源文件的所有者和组信息（需要有相应权限，通常需要超级用户权限）。

:::

我们可以在任务地方以如下方式调用过滤器：

```bash
pandoc input.md --filter thefilter
```

![[ ./filters/panflute.md ]]

![[ ./filters/define-environment.md ]]

![[ ./filters/define-textcolor.md ]]

![[ ./filters/define-textcolor-enhanced.md ]]
