## 过滤器 Filters

### 概述

Pandoc 为用户提供了一个接口，用于编写程序（称为过滤器）[^filters]，这些程序作用于 Pandoc 的抽象语法树（AST）。

[^filters]: https://pandoc.org/filters.html

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

### 使用 panflute

Pandoc 过滤器是一个程序，主要功能是：

1. 接收 Pandoc 文档的 JSON 表示

2. 修改文档

3. 输出修改后的 JSON 表示

Panflute 简化了这个过程，让你可以用 Python 轻松操作文档。

先运行以下命令安装 panflute：

```bash
$ pip3 install panflute
```

下面的实例中将将 Markdown 文本的字母转换为大写字母：

```python
![[ ../examples/filters/uppercase.py ]]
```

```markdown
Hello, World

你好, 世界
```

```bash
pandoc helloworld.md --filter ./uppercase.py 
<p>HELLO, WORLD</p>
<p>你好, 世界</p>
```

注意： 默认情况下， Pandoc 调用系统的 Python 解释器（如： macOS 是 python2），而上述过滤器需要调用 python3 解释器。解决方案如下：

方案 1： 建立虚拟环境，如：

```bash
mkvirtualenv pandoc
pip install panflute
workon pandoc
```

方案 2：设置过滤器为可执行文件

在 uppercase.py 开始加入：

```bash
#!/usr/bin/env python3
```

然后，设置过滤器为可执行文件：

```bash
chmod +x uppercase.py
```

### 过滤器的路径

上面的实例中使用了过滤器的绝对路径或相对路径，我们也可以将过滤器放入 Pandoc 用户文件目录：

```bash
mkdir -p ~/.local/share/pandoc/filters
cp -p uppercase.py ~/.local/share/pandoc/filters
```

注意： 在 Linux/Unix 系统中， `cp` 命令的 `-p` 选项的作用是保留源文件的元数据，包括以下内容：

1. 文件权限：保留源文件的权限设置（读、写、执行等）。
2. 时间戳：保留源文件的访问时间（atime）、修改时间（mtime）和创建时间（ctime，如果系统支持）。
3. 文件所有者和所属组：尽可能保留源文件的所有者和组信息（需要有相应权限，通常需要超级用户权限）。

我们可以在任务地方以如下方式调用过滤器：

```bash
pandoc helloworld.md --filter uppercase.py 
```

### 过滤器实例：设置文字颜色

下面是一个用 panflute 编写的过滤器，可以处理两种颜色标记格式，支持以 `#` 开头的 HTML 十六进制颜色代码，并同时兼容 HTML 和 PDF/LaTeX 输出：

1. 行内（Span）颜色
   
   ```
   [文字]{color=颜色}
   ```

2. 块级（Div）颜色
   
   ```
   :::{color=颜色} 
   文字内容 
   :::
   ```

#### 过滤器代码

```python
![[ ../examples/filters/change-textcolor.py ]]
```

#### 使用说明

1. 将上述代码保存为 `change-textcolor.py`
2. 使用 Pandoc 转换时添加过滤器：

   ```bash
   # 转换为 HTML
   pandoc input.md -o output.html --filter change-textcolor.py
   
   # 转换为 PDF
   pandoc input.md -o output.pdf --filter change-textcolor.py
   ```

#### 功能特点

1. 支持 HTML 十六进制颜色：
   - 可以处理 `[文字]{color=#FF0000}` 这样的十六进制颜色代码
   - 也可以处理标准颜色名称如 `[文字]{color=red}`

2. 自动适应输出格式：
   - HTML 输出：使用 `style="color: #FF0000;"`
   - LaTeX 输出：自动生成 `\definecolor` 命令和 `\textcolor` 环境

3. 块级和行内颜色支持：
   - 行内：`[红色文字]{color=#FF0000}`
   - 块级：
     ```markdown
     ::: {color=#00FF00}
     这里是绿色文字块
     :::
     ```

注意事项：

1. 确保 LaTeX 安装了 `xcolor` 包
2. 对于 PDF 输出，复杂的颜色组合可能需要额外的 LaTeX 包
3. 颜色名称和十六进制值需要是有效的 CSS/LateX 颜色值

#### 示例

输入 Markdown：

```markdown
![[ ../examples/filters/colored-text.md ]]
```

渲染效果如下：

![[ ../examples/filters/colored-text.md ]]

### 增强版 Panflute 过滤器：支持 DOCX、HTML 和 PDF 输出的颜色处理

以下是支持 DOCX、HTML 和 PDF 输出的完整过滤器，能够处理以 `#` 开头的十六进制颜色代码：

```python
![[ ../examples/filters/change-textcolor-enhanced.py ]]
```

#### 使用说明

1. 将上述代码保存为 `change-textcolor-enhanced.py`
2. 准备一个 Word 参考文档 `custom-reference.docx` 包含以下样式：
   - `ColoredText` - 用于行内彩色文本
   - `ColoredBlock` - 用于彩色文本块

3. 使用 Pandoc 转换时添加过滤器：

   ```bash
   # 转换为 HTML
   pandoc input.md -o output.html --filter change-textcolor-enhanced.py
   
   # 转换为 PDF
   pandoc input.md -o output.pdf --filter change-textcolor-enhanced.py
   
   # 转换为 DOCX
   pandoc input.md -o output.docx --filter change-textcolor-enhanced.py --reference-doc=custom-reference.docx
   ```

注意事项：

1. DOCX 输出需要参考文档中的预定义样式
2. 对于 DOCX 输出，颜色信息存储在 `_color` 属性中，实际渲染需要 Word 应用这些样式
3. 更高级的 DOCX 处理可能需要直接操作 OpenXML，这超出了 panflute 的基本功能
4. 确保在所有输出格式中测试颜色显示效果，因为不同格式对颜色的支持可能有所不同

#### 使用步骤

1. 创建参考 Word 文档：
   - 新建一个 Word 文档
   - 创建两个样式：
     - `ColoredText`：字符样式，可以设置任意颜色（实际颜色将由过滤器覆盖）
     - `ColoredBlock`：段落样式，可以设置任意颜色
   - 保存为 `custom-reference.docx`

2. 修改过滤器（可选）：
   - 如果需要更精细的 DOCX 样式控制，可以扩展过滤器以生成更复杂的 OpenXML 属性

3. 颜色映射（可选）：
   - 可以添加颜色名称到十六进制值的映射表，确保 DOCX 中的颜色一致性

完整解决方案文件结构：

```
.
├── change-textcolor-enhanced.py             # 过滤器脚本
├── custom-reference.docx       # Word 参考文档
├── input.md                    # 示例输入文件
└── Makefile                    # 构建脚本示例
```

命令：

```bash
#!/bin/bash
# 生成 HTML
pandoc input.md -o output.html --filter ./change-textcolor-enhanced.py

# 生成 PDF
pandoc input.md -o output.pdf --filter ./change-textcolor-enhanced.py

# 生成 DOCX
pandoc input.md -o output.docx --filter ./change-textcolor-enhanced.py --reference-doc=custom-reference.docx
```

