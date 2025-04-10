### 链接 Links

#### 自动链接 Automatic Links

如果将 URL 或电子邮件地址放在尖括号中，它将变成链接：

```
<https://google.com>
<sam@green.eggs.ham>
```

#### 内联链接 Inline Links

内联链接由方括号内的链接文本和括号内的 URL 组成。（URL 后面也可以跟着链接标题，并用引号引起来。）

```
This is an [inline link](/url), and here's [one with
a title](https://fsf.org "click here for a good time!").
```

方括号和圆括号之间不能有空格。链接文本可以包含格式（例如强调），但标题不能。

内联链接中的电子邮件地址无法自动检测，因此必须加上前缀mailto：

```
[Write me!](mailto:sam@green.eggs.ham)
```

#### 引用链接 Reference Links

#### Extension: `shortcut_reference_links`

在快捷引用链接中，第二对括号可以完全省略：

```
See [my website].

[my website]: http://foo.bar.baz
```

#### 内部链接 Internal Links

要链接到同一文档的其他部分，请使用自动生成的标识符（请参阅标题标识符）。例如：

```
See the [Introduction].
```

或者

```
See the [Introduction](#introduction).
```

或者

```
See the [Introduction].

[Introduction]: #introduction
```

内部链接目前支持 HTML 格式（包括 HTML 幻灯片和 EPUB）、LaTeX 和 ConTeXt。



