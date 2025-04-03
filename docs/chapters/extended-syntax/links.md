### 自动将 URL 转换为链接

许多 Markdown 解析器会自动将 URL 转换为链接。这意味着，即使你没有 使用中括号，如果你输入 `http://www.example.com`，你的 Markdown 解析器也会自动将其转换为链接。

`http://www.example.com`

渲染效果如下所示：

http://www.example.com

### 禁止自动将 URL 转换为链接

如果你不希望自动将 URL 转换为链接，则可以通过反引号 将 URL 表示为代码 。

`http://www.example.com`

渲染效果如下所示：

`http://www.example.com`