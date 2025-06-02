# 使用 LaTeX 模板

## Pandoc 默认模板

下载地址： https://github.com/jgm/pandoc-templates/tree/master

default.latex 依次调用了下面的文件：

- passoptions.latex
- fonts.latex
- font-settings.latex
- common.latex
- after-header-includes.latex
- hypersetup.latex

## Stenciler 模板

stenciler.latex 由 default.latex 修改而来，listingsetup.latex 借鉴了 Eisvogel 模板。

## Eisvogel 模板简介

Eisvogel 是一个用于将 Markdown 文件转换为 PDF 或 LaTeX 的 pandoc 干净清爽的模板。与 pandoc 3 兼容，改模板为 pandoc 转换提供了定制化的排版结果，包括选择字体和配置封面的背景图等设计，是一套优雅、现代的排版风格，适用于各种类型的文档，包括书籍、文章、报告、幻灯片等。

获取方式：[Github 库下载](https://github.com/Wandmalfarbe/pandoc-latex-template)

### 安装准备

如果你想使用 Eisvogel 模板，首先需要安装以下两个工具：

- Pandoc：从这里 http://pandoc.org/ 下载并安装 Pandoc。
- LaTeX：确保你的系统上已经安装了 LaTeX，推荐 TeXlive。

接下来，你可以从 Eisvogel 模板的[发布页面](https://github.com/Wandmalfarbe/pandoc-latex-template/releases) 下载最新版本的 ZIP 文件。

解压缩下载的 ZIP 文件，然后将 eisvogel.latex 模板文件移动到你的 pandoc 模板文件夹中。模板文件夹的位置取决于你的操作系统：

- Unix、Linux、macOS：`/Users/USERNAME/.local/share/pandoc/templates/` 或 `/Users/USERNAME/.pandoc/templates/`
- Windows Vista 或更高版本：`C:\Users\USERNAME\AppData\Roaming\pandoc\templates\`

如果你的系统中没有名为 templates 或 pandoc 的文件夹，你需要手动创建它们，并将 eisvogel.latex 模板放入其中。你可以通过运行 `pandoc --version` 命令来查找默认用户数据目录的位置。

### 转换调用

pandoc 实际上是将 Markdown 文件转换为一个 LaTeX 文件，然后再调用 LaTeX engine 来进行排版。常用的 LaTeX engine 有 LaTeX、XeLaTeX 等，其中 XeLaTeX 对 Unicode 和 PDF 的支持最好，也是 Wandmalfarbe/pandoc-latex-template 默认使用的 engine。

```
pandoc -s input.md -o output.pdf --template=eisvogel
```

这个命令会将 input.md 文件转换为 output.pdf 文件，并使用 eisvogel 模板进行排版。

最后，你可以查看 Wandmalfarbe/pandoc-latex-template 的文档和用户指南，以了解更多关于这个模板的使用方法和定制选项。同时，你也可以参考其他 LaTeX 模板和 pandoc 的文档，以深入了解 pandoc 的工作原理和 LaTeX 的排版技术。

为了获得漂亮的页眉和页脚，你需要在你的文档中提供元数据。你可以在 Markdown 文档的顶部使用 YAML 元数据块来添加这些信息（参见示例 Markdown 文件）。例如：

```
---
title: "The Document Title"
author: [Example Author, Another Author]
date: "2024-02-20"
keywords: [Markdown, Example]
---
```

然后在文档中添加实际的内容即可。

## 其它模板资源

- <https://pandoc-templates.org/>
- [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [Academic Pandoc template](https://github.com/maehr/academic-pandoc-template)
- [User contributed templates](https://github.com/jgm/pandoc/wiki/User-contributed-templates)
- [Default templates for pandoc](https://github.com/jgm/pandoc-templates)

## References

- [Github 榜首：Pandoc PDF 转换模板，优雅美观，轻松实现](https://ask.latexstudio.net/ask/article/768.html)
- [Converting Markdown to Beautiful PDF with Pandoc](https://jdhao.github.io/2019/05/30/markdown2pdf_pandoc/)
- [Getting Started With Pandoc Markdown](https://deatrich.github.io/doc-with-pandoc-markdown/)
