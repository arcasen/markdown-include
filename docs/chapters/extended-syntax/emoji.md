### 表情符号 Emoji

有两种方式可以将表情符号添加到 Markdown 文档中：将表情符号复制并粘贴到 Markdown 格式的文本中，或者键入 表情符号的简码（emoji shortcodes）[^pandoc-emoji]。

[^pandoc-emoji]: 调用 pandoc 时需要加选项 `--from markdown+emoji`。如果要转换 tex/pdf，模板中需要支持包，系统中需要支持表情的字体，如 Noto Color Emoji，并使用 LuaTeX 编译。

#### 复制并粘贴表情符号

在大多数情况下，你可以简单地从 Emojipedia 等来源复制表情符号，然后将其粘贴到文档中。许多 Markdown 应用程序就会自动以 Markdown 格式的文本来显示表情符号。从 Markdown 应用程序导出的 HTML 和 PDF 文件也是可以显示表情符号的。

#### 使用表情符号的简码（Shortcodes）

某些 Markdown 应用程序允许你通过键入表情符号的简码（shortcodes）来插入表情符号。简码以冒号开头和结尾，两个冒号中间是表情符号的名称。

```
![[ ../../snippets/emoji-shortcodes.md]]
```

渲染效果如下：

![[ ../../snippets/emoji-shortcodes.md]]