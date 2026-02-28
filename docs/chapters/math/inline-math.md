### 行内公式 Inline math

Pandoc 要求行内公式的 `$` 符号紧贴文字，不能有空格。

::: important
规则：左边的 $ 前面必须是空格或标点，且后面紧接非空格字符；右边的 $ 前面紧接非空格字符，且后面是空格或标点。
:::

- 错误写法：

  ```markdown
  This is $ E=mc^2 $ equation. ( $ 前后有空格)
  ```
  Pandoc 认为这是两个独立的 `$` 字符，于是转义为 `\$ E=mc^2 \$`， \LaTeX 编译出错。

- 正确写法：
  ```markdown
  This is $E=mc^2$ equation. ( $ 紧贴字符)
  ```
  Pandoc 识别为公式，正常渲染为 `\(e^{i\pi} + 1 = 0\)`。

示例：

```markdown
![[ ../../examples/math/euler-formula.md ]]
```
::: rendered

![[ ../../examples/math/euler-formula.md ]]

:::