### 过滤器实例：LaTeX 环境

下面是一个用 Panflute 编写的过滤器，可以处理 Pandoc 的 Div，将其转换成对应类名的 LaTeX 环境：

```python
![[ ../../examples/filters/define-environment.py ]]
```

示例 1：通过这个过滤器，我们可以在 Markdown 中使用定理环境：

```markdown
![[ ../../examples/filters/vieta-formulas.md ]]
```

其渲染效果如下：

![[ ../../examples/filters/vieta-formulas.md ]]

示例 2：通过这个过滤器，我们可以在 Markdown 中使用 awesomebox[^awesomebox] 环境：

[^awesomebox]: <https://ctan.org/pkg/awesomebox>

```markdown
![[ ../../examples/filters/awesomebox.md ]]
```

其渲染效果如下：

![[ ../../examples/filters/awesomebox.md ]]