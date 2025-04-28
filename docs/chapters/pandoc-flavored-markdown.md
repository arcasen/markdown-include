## Pandoc's Markdown

### 概述 Overview

Pandoc 中支持扩展修订版本的 Markdown 语法。

- 使用 pandoc 中支持的 Markdown 语法用 `-f markdown`
- 使用标准 Markdown 语法用 `-f markdown_strict`
  
Pandoc 所支持的语法各种对标准 Markdown 语法的扩展可以通过在格式后以 `+EXTENSION` 添加或`-EXTENSION` 去除，如：

- `-f markdown-footnotes` 表示识别除了 `footnotes` 扩展之外的所有 pandoc Markdown 语法
- `-f markdown_strict+footnotes+pipe_tables` 表示识别标准 Markdown 语法加上 `footnotes` 和 `pipe_tables` 扩展语法。

![[ pandoc-flavored-markdown/paragraphs.md ]]

![[ pandoc-flavored-markdown/headings.md ]]

![[ pandoc-flavored-markdown/blockquotes.md ]]

![[ pandoc-flavored-markdown/code-blocks.md ]]

![[ pandoc-flavored-markdown/line-blocks.md ]]

![[ pandoc-flavored-markdown/inline-formatting.md ]]

![[ pandoc-flavored-markdown/links.md ]]

![[ pandoc-flavored-markdown/images.md ]]