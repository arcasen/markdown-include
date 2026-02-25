### \LaTeX/\TeX 代码

#### 扩展：`raw_tex`

除了原始 HTML 之外，Pandoc 还允许将原始 \LaTeX、\TeX 和 ConTeXt 代码包含在文档中。内联 \TeX 命令将被保留，并原封不动地传递给 \LaTeX 和 ConTeXt 编写器。因此，例如，您可以使用 \LaTeX 来包含 BibTeX 引用：

```latex
This result was proved in \cite{jones.1967}.
```

请注意，在 \LaTeX 环境中，例如

```latex
\begin{tabular}{|l|l|}\hline
Age & Frequency \\ \hline
18--25  & 15 \\
26--35  & 33 \\
36--45  & 22 \\ \hline
\end{tabular}
```

开始和结束标签之间的材料将被解释为原始 \LaTeX，而不是 Markdown。