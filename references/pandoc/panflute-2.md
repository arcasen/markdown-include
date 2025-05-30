在 Pandoc 中设置文本颜色可以通过自定义过滤器实现。Pandoc 过滤器通常使用 Lua 或 Python 编写，结合 Pandoc 的 AST（抽象语法树）操作来修改文档内容。以下是使用 Lua 过滤器设置文本颜色的具体方法：

### 方法：使用 Lua 过滤器
Pandoc 支持 Lua 过滤器，可以通过识别特定标记（例如 `[text]{color=red}`）来设置文本颜色。以下是实现步骤：

#### 1. 编写 Lua 过滤器
创建一个 Lua 文件，例如 `color.lua`，包含以下代码：

```lua
function Span(elem)
  if elem.attributes.color then
    local color = elem.attributes.color
    if FORMAT:match 'latex' then
      -- LaTeX 输出
      return pandoc.RawInline('latex', '\\textcolor{' .. color .. '}{' .. pandoc.utils.stringify(elem.content) .. '}')
    elseif FORMAT:match 'html' then
      -- HTML 输出
      return pandoc.RawInline('html', '<span style="color:' .. color .. ';">' .. pandoc.utils.stringify(elem.content) .. '</span>')
    end
  end
  return elem
end
```

**解释**：
- `Span` 函数处理 Pandoc 中的 Span 元素（对应 Markdown 中的 `[text]{.class #id key=value}` 语法）。
- 检查是否存在 `color` 属性（例如 `{color=red}`）。
- 根据输出格式（`FORMAT`）：
  - 如果是 LaTeX，生成 `\textcolor{颜色}{文本}`。
  - 如果是 HTML，生成 `<span style="color:颜色;">文本</span>`。
- `pandoc.utils.stringify` 将内容转换为字符串。

#### 2. Markdown 输入
在 Markdown 文件中，使用以下语法指定文本颜色：

```markdown
This is [colored text]{color=red}.
```

#### 3. 运行 Pandoc 命令
使用 Pandoc 命令应用过滤器：

```bash
pandoc input.md -o output.html --lua-filter=color.lua
```

或生成 PDF（需要 LaTeX 环境，例如 TeX Live）：

```bash
pandoc input.md -o output.pdf --lua-filter=color.lua
```

#### 4. 输出结果
- **HTML 输出**：
  ```html
  This is <span style="color:red;">colored text</span>.
  ```
- **LaTeX 输出**（转换为 PDF 时）：
  ```latex
  This is \textcolor{red}{colored text}.
  ```

### 注意事项
1. **LaTeX 支持**：确保 LaTeX 环境中加载了 `xcolor` 包。如果没有，在 Pandoc 命令中添加 `--pdf-engine-opt=--shell-escape` 并确保文档有以下前置代码：
   ```markdown
   ---
   header-includes:
     - \usepackage{xcolor}
   ---
   ```

2. **支持的颜色**：
   - HTML 支持标准 CSS 颜色（名称如 `red`、十六进制如 `#FF0000`、RGB 等）。
   - LaTeX 使用 `xcolor` 包支持的颜色（如 `red`, `blue`, `green` 等）。

3. **扩展性**：
   - 你可以扩展过滤器以支持其他格式（如 docx），但 docx 需要额外的处理（例如 OpenXML 标记）。
   - 如果需要更多样式（如背景色），可以在 Lua 过滤器中添加类似逻辑。

4. **调试**：如果过滤器不生效，检查：
   - Lua 文件路径是否正确。
   - Markdown 语法是否符合 `[text]{color=value}`。
   - 输出格式是否在过滤器中处理。

### 替代方法：Python 过滤器
如果更熟悉 Python，可以使用 `panflute` 库编写类似过滤器。示例：

```python
import panflute as pf

def color_filter(elem, doc):
    if isinstance(elem, pf.Span) and 'color' in elem.attributes:
        color = elem.attributes['color']
        if doc.format == 'html':
            return pf.RawInline(f'<span style="color:{color};">{pf.stringify(elem)}</span>', format='html')
        elif doc.format == 'latex':
            return pf.RawInline(f'\\textcolor{{{color}}}{{{pf.stringify(elem)}}}', format='latex')
    return elem

if __name__ == '__main__':
    pf.run_filter(color_filter)
```

保存为 `color.py`，然后运行：

```bash
pandoc input.md -o output.html --filter=color.py
```

需要先安装 `panflute`：

```bash
pip install panflute
```

### 总结
- **推荐**：使用 Lua 过滤器，简单且无需额外依赖。
- **输入格式**：`[文本]{color=颜色}`。
- **输出支持**：HTML 和 LaTeX 简单，docx 等需额外处理。
- **环境要求**：LaTeX 输出需要 `xcolor` 包，Python 过滤器需要 `panflute`。

如果有进一步需求（例如支持其他格式或复杂样式），请提供更多细节，我可以帮你扩展！