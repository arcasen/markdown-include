### 内联格式 Inline formatting{#inline-formatting}

#### Extension: `intraword_underscores`

由于 `_` 有时会在单词和标识符内部使用，因此 pandoc 不会将 `_` 字母数字字符包围的 解释为强调标记。如果只想强调单词的一部分，请使用*：

```
feas*ible*, not feas*able*.
```

Pandoc 默认是启用该扩展的，如果要想将单词内部的 `_` 解析强调语法，需要取消该扩展：`-f markdown-intraword_underscores`。

#### Extension: `strikeout`

要用水平线划掉一段文本，请以 开始和结束该部分~~。例如，

```
This ~~is deleted text.~~
```

#### Extension: `superscript` 和 `subscript`

上标可以用字符包围上标文本来书写`^`；下标也可以用字符包围下标文本来书写`~`。例如，


```
H~2~O is a liquid.  2^10^ is 1024.
```

`^...^`或之间的文本`~...~`不能包含空格或换行符。如果上标或下标文本包含空格，则必须使用反斜杠转义这些空格。（这是为了防止在日常使用~和 时 意外地将文本变为上标或下标^，以及与脚注产生不良交互。）因此，如果您希望下标中包含字母 P 和“a cat”，请使用 `P~a\ cat~`，而不是`P~a cat~`。