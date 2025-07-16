### 脚注 Footnotes

#### 扩展：`footnotes`

Pandoc 的 Markdown 允许使用脚注，使用以下语法：

```markdown
![[ ../../examples/pandoc-flavored-markdown/footnotes.md ]]
```

脚注引用中的标识符不得包含空格、制表符、换行符或字符 `^`、`[`、 或 `]`。这些标识符仅用于将脚注引用与注释本身关联起来；在输出中，脚注将按顺序编号。

脚注本身不必放在文档末尾。它们可以出现在除其他块元素（列表、块引用、表格等）之外的任何位置。每个脚注都应与周围内容（包括其他脚注）用空行分隔。

#### 扩展：`inline_notes`

行内脚注也是允许的（不过，与常规注释不同，行内脚注不能包含多个段落）。语法如下：

```markdown
![[ ../../examples/pandoc-flavored-markdown/footnotes-inline.md ]]
```

行内脚注和常规脚注可以自由混合。

#### 多次引用同一脚注

在多次引用同一脚注时，会出现该脚注被重复输出[^issue-1603]。解决方法：直接使用 `\footnotemark` 和 `\footnotetext` 命令来实现；也可以通过设置脚注标签和特殊链接格式（需要过滤器处理）来解决。

[^issue-1603]: 见 <https://github.com/jgm/pandoc/issues/1603> 。

Markdown 示例如下：

```markdown
This is the first note[^note1], this is the second note[^note2], this is the reference to the first note^[](#notelabel1)^.

[^note1]: [foo]{#notelabel1}
[^note2]: bar
```

使用 Panflute 编写过滤器（见*[过滤器 Filters]*）：

```python
#!/usr/bin/env python3

import Panflute as pf

def action(elem, doc):
    # Process Link elements
    if isinstance(elem, pf.Link) and elem.url.startswith('#'):
        labelid = elem.url[1:]  # Remove '#' to get labelid
        if not elem.content:  # Empty link, e.g., [](#labelid)
            if doc.format == 'latex':
                # Convert to LaTeX \ref{labelid}
                return pf.RawInline(f'\\ref{{{labelid}}}', format='latex')
            elif doc.format == 'html':
                # Convert to HTML <a href="#labelid">labelid</a>
                return pf.RawInline(f'<a href="#{labelid}">{labelid}</a>', format='html')
    return elem


if __name__ == '__main__':
    pf.run_filter(action, doc=None)
```
