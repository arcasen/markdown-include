### 概述

#### 设计哲学

[John Gruber] 将 Markdown 设计为易于编写，并且更重要的是易于阅读：

> Markdown 格式的文档应该可以直接发布为纯文本，而不应看起来像是被标签或格式化指令标记过。

尽管 Markdown 的语法受到多种 text-to-HTML 过滤器的影响——包括 [Setext][1]、[atx][2]、[Textile][3]、[reStructuredText][4]、[Grutatext][5]和[EtText][6]——但其语法灵感主要来源于纯文本电子邮件的格式。

[1]: https://docutils.sourceforge.net/mirror/setext.html
[2]: https://www.aaronsw.com/2002/atx/
[3]: https://web.archive.org/web/20021226035527/http://textism.com/tools/textile/
[4]: https://docutils.sourceforge.net/rst.html
[5]: https://www.triptico.com/software/grutatxt.html
[6]: https://ettext.taint.org/doc/

因此，Markdown 的语法完全由标点符号组成，这些符号都经过精挑细选，使其外观能直观反映功能。例如：用星号包裹的文字看起来就像 `*强调内容*`；Markdown 列表看起来就是列表的形态；甚至区块引用也如同电子邮件的引文格式。

#### 行内 HTML

Markdown 语法有且只有一个目的：成为适用于网络写作的格式。

Markdown 并非要替代 HTML，甚至不能与 HTML 相提并论。它的语法集非常精简，仅对应 HTML 标签的一小部分。其核心理念并非创造更便捷的 HTML 标签插入方式（我认为 HTML 标签本身已足够易用），而是让文本内容的阅读、书写和编辑变得更轻松。HTML 是发布格式，Markdown是写作格式。因此 Markdown 的格式化语法仅处理纯文本能表达的内容。

对于 Markdown 语法未覆盖的标记，直接使用 HTML 标签[^pandoc-inlinehtml]即可。无需特别声明或分隔标记来切换语法——直接使用标签就行。

唯一限制在于：块级 HTML 元素（如`<div>`、`<table>`、`<pre>`、`<p>`等）必须用空行与相邻内容分隔，且标签首尾不应有缩进。Markdown会智能避免在块级HTML标签外围添加多余的`<p>`标签。

例如在 Markdown 文章中插入 HTML 表格：

    这是普通段落。

    <table>
        <tr>
            <td>Foo</td>
        </tr>
    </table>

    这是另一个普通段落。

需注意： Markdown 语法在块级 HTML 标签内部不会生效。例如不能在 HTML 区块内使用 Markdown 的`*强调*`语法。

而行级 HTML 标签（如`<span>`、`<cite>`、`<del>`）可用于 Markdown 段落、列表项或标题中的任意位置。你甚至可以完全用 HTML 标签代替 Markdown 格式，比如用 HTML 的`<a>`或`<img>`标签替代 Markdown 的链接或图片语法。

与块级标签不同， Markdown 语法在行级 HTML 标签内部仍然有效。

[^pandoc-inlinehtml]: Pandoc 在解析 Inline HTML 时是原封不动抄录，这在转化成 HTML 时是可以的，但在转化成 \LaTeX 和 PDF 时是无法达到效果的，见：<https://github.com/jgm/pandoc/issues/10043>。

<!-- 如下面的表格在转化成 PDF 时是无效的
<table>
    <tr>
        <td>Foo</td>
        <td>Bar</td>
    </tr>
    <tr>
        <td>Foo</td>
        <td>Bar</td>
    </tr>
</table>
-->

#### 特殊字符自动转义

HTML 中有两个字符需要特殊处理：`<` 和 `&`。左尖括号用于标签起始，`&` 符号用于表示 HTML 实体。若需将它们作为普通字符使用，必须转义为实体形式，如 `&lt;` 和 `&amp;`。

`&` 符号尤其令网络写作者头疼。若要在文中书写 “AT&T”，必须写成 “`AT&amp;T`”。甚至在 URL 中也需要转义 `&` 符号。因此如果要链接到：

    https://images.google.com/images?num=30&q=larry+bird

需将 URL 编码为：

    https://images.google.com/images?num=30&amp;q=larry+bird

放在锚标签的 href 属性中。这极易被遗忘，堪称规范 HTML 文档中最常见的校验错误来源。

Markdown 允许你直接使用这些字符，并自动完成转义。当 `&` 符号作为 HTML 实体的一部分时将保留原状，否则会被转换为 `&amp;`。

例如要在文章中插入版权符号：

    &copy;

Markdown 将保持其不变。但若写作：

    AT&T

Markdown 会将其转为：

    AT&amp;T

同理，由于 Markdown 支持行内 HTML ，若将尖括号作为 HTML 标签界定符， Markdown 会正常解析。但若写作：

    4 < 5

Markdown 会将其转为：

    4 &lt; 5

但在代码区间和代码块内，尖括号和&符号总是会被自动编码。这使得用 Markdown 撰写 HTML 教程变得轻松（与原生 HTML 相比，后者在演示 HTML 语法时极为笨拙，因为每个示例中的 `<` 和 `&` 都需要手动转义）。

#### 块级元素和内联元素

在 HTML 中，元素主要分为两类：块级元素（Block Elements）和内联元素（Span Elements，也称为行内元素）。这两类元素在页面布局和行为上有显著区别。

Markdown 基本语法包括：

- 块级元素（Block elements）： paragraphs、 line breaks、 headers、 blockquotes、 lists、 code blocks、 horizontal rules；
- 内联元素（Span elements）： links、 emphasis、 code、 images；
- 其它元素（Miscellaneous）：backslash escape、 automatic links。


