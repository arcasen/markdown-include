# Pandoc 与 Panflute 详细教程

## 第一部分：Pandoc 基础

### 1. Pandoc 简介

Pandoc 是一个强大的文档格式转换工具，被称为"文档转换的瑞士军刀"。它可以在多种标记格式之间进行转换，包括：

- Markdown
- HTML
- LaTeX
- Word (docx)
- EPUB
- 等等

### 2. 安装 Pandoc

#### Windows
1. 访问 [Pandoc 官网](https://pandoc.org/installing.html)
2. 下载 Windows 安装程序
3. 运行安装程序并按照提示操作

#### macOS
使用 Homebrew 安装：
```bash
brew install pandoc
```

#### Linux (基于 Debian/Ubuntu)
```bash
sudo apt-get install pandoc
```

### 3. 基本使用

基本命令格式：
```bash
pandoc input.md -o output.docx
```

常用选项：
- `-o` 或 `--output`: 指定输出文件
- `-f` 或 `--from`: 指定输入格式 (默认自动检测)
- `-t` 或 `--to`: 指定输出格式 (默认自动检测)
- `-s` 或 `--standalone`: 生成独立文档 (包含头部和尾部)

### 4. 常用转换示例

Markdown 转 Word:
```bash
pandoc input.md -o output.docx
```

Markdown 转 PDF (需要 LaTeX):
```bash
pandoc input.md -o output.pdf
```

HTML 转 Markdown:
```bash
pandoc input.html -o output.md
```

Word 转 Markdown:
```bash
pandoc input.docx -o output.md
```

## 第二部分：Panflute 进阶

### 1. Panflute 简介

Panflute 是一个用于编写 Pandoc 过滤器的 Python 库。它提供了简单易用的 API 来处理 Pandoc 的抽象语法树 (AST)。

### 2. 安装 Panflute

```bash
pip install panflute
```

### 3. 基本概念

Pandoc 过滤器是一个程序，它:
1. 接收 Pandoc 文档的 JSON 表示
2. 修改文档
3. 输出修改后的 JSON 表示

Panflute 简化了这个过程，让你可以用 Python 轻松操作文档。

### 4. 创建第一个过滤器

创建一个简单的 Python 文件 `uppercase.py`:

```python
#!/usr/bin/env python
import panflute as pf

def upper(elem, doc):
    if isinstance(elem, pf.Str):
        elem.text = elem.text.upper()

if __name__ == "__main__":
    pf.run_filter(upper)
```

使用过滤器:
```bash
pandoc input.md --filter ./uppercase.py -o output.md
```

### 5. Panflute 核心 API

#### 文档结构
- `Doc`: 整个文档
- `Block`: 块级元素 (如段落、标题、列表等)
- `Inline`: 行内元素 (如文本、链接、图片等)

#### 常用元素类型
- `Str`: 普通文本
- `Para`: 段落
- `Header`: 标题
- `Emph`: 强调文本
- `Strong`: 加粗文本
- `Link`: 链接
- `Image`: 图片
- `List`: 列表
- `Table`: 表格

### 6. 实用过滤器示例

#### 示例1: 给所有标题添加前缀

```python
import panflute as pf

def add_prefix(elem, doc):
    if isinstance(elem, pf.Header):
        title = pf.stringify(elem)
        elem.content.insert(0, pf.Str("NOTE: "))
        return elem

if __name__ == "__main__":
    pf.run_filter(add_prefix)
```

#### 示例2: 统计字数

```python
import panflute as pf

word_count = 0

def count_words(elem, doc):
    global word_count
    if isinstance(elem, pf.Str):
        word_count += len(elem.text.split())

def finalize(doc):
    pf.debug(f"Total words: {word_count}")

if __name__ == "__main__":
    pf.run_filter(count_words, finalize=finalize)
```

#### 示例3: 转换链接为脚注

```python
import panflute as pf

def links_to_footnotes(elem, doc):
    if isinstance(elem, pf.Link):
        text = pf.stringify(elem)
        url = elem.url
        footnote = pf.Note(pf.Para(pf.Str(url)))
        return [pf.Str(text), footnote]

if __name__ == "__main__":
    pf.run_filter(links_to_footnotes)
```

### 7. 调试技巧

1. 使用 `pf.debug()` 打印调试信息
2. 查看 AST 结构:
   ```python
   def print_ast(elem, doc):
       pf.debug(elem)
   
   pf.run_filter(print_ast)
   ```
3. 使用 `--verbose` 选项获取更多信息

## 第三部分：高级主题

### 1. 处理元数据

```python
def add_metadata(doc):
    # 获取元数据
    title = doc.get_metadata('title', 'Untitled')
    
    # 修改元数据
    doc.metadata['author'] = 'John Doe'
    
    # 添加新元数据
    doc.metadata['date'] = pf.MetaString('2023-01-01')

if __name__ == "__main__":
    pf.run_filter(add_metadata)
```

### 2. 创建自定义输出格式

```python
def custom_format(elem, doc):
    if isinstance(elem, pf.Header):
        level = elem.level
        text = pf.stringify(elem)
        return pf.RawBlock(f"<h{level} class='custom'>{text}</h{level}>", format='html')

if __name__ == "__main__":
    pf.run_filter(custom_format)
```

### 3. 结合 Pandoc 模板

```bash
pandoc input.md --filter myfilter.py --template mytemplate.tex -o output.pdf
```

### 4. 性能优化技巧

1. 减少不必要的 AST 遍历
2. 对于大型文档，考虑使用流式处理
3. 缓存频繁访问的元数据

## 第四部分：实战项目

### 项目1: 学术论文助手

功能:
- 自动编号图表
- 生成目录
- 管理参考文献
- 格式检查

### 项目2: 博客发布系统

功能:
- 转换 Markdown 到多种发布格式
- 自动优化图片
- 添加 SEO 元标签
- 生成相关文章链接

### 项目3: 文档质量检查器

功能:
- 检查拼写错误
- 分析可读性
- 统计文档结构
- 检查链接有效性

## 附录

### 1. 常见问题解答

Q: 过滤器不工作怎么办？
A: 检查元素类型是否正确，使用 `pf.debug()` 调试

Q: 如何处理复杂嵌套结构？
A: 使用递归函数或 `elem.walk()` 方法

Q: 性能太差怎么办？
A: 减少不必要的处理，考虑使用更高效的 Python 代码

### 2. 资源推荐

- [Pandoc 官方文档](https://pandoc.org/)
- [Panflute GitHub 仓库](https://github.com/sergiocorreia/panflute)
- [Pandoc 过滤器示例集合](https://github.com/jgm/pandoc/wiki/Pandoc-Filters)

### 3. 最佳实践

1. 保持过滤器单一职责
2. 编写清晰的文档注释
3. 为复杂过滤器编写单元测试
4. 处理边缘情况
5. 考虑跨格式兼容性

希望这份详细的教程能帮助你掌握 Pandoc 和 Panflute 的强大功能！