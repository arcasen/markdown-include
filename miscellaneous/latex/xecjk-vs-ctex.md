在 LaTeX 中处理中文排版时，`xeCJK` 和 `ctex` 是两个常用的工具，但它们的设计目标、使用场景和功能有显著差异。以下是对 `xeCJK` 和 `ctex` 的详细比较，基于功能、灵活性、使用场景和优缺点等方面：

---

### 1. 概述

- **xeCJK**  
  `xeCJK` 是一个专门为 XeLaTeX 设计的 LaTeX 宏包，旨在简化和优化中文、日文、韩文（CJK）字符的排版。它基于 XeLaTeX 的 UTF-8 编码支持，提供灵活的字体设置和 CJK 字符处理功能，特别适合需要混合多语言排版的场景。[](https://raw.githubusercontent.com/CTeX-org/ctex-kit/master/xeCJK/xeCJK.dtx)[](https://ctan.org/tex-archive/macros/xetex/latex/xecjk)

- **ctex**  
  `ctex` 是一个宏包和文档类集合（包括 `ctexart`、`ctexbook`、`ctexrep` 和 `ctexbeamer`），为中文排版提供全面的本地化支持。它不仅支持 XeLaTeX，还兼容 pdfLaTeX 和 LuaLaTeX，提供了更完整的中文排版规范（如标题、摘要、目录的本地化）。[](https://www.overleaf.com/learn/latex/Chinese)[](https://github.com/jgm/pandoc/issues/2322)

---

### 2. 主要功能比较

| 特性             | xeCJK                                                                            | ctex                                                                                |
| ---------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| **设计目标**     | 专注于 CJK 字符的灵活排版，适合混合多语言文档（中、英、日、韩等）。              | 提供全面的中文本地化支持，适合需要标准中文排版规范的文档。                          |
| **编译器支持**   | 仅支持 XeLaTeX。                                                                 | 支持 XeLaTeX、pdfLaTeX 和 LuaLaTeX。                                                |
| **字体设置**     | 通过 `\setCJKmainfont` 等命令灵活设置 CJK 字体，可分别设置主字体、粗体、斜体等。 | 自动检测系统并设置默认字体（如 Windows 上的 SimSun），也支持自定义。                |
| **CJK 字符处理** | 自动忽略 CJK 字符间的空格，调整 CJK 与非 CJK 字符间距，支持全角标点特殊效果。    | 提供类似功能，但更注重中文排版规范（如标点压缩、段首缩进）。                        |
| **本地化支持**   | 仅处理字符排版，不提供文档结构的本地化（如目录、摘要等）。                       | 提供完整的中文本地化（如“摘要”翻译为“Abstract”，“目录”翻译为“Table of Contents”）。 |
| **使用复杂性**   | 简单灵活，只需加载宏包并设置字体即可。                                           | 功能丰富，但配置可能稍复杂，适合需要标准中文排版的场景。                            |
| **适用场景**     | 适合混合语言文档或只需要少量中文的场景。                                         | 适合全中文或需要严格遵循中文排版规范的文档（如学术论文、书籍）。                    |

---

### 3. 使用场景

- **xeCJK**  
  - **优点**：  
    - 灵活性高，适合在英文或其他语言文档中嵌入少量 CJK 字符（如学术论文中的中文引用或术语）。  [](https://www.overleaf.com/learn/latex/Chinese)
    - 支持多种 CJK 语言（中文、日文、韩文），并能轻松切换字体。  [](https://raw.githubusercontent.com/CTeX-org/ctex-kit/master/xeCJK/xeCJK.dtx)
    - 自动处理 CJK 字符间距和全角标点样式（如 `kaiming` 标点风格），无需额外环境。  [](https://ctan.org/tex-archive/macros/xetex/latex/xecjk)
    - 配置简单，适合快速上手。  
  - **缺点**：  
    - 仅支持 XeLaTeX，限制了编译器的选择。  
    - 不提供文档结构的本地化（如“摘要”或“目录”），需要手动设置。  
    - 对某些罕见字符的支持可能依赖字体，可能需要额外配置。  [](https://tex.stackexchange.com/questions/576111/some-chinese-characters-can-no-show-using-ctex)

  - **示例代码**：  
    ```latex
    \documentclass{article}
    \usepackage{xeCJK}
    \setCJKmainfont{Noto Serif CJK SC}
    \begin{document}
    你好，世界！This is a mixed-language document.
    \end{document}
    ```

- **ctex**  
  - **优点**：  
    - 提供完整的中文本地化支持，适合需要标准中文排版的文档（如学术论文、书籍、幻灯片）。  [](https://www.overleaf.com/learn/latex/Chinese)
    - 支持多种编译器（XeLaTeX、pdfLaTeX、LuaLaTeX），兼容性更强。  [](https://github.com/jgm/pandoc/issues/2322)
    - 自动设置系统默认字体（如 Windows 上的 SimSun），减少手动配置。  [](https://github.com/boathit/CTEX/blob/master/texmf/tex/latex/ctex/fontset/ctex-xecjk-winfonts.def)
    - 提供文档类（如 `ctexart`），直接支持中文排版规范（如段首缩进、标点压缩）。  
  - **缺点**：  
    - 配置相对复杂，文档类选项较多，可能对初学者不够友好。  [](https://medium.com/%40xszhong/chinese-latex-1a261a8b557)
    - 对于混合语言文档，设置可能显得繁琐，灵活性不如 `xeCJK`。  
    - 某些情况下，默认字体可能不支持罕见字符（如“珅”），需要手动切换字体。  [](https://tex.stackexchange.com/questions/576111/some-chinese-characters-can-no-show-using-ctex)

  - **示例代码**：  
    ```latex
    \documentclass{ctexart}
    \begin{document}
    \tableofcontents
    \begin{abstract}
    这是摘要。
    \end{abstract}
    \section{前言}
    你好，世界！This is a mixed-language document.
    \end{document}
    ```

---

### 4. 优缺点总结

- **xeCJK**：  
  - **优点**：轻量、灵活，适合混合语言文档或只需要少量 CJK 字符的场景；支持多种 CJK 语言；易于设置字体和标点样式。  
  - **缺点**：仅限 XeLaTeX，缺乏文档结构的本地化支持，某些罕见字符可能需要额外字体配置。  

- **ctex**：  
  - **优点**：提供全面的中文排版支持，适合需要严格遵循中文规范的文档；支持多种编译器；自动本地化文档结构。  
  - **缺点**：配置稍复杂，灵活性略逊于 `xeCJK`，默认字体可能不支持某些罕见字符。  

---

### 5. 实际选择建议

- **选择 xeCJK 的场景**：  
  - 你只需要在英文或其他语言文档中插入少量中文、日文或韩文。  
  - 你希望更灵活地控制字体和排版细节。  
  - 你只使用 XeLaTeX 编译器，且不需要复杂的文档结构本地化。  
  - 示例：学术论文中插入中文术语、混合语言的简短文档。  

- **选择 ctex 的场景**：  
  - 你需要编写全中文文档，或需要严格遵循中文排版规范（如学术论文、书籍、报告）。  
  - 你需要文档结构的本地化支持（如自动翻译“摘要”和“目录”）。  
  - 你可能使用 pdfLaTeX 或 LuaLaTeX，或者需要跨平台兼容性。  
  - 示例：中文学术论文、书籍、Beamer 幻灯片。  

- **混合使用**：  
  在某些情况下，可以结合两者的优点。例如，使用 `ctexart` 文档类以获得本地化支持，同时加载 `xeCJK` 来灵活设置字体。需要注意的是，混合使用可能导致冲突，需仔细配置。[](https://github.com/CTeX-org/ctex-kit/issues/560)

---

### 6. 其他注意事项

- **字体支持**：  
  - `xeCJK` 和 `ctex` 都依赖字体支持罕见字符。默认字体（如 `ctex` 的 Fandol 或 `xeCJK` 的 Noto Serif CJK SC）可能不支持某些生僻字，需切换到更全面的字体（如 Noto Serif CJK SC）。  [](https://tex.stackexchange.com/questions/576111/some-chinese-characters-can-no-show-using-ctex)
  - 示例：设置 `xeCJK` 使用 Noto 字体：  
    ```latex
    \setCJKmainfont{Noto Serif CJK SC}
    ```

- **标点样式**：  
  - `xeCJK` 支持多种标点样式（如 `kaiming`、`quanjiao`），可通过 `\xeCJKsetup{PunctStyle=kaiming}` 设置。  [](https://raw.githubusercontent.com/CTeX-org/ctex-kit/master/xeCJK/xeCJK.dtx)
  - `ctex` 也支持类似功能，但更注重中文规范的标点压缩。

- **兼容性问题**：  
  - `xeCJK` 可能与其他宏包（如 `listings` 或 `docmute`）存在冲突，需注意加载顺序或查阅 GitHub 上的 issue 解决方案。  [](https://github.com/CTeX-org/ctex-kit/issues/306)[](https://github.com/CTeX-org/ctex-kit/issues/560)
  - `ctex` 在 pdfLaTeX 下需要额外的编码设置（如 `CJKutf8`），而 `xeCJK` 仅限 XeLaTeX，无需此步骤。[](https://www.overleaf.com/learn/latex/Chinese)

- **维护与更新**：  
  - `xeCJK` 是 `ctex-kit` 项目的一部分，维护较为活跃，适合现代 LaTeX 用户。  [](https://ctan.org/tex-archive/macros/xetex/latex/xecjk)
  - `ctex` 虽然功能全面，但部分用户认为其设计较为传统，灵活性稍逊。[](https://medium.com/%40xszhong/chinese-latex-1a261a8b557)

---

### 7. 结论

- 如果你需要**简单、灵活**的 CJK 字符排版，且主要使用 XeLaTeX，**xeCJK** 是更好的选择，适合混合语言文档或快速插入中文。  
- 如果你需要**全面的中文本地化**支持，遵循标准中文排版规范（如学术文档、书籍），或需要兼容多种编译器，**ctex** 是更合适的选择。  
- 在实际使用中，建议根据文档需求选择合适的工具，并确保字体支持完整。如果需要进一步的配置帮助，可以参考 CTAN 文档或 GitHub 上的 `ctex-kit` 项目。[](https://ctan.org/tex-archive/macros/xetex/latex/xecjk)[](https://github.com/CTeX-org/ctex-kit/tree/master/xeCJK)

如需更具体的代码示例或配置帮助，请提供你的具体需求！