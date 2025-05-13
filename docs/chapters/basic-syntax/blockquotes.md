### 引用块 Blockquotes

要创建块引用，请在段落前添加一个 `>` 符号。

```
![[ ../../examples/basic-syntax/blockquotes/blockquotes-with-single-paragraph.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/blockquotes/blockquotes-with-single-paragraph.md ]]

#### 多个段落的块引用

块引用可以包含多个段落。为段落之间的空白行各添加一个 `>` 符号。

```
![[ ../../examples/basic-syntax/blockquotes/blockquotes-with-multiple-paragraphs.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/blockquotes/blockquotes-with-multiple-paragraphs.md ]]

#### 嵌套块引用（Nested Blockquotes）

块引用可以嵌套。在要嵌套的段落前添加一个 `>>` (或者`> >`)符号。

```
![[ ../../examples/basic-syntax/blockquotes/nested-blockquotes.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/blockquotes/nested-blockquotes.md ]]

#### 带有其它元素的块引用（Blockquotes with Other Elements）

块引用可以包含其他 Markdown 格式的元素。并非所有元素都可以使用，你需要进行实验以查看哪些元素有效。

```
![[ ../../examples/basic-syntax/blockquotes/blockquotes-with-other-elements.md ]]
```

渲染效果如下：

![[ ../../examples/basic-syntax/blockquotes/blockquotes-with-other-elements.md ]]

**注意** 

Pandoc 要求引用块必须前面必须要有空行，见[扩展： `blank_before_blockquote`]。