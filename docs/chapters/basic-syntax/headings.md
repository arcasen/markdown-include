### 标题 Headings

Markdown 支持两种标题样式：[Setext][stx] 和 [atx][atx]。

Setext 风格的标题使用等号（一级标题）和短横线（二级标题）作为"下划线"。例如：

```markdown
![[ ../../examples/headings-setext-style.md ]]
```

任意数量的 `=` 或 `-` 都可以使用。

Atx 风格的标题在行首使用 1-6 个井号，对应 1-6 级标题。例如：

```markdown
![[ ../../examples/headings-atx-style.md ]]
```

你也可以使用“闭合的” atx 风格的标题。这纯粹是装饰性的——如果你觉得这样看起来更好看的话可以使用。闭合的井号数量甚至不需要与开头的井号数量匹配（标题级别由开头的井号数量决定）：

```markdown
# 这是一级标题 #

## 这是二级标题 ##

### 这是三级标题 ######
```

[stx]: http://docutils.sourceforge.net/mirror/setext.html
[atx]: http://www.aaronsw.com/2002/atx/
