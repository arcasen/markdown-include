### 使用 pandoc-crossref

#### 安装 pandoc 和 pandoc-crossref

要想使用 pandoc-crossref，需要安装相互兼容的 pandoc 和 pandoc-crossref；
否则 Pandoc 会提示兼容性问题。如： pandoc-3.6.4 和 pandoc-crossref-v0.3.18.2。

- [pandoc 下载地址](https://github.com/jgm/pandoc/releases)
- [pandoc-crossref 下载地址](https://github.com/lierdakil/pandoc-crossref/releases)

解压缩 pandoc 到一个目录中，如 `~/.pandoc`。
解压缩 pandoc-crossref 到 `~/.pandoc/bin` 中. 

#### 运行 pandoc-crossref

首先， 需要设置环境变量 PATH：

`export PATH=~/.pandoc/bin:$PATH`

在 macOS 中，运行 `pandoc --filter pandoc-crossref` 时会提示安全问题，需要在 “系统偏好设置-安全性与隐私-通用” 中“允许从以下下载的 App” 通过验证。

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

[^pandoc-crossref]: [pandoc-crossrefとEisvogelを併用する](https://mickey-happygolucky.hatenablog.com/entry/2022/04/05/012146)