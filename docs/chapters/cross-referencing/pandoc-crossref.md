### 使用 pandoc-crossref

pandoc-crossref 主要用于交叉引用 图表、公式、章节、表格 等，但 不支持直接交叉引用参考文献（如 `[@citekey]` 生成的文献引用）。

#### 安装 pandoc 和 pandoc-crossref

要想使用 pandoc-crossref，需要安装相互兼容的 pandoc 和 pandoc-crossref；
否则 Pandoc 会提示兼容性问题。如： pandoc-3.6.4 和 pandoc-crossref-v0.3.18.2。

- [pandoc 下载地址](https://github.com/jgm/pandoc/releases)
- [pandoc-crossref 下载地址](https://github.com/lierdakil/pandoc-crossref/releases)

解压缩 pandoc 可执行文件到一个目录中，如 `~/.local/bin/pandoc`。
解压缩 pandoc-crossref 可执行文件到 `~/.local/bin/pandoc-crossref` 中.
帮助文档拷贝到 `~/.local/share/man/man1`中，目录结构如下：

```
$ tree ~/.local/share/man
/home/USERNAME/.local/share/man
└── man1
    ├── pandoc.1.gz
    ├── pandoc-crossref.1
    ├── pandoc-lua.1.gz
    └── pandoc-server.1.gz

```

#### 运行 pandoc-crossref

首先， 需要设置环境变量 PATH：

`export PATH=~/.local/bin:$PATH`

在 macOS 中，首次运行 `pandoc --filter pandoc-crossref` 时会提示：“无法打开“pandoc-crossref”，因为无法验证开发者。” 
点击“取消”，然后在 “系统偏好设置-安全性与隐私-通用” 中“仍然允许” 通过验证。

#### 直接转换成 PDF 时的错误处理

直接转换时出现以下错误：

```
Error producing PDF.
! Undefined control sequence.
l.340 (\passthrough
```

可以先转换成 .tex 文件，然后在文件的导言区中加入：

```
\usepackage{listings}
\newcommand{\passthrough}[1]{#1}
```

或者：添加 `-M listings` 选项[^pandoc-crossref]。

[^pandoc-crossref]: [pandoc-crossref と Eisvogel を併用する](https://mickey-happygolucky.hatenablog.com/entry/2022/04/05/012146)
