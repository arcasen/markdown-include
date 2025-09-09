### 过滤器实例：条纹表格 Striped Table

下面是一个用 Panflute 编写的过滤器，可以处理生成条纹表格（Striped Table）。代码如下：

```{.python .numberLines}
![[ ../../examples/filters/striped-table ]]
```

使用方法：在表格标题添加 `.striped`。

::: caution

如果与 pandoc-crossref 一起使用时，请先调用 striped-table。

:::

示例：

```markdown
![[ ../../examples/filters/tables.md ]]
```

::: rendered

![[ ../../examples/filters/tables.md ]]

:::