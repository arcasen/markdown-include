# 示例文档

## 交叉引用

When $a \ne 0$, there are two solutions to $(ax^2 + bx + c = 0)$ and they are

$$ x = \dfrac{-b \pm \sqrt{b^2-4ac}}{2a} $$ {#eq:quad}

We can solve the equation $x^2 - x -2 = 0$ based on [@eq:quad]:
$x_1=-1,x_2=2$.

## 文献引用

这是对 Knuth 的引用[@knuth1997]。  

Lamport 的 LaTeX 系统也很重要[@lamport1994, p. 310]。

同时引用[@knuth1997; @lamport1994]。

[参考 @knuth1997; 同时 @lamport1994, p. 310]

[-@knuth1997]

@knuth1997

@knuth1997[第 11 章]

# 参考文献

<!-- 这里会自动生成参考文献列表 -->