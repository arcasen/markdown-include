---
documentclass: ctexbook
title: Markdown & Pandoc Essentials
author: arcasen
press: https://github.com/arcasen/markdown-include
title-page: title-page.tex
indent: 2em
lang: zh
header-continue: |
  \AtBeginDocument{%
    \renewcommand*\figurename{图}
    \renewcommand*\tablename{表}
    \renewcommand*\lstlistingname{代码}
    \renewcommand*\listfigurename{图表清单}
    \renewcommand*\listtablename{表格清单}
    \renewcommand*\lstlistlistingname{代码清单}
  }
---

<!-- # Markdown & Pandoc Essentials -->

![[ chapters/introduction.md ]]

<!-- ![[ chapters/markdown-cheat-sheet.md ]] -->

<!-- ![[ chapters/basic-syntax.md ]] -->

<!-- ![[ chapters/extended-syntax.md ]] -->

![[ chapters/pandoc-flavored-markdown.md ]]

![[ chapters/math.md ]]

![[ chapters/cross-referencing.md ]]

![[ chapters/citations.md ]]

![[ chapters/defaults-files.md ]]

![[ chapters/metadata.md ]]

![[ chapters/templates.md ]]

![[ chapters/reference-document.md ]]

![[ chapters/filters.md ]]

![[ chapters/slides.md ]]

![[ chapters/markmap.md ]]

\backmatter

![[ chapters/references.md ]]
