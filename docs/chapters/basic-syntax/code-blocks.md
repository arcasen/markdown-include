### 代码块 Code Blocks

代码块（Code blocks） 通常采用四个空格或一个制表符缩进。当它们被放在列表中时，请将它们缩进八个空格或两个制表符。要创建不缩进行的代码块，请使用围栏代码块(Fenced Code Blocks)。

示例：

```markdown
![[ ../../examples/basic-syntax/code-blocks.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/code-blocks.md ]]

#### 转义反引号

如果你要表示为代码的单词或短语包含一个或多个反引号，你可以通过用双反引号 (``) 将单词或短语括起来来转义它。

示例：

~~~markdown
``在你的 Markdown 文件中使用 `code`。``
~~~

渲染效果如下：

``在你的 Markdown 文件中使用 `code`。``

#### 代码块

要创建代码块，请将块的每一行至少缩进四个空格或一个制表符。

示例：

~~~markdown
    <html>
      <head>
      </head>
    </html>
~~~

渲染效果如下：

    <html>
      <head>
      </head>
    </html>