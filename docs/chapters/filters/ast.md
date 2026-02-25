### Pandoc 的抽象语法树 AST

#### Haskell 表示

Pandoc 的 `-t native` 选项将输入文档转换为 Pandoc 的内部表示格式，即 Haskell 数据结构。具体来说，`-t native` 的输出是 Pandoc 的 Native AST（抽象语法树），本质上是 Pandoc 的文档模型（Abstract Syntax Tree, AST）的序列化形式，用 Haskell 的语法表达。这种格式主要用于调试或开发 Pandoc 相关工具，方便开发者查看 Pandoc 如何解析文档的内部结构。

示例：测试文档 `lorem-ipsum.md` 的内容如下：

```markdown
![[ ../../examples/filters/ast/lorem-ipsum.md]]
```

执行 `pandoc lorem-ipsum.md -t native` 输出：

```haskell
![[ ../../examples/filters/ast/lorem-ipsum.hs]]
```

#### JSON 表示

Pandoc 的 `-t json` 选项将输入文档转换为 JSON 格式的输出。具体来说，这是 Pandoc 的内部文档模型（Abstract Syntax Tree, AST）的 JSON 表示。输出的格式是 JSON（JavaScript Object Notation），一种通用的、语言无关的数据交换格式。Pandoc 使用 JSON 来序列化其内部 AST，描述文档的结构（如标题、段落、强调等）。JSON 输出表示了 Pandoc 解析文档后的结构化数据，包含元数据（metadata）和文档内容的层级结构。这种格式常用于程序化处理 Pandoc 的文档数据，例如与其他工具集成、自动化处理或调试 Pandoc 的解析结果。

执行 `pandoc lorem-ipsum.md -t json | python3 -m json.tool` 输出：

```haskell
![[ ../../examples/filters/ast/lorem-ipsum.json]]
```