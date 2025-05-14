在 Pandoc 中，`intraword_underscores` 是一个 Markdown 扩展，用于处理单词内部下划线（underscores）的解析规则。默认情况下，Pandoc 会将下划线视为强调标记（例如 `_italic_` 表示斜体）。但当启用 `intraword_underscores` 时，Pandoc 会允许在单词内部使用下划线，而不将其解析为强调标记。这对于技术文档中常见的变量名（如 `my_variable`）非常有用。

以下是如何启用 `intraword_underscores` 的方法：

### 1. 检查扩展默认状态
在 Pandoc 的默认 Markdown 解析器中，`intraword_underscores` 通常是**禁用**的。这意味着如果你写 `my_variable`，Pandoc 会将其解析为 `<em>my</em>variable`（斜体标记），而不是保留为纯文本 `my_variable`。

### 2. 启用 `intraword_underscores`
你可以通过命令行参数明确启用这个扩展。Pandoc 的扩展是通过 `--from`（或 `-f`）选项指定的，格式为 `markdown+extension_name`。

#### 命令示例
```bash
pandoc --from markdown+intraword_underscores input.md -o output.html
```

- `--from markdown+intraword_underscores`：告诉 Pandoc 在解析 Markdown 时启用 `intraword_underscores` 扩展。
- `input.md`：输入的 Markdown 文件。
- `-o output.html`：输出为 HTML 文件（你也可以选择其他格式，如 `-o output.pdf`）。

#### 输入示例
假设你的 `input.md` 文件内容如下：
```markdown
This is a test with my_variable and _emphasis_.
```

- **默认行为（未启用扩展）**：
  输出 HTML 会是：
  ```html
  <p>This is a test with <em>my</em>variable and <em>emphasis</em>.</p>
  ```
  这里的 `my_variable` 被错误解析为强调标记。

- **启用 `intraword_underscores` 后的行为**：
  运行命令：
  ```bash
  pandoc --from markdown+intraword_underscores input.md -o output.html
  ```
  输出 HTML 会是：
  ```html
  <p>This is a test with my_variable and <em>emphasis</em>.</p>
  ```
  现在 `my_variable` 被正确保留为纯文本，而 `_emphasis_` 仍然被解析为斜体。

### 3. 在代码块中结合使用
如果你在 fenced code block 中使用下划线，`intraword_underscores` 不会影响代码块内的内容，因为代码块默认会保留原始文本。例如：

```markdown
```python
my_variable = 42
```
```

无论是否启用 `intraword_underscores`，代码块中的 `my_variable` 都会保持不变。

### 4. 注意事项
- **与其他扩展兼容性**：`intraword_underscores` 可以与其他 Markdown 扩展一起使用，例如 `+fenced_code_attributes` 或 `+pipe_tables`，只需在 `--from` 中用 `+` 连接多个扩展：
  ```bash
  pandoc --from markdown+intraword_underscores+fenced_code_attributes input.md -o output.html
  ```
- **禁用扩展**：如果需要禁用默认启用的扩展，可以用 `-` 号，例如 `--from markdown-intraword_underscores`（不过 `intraword_underscores` 默认是禁用的，通常无需显式禁用）。
- **适用范围**：此扩展仅影响普通文本中的下划线，不影响其他标记（如标题、链接等）。

### 5. 验证启用效果
为了确认扩展是否生效，你可以：
1. 创建一个简单的 Markdown 文件，包含带下划线的单词（例如 `my_variable`）。
2. 用启用和不启用扩展的命令分别转换文件。
3. 检查输出结果是否符合预期。

### 总结
要启用 `intraword_underscores`，只需在 Pandoc 命令中添加 `--from markdown+intraword_underscores`。这会让 Pandoc 正确处理单词内部的下划线，避免将其误解析为强调标记，非常适合技术文档或编程相关的 Markdown 文件。

如果你有更具体的使用场景或问题，欢迎告诉我，我可以进一步协助！