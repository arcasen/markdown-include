# Pandoc 文献引用示例

Pandoc 支持通过多种方式进行文献引用，主要使用 BibTeX 格式的参考文献数据库。以下是几种常见的引用方式示例：

## 基本引用语法

1. **作者-日期样式引用**（需要 `--citeproc` 或 `-C` 选项）：
   ```
   Blah blah [@smith04, p. 33]; blah [see @doe99, chap. 2].
   ```

2. **无作者引用**：
   ```
   Blah blah [-@smith04].
   ```

3. **文字引用**：
   ```
   @smith04 says blah.
   ```

## 完整示例文档

```markdown
---
title: "示例论文"
bibliography: references.bib
csl: apa.csl  # 可选，指定引用样式
---

# 引言

根据最近研究[@smith2020; @johnson2018]，深度学习已经取得了显著进展。
正如@lee2019所述，这一领域的快速发展带来了新的挑战。

# 参考文献
```

## 编译命令

使用 Pandoc 处理带有引用的文档：

```bash
pandoc example.md --citeproc --bibliography=references.bib -o example.pdf
```

或简写形式：

```bash
pandoc example.md -C --biblio=references.bib -o example.pdf
```

## 引用样式文件(CSL)

Pandoc 支持使用 CSL (Citation Style Language) 文件来控制引用格式。常用样式包括：
- `apa.csl` (APA 格式)
- `chicago-author-date.csl` (芝加哥作者-日期格式)
- `ieee.csl` (IEEE 格式)

可以从 [Zotero Style Repository](https://www.zotero.org/styles) 下载各种样式文件。

## 注意事项

1. 确保 BibTeX 文件 (`references.bib`) 包含所有引用的文献
2. 引用键（如 `@smith2020`）必须与 BibTeX 文件中的条目匹配
3. 使用 `--citeproc` 选项处理引用（Pandoc 2.11+）
4. 较旧版本可能需要使用 `pandoc-citeproc` 过滤器

## BibTeX 文件示例 (`references.bib`)

```bibtex
@article{smith2020,
  author  = {Smith, John and Doe, Jane},
  title   = {Advances in Deep Learning},
  journal = {Journal of AI Research},
  year    = {2020},
  volume  = {15},
  pages   = {123-145}
}

@book{johnson2018,
  author    = {Johnson, Alan},
  title     = {Machine Learning Fundamentals},
  publisher = {Springer},
  year      = {2018}
}
```

以上是 Pandoc 文献引用的基本用法，实际使用时可以根据需要调整引用样式和格式。