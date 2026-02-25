## 简介

### 什么是 Markdown？

Markdown 是一种轻量级标记语言，你可以使用它向纯文本文档添加格式元素。Markdown 由 John Gruber[^gruber] 于 2004 年创建，现在是世界上最流行的标记语言之一。

[^gruber]: <https://daringfireball.net/projects/markdown/>

使用 Markdown 与使用 WYSIWYG[^wysiwyg] 编辑器不同。在 Microsoft Word 等应用程序中，你可以单击按钮来设置单词和短语的格式，并且更改会立即显示。Markdown 并非如此。当你创建一个 Markdown 格式的文件时，你向文本添加 Markdown 语法来指示哪些单词和短语应显示为不同格式。

[^wysiwyg]: <https://en.wikipedia.org/wiki/WYSIWYG>

例如，要表示标题，你可以在标题前添加一个井号（例如，`# 标题一`）。或者要使短语变为粗体，你可以在短语前后添加两个星号（例如，`**此文本为粗体**`）。在文本中看到 Markdown 语法可能需要一段时间才能适应，特别是如果你习惯于 WYSIWYG 应用程序。

你可以使用文本编辑器应用程序向纯文本文件添加 Markdown 格式元素。或者，你可以使用 macOS、Windows、Linux、iOS 和 Android 操作系统的众多 Markdown 应用程序之一。还有专门用于编写 Markdown 的几个基于 Web 的应用程序。

根据你使用的应用程序，你可能无法实时预览格式化的文档。但这没关系， Markdown 格式语法的主要设计目标是使其尽可能具有可读性。

### 为何使用 Markdown？

你可能想知道，人们为何使用 Markdown 而不是所见即所得编辑器。为什么在界面中按按钮格式化文本时还要使用 Markdown 来编写？事实证明，人们使用 Markdown 而不是所见即所得编辑器的原因有很多。

- Markdown 使语义（semantics）与格式（format）分离，让你更聚焦于语义。
- Markdown 是最简单的标记语言语言（markup languages）之一。
- Markdown 可用于一切。人们使用它来创建 网站、文档、笔记、书籍、演示文稿、电子邮件 和 技术文档。
- Markdown 是可移植的。包含 Markdown 格式文本的文件几乎可以使用任何应用程序打开。如果你决定不喜欢当前使用的 Markdown 应用程序，你可以将 Markdown 文件导入另一个 Markdown 应用程序。这与 Microsoft Word 等将内容锁定为专有文件格式的文字处理应用程序形成了鲜明的对比。
- Markdown 与平台无关。你可以在运行任何操作系统的任何设备上创建 Markdown 格式的文本。
- Markdown 具有未来性。即使你使用的应用程序在未来某个时间点停止工作，你仍然可以使用文本编辑应用程序阅读 Markdown 格式的文本。对于需要无限期保存的书籍、大学论文和其他里程碑式文档，这是一个重要的考虑因素。
- Markdown 无处不在。像 Reddit 和 GitHub 这样的网站支持 Markdown，并且许多桌面和基于 Web 的应用程序也支持它。

### Markdonw 是如何工作的？

当您使用 Markdown 书写时，文本会存储在具有 .md 或 .markdown 扩展名的纯文本文件中。但接下来呢？Markdown 格式的文件如何转换为 HTML 或可打印的文档？

简而言之，您需要一个能够处理 Markdown 文件的 Markdown 应用程序。

Markdown 应用程序使用称为 Markdown 处理器（通常也称为“解析器”或“实现”）的东西，将 Markdown 格式的文本提取出来并将其输出为 HTML 格式。在这一点上，您的文档可以在网络浏览器中查看，或与样式表结合使用并打印出来。您可以在下面看到此过程的可视化表示。

Markdown 应用程序和处理器是两个独立的组件。为了简洁起见，我在下图中将它们合并为一个元素（Markdown 应用程序）。

![Markdown Flowchart](../images/markdown-flowchart.png)

总而言之，这是一个由四部分组成的过程

1. 使用文本编辑器或专门的 Markdown 应用程序创建 Markdown 文件。该文件应具有 `.md` 或 `.markdown` 扩展名。
2. 在 Markdown 应用程序中打开 Markdown 文件。
3. 使用 Markdown 应用程序将 Markdown 文件转换为 HTML 文档。
4. 在网络浏览器中查看 HTML 文件，或使用 Markdown 应用程序将其转换为其他文件格式，例如 PDF。

### Markdown 有什么用？

Markdown 是一种快速简便的方法，可用于做笔记、为网站创建内容以及生成可打印的文档。

学习 Markdown 语法并不需要很长时间，一旦您知道如何使用它，您就可以在几乎任何地方使用 Markdown 来书写。大多数人使用 Markdown 为网络创建内容，但 Markdown 适用于从电子邮件到购物清单的所有内容的格式化。

### Markdown 的风格

使用 Markdown 最令人困惑的方面之一是几乎每个 Markdown 应用程序都实现了略有不同的 Markdown 版本。这些 Markdown 变体通常称为风格，如 GitHub Flavored Markdown， Pandoc Flavored Markdown 等等。

### 其他资源

有许多资源可用于学习 Markdown。以下是一些其他入门资源：

- John Gruber 的 Markdown 文档：<https://daringfireball.net/projects/markdown/>，由 Markdown 创建者编写的原始指南。
- Markdown 教程：<https://www.markdowntutorial.com/>，一个开源网站，允许你在网络浏览器中尝试 Markdown。
- Awesome Markdown：<https://github.com/mundimark/awesome-markdown>，Markdown 工具和学习资源列表。
- Markdown 排版：<https://dave.autonoma.ca/blog/2019/05/22/typesetting-markdown-part-1>，一个多部分系列，描述了使用 pandoc 和 ConTeXt 排版 Markdown 文档的生态系统。
