### 围栏式代码块 Fenced Code Blocks{#fenced-code-blocks}

Markdown 的基本语法允许你通过缩进四个空格或一个制表符来创建 代码块 。如果你觉得不方便，可以试试围栏式代码块（fenced code blocks）。根据 Markdown 解析器或编辑器的不同，代码块的前后各行可以使用三个反引号（```）或三个波浪号（~~~）来标记围栏式代码块。这有什么优势吗？你不必费力缩进任何行了！

````
```c
![[ helloworld.c ]]
```
````

::: rendered

```c
![[ helloworld.c ]]
```

:::

#### 语法高亮

许多 Markdown 处理器支持对带围栏的代码块进行语法高亮。此功能允许您为代码所用语言添加颜色高亮。要添加语法高亮，请在带围栏的代码块前在反引号旁边指定一种语言。

~~~
```json
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```
~~~

::: rendered

```json
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

:::
