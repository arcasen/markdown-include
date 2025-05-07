---
# Metadata
bibliography: references.bib
# download csl styles from https://github.com/citation-style-language/styles
# store csl styles in ~/.local/share/pandoc/cls (for Debian or macOS)
# csl styles preview: https://www.zotero.org/styles
csl: apa.csl
---

# 示例文档

这是对 Knuth 的引用[@knuth1997]。  

Lamport 的 LaTeX 系统也很重要[@lamport1994, p. 310]。

同时引用[@knuth1997; @lamport1994]。

[参考 @knuth1997; 同时 @lamport1994, p. 310]

[-@knuth1997]

@knuth1997

@knuth1997[第 11 章]

# 参考文献

<!-- 这里会自动生成参考文献列表 -->