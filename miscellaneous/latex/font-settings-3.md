在 LaTeX 中使用 `fontspec` 包时，`\setCJKmainfont` 和 `\setmainfont` 都是用来设置字体的命令，但它们的作用和适用场景有明显的区别。以下是两者的详细对比：

---

### 1. **定义和用途**
- **`\setmainfont`**：
  - 用于设置文档的**主要字体**，适用于整个文档的正文，通常用于拉丁字符（英文等）或其他非 CJK（中日韩）语言的字体。
  - 由 `fontspec` 包直接提供，适用于任何 OpenType 或 TrueType 字体。
  - 例如：`\setmainfont{Times New Roman}` 设置 Times New Roman 作为正文字体。

- **`\setCJKmainfont`**：
  - 专门用于设置**中日韩（CJK）字体**，即中文、日文、韩文等字符的字体。
  - 由 `xeCJK` 包提供（需要额外加载 `\usepackage{xeCJK}`），专门为处理 CJK 字符设计。
  - 例如：`\setCJKmainfont{Noto Serif CJK SC}` 设置 Noto Serif CJK SC 作为中文正文字体。

---

### 2. **所属包**
- **`\setmainfont`**：来自 `fontspec` 包，无需额外包即可使用。
- **`\setCJKmainfont`**：来自 `xeCJK` 包，必须在文档导言中加载 `\usepackage{xeCJK}`，并且依赖 `fontspec`（`xeCJK` 内部会自动加载 `fontspec`）。

---

### 3. **适用字符范围**
- **`\setmainfont`**：
  - 主要处理**非 CJK 字符**（如拉丁字母、数字、标点等）。
  - 如果文档中包含 CJK 字符，但未设置 `\setCJKmainfont`，XeLaTeX 可能无法正确显示中文、日文或韩文（通常会报错或显示空白）。
- **`\setCJKmainfont`**：
  - 专门处理 **CJK 字符**（中文、日文、韩文）。
  - `xeCJK` 包会自动识别文档中的 CJK 字符，并应用 `\setCJKmainfont` 指定的字体，而非 CJK 字符仍由 `\setmainfont` 控制。

---

### 4. **使用场景**
- **`\setmainfont`**：
  - 适合纯英文或主要为拉丁字符的文档。
  - 如果文档只有少量 CJK 字符，但不希望引入 `xeCJK` 包的复杂性，可以用 `\fontspec` 临时切换字体。
  - 示例：
    ```latex
    \documentclass{article}
    \usepackage{fontspec}
    \setmainfont{Times New Roman}
    \begin{document}
    English text. {\fontspec{Noto Serif CJK SC} 中文}
    \end{document}
    ```
- **`\setCJKmainfont`**：
  - 适合包含大量 CJK 字符的文档（如中文文档或中英混排）。
  - 通过 `xeCJK` 包自动处理 CJK 字符的排版规则（如标点压缩、行首禁排等）。
  - 示例：
    ```latex
    \documentclass{article}
    \usepackage{xeCJK}
    \usepackage{fontspec}
    \setmainfont{Times New Roman}
    \setCJKmainfont{Noto Serif CJK SC}
    \begin{document}
    English text. 中文文本。
    \end{document}
    ```

---

### 5. **选项支持**
- **`\setmainfont`**：
  - 支持 `fontspec` 提供的丰富选项，如 `Ligatures`, `Numbers`, `Scale`, `Color` 等。
  - 示例：
    ```latex
    \setmainfont[
      Ligatures = TeX,
      Color = FF0000
    ]{Times New Roman}
    ```
- **`\setCJKmainfont`**：
  - 也支持 `fontspec` 的字体选项，但某些选项（如连字）对 CJK 字体可能无效（因为中日韩字体通常不使用连字）。
  - 额外支持 `xeCJK` 的特定选项，如 `BoldFont`、`ItalicFont` 等，用于设置 CJK 字体的粗体或斜体。
  - 示例：
    ```latex
    \setCJKmainfont[
      BoldFont = Noto Serif CJK SC Bold,
      ItalicFont = Noto Serif CJK SC Italic
    ]{Noto Serif CJK SC}
    ```

---

### 6. **注意事项**
- **依赖性**：
  - 使用 `\setCJKmainfont` 必须加载 `xeCJK` 包，否则会报错。
  - `\setmainfont` 不需要 `xeCJK`，只需 `fontspec`。
- **字体选择**：
  - CJK 字体（如 Noto Serif CJK SC、Source Han Serif）通常文件较大，加载可能影响编译速度。
  - 确保系统中安装了指定的 CJK 字体，或者通过 `Path` 选项指定字体文件路径。
- **编译器**：
  - 两者都需要使用 **XeLaTeX** 或 **LuaLaTeX** 编译，`pdflatex` 不支持。
- **冲突处理**：
  - 如果同时使用 `\setmainfont` 和 `\setCJKmainfont`，`xeCJK` 会自动区分 CJK 和非 CJK 字符，分别应用对应的字体。
  - 如果未设置 `\setmainfont`，非 CJK 字符可能使用默认字体（通常是 Computer Modern）。

---

### 7. **综合示例**
以下是一个中英混排的示例，展示两者的结合使用：

```latex
\documentclass{article}
\usepackage{xeCJK}
\usepackage{fontspec}

% 设置英文主要字体
\setmainfont[
  Ligatures = TeX
]{Times New Roman}

% 设置中文主要字体
\setCJKmainfont[
  BoldFont = Noto Serif CJK SC Bold
]{Noto Serif CJK SC}

\begin{document}
This is English text in Times New Roman.

这是一个中文测试，使用 Noto Serif CJK SC。

\textbf{Bold Chinese text: 这是一个粗体中文。}
\end{document}
```

- **输出效果**：
  - 英文部分使用 Times New Roman。
  - 中文部分使用 Noto Serif CJK SC，粗体中文使用指定的 BoldFont。

---

### 8. **总结**
- **`\setmainfont`**：用于设置非 CJK 字符的字体，适用于英文等拉丁字符，来自 `fontspec` 包。
- **`\setCJKmainfont`**：用于设置 CJK 字符的字体，适用于中文、日文、韩文，来自 `xeCJK` 包。
- **选择依据**：
  - 如果文档以英文为主，少量 CJK 字符，可只用 `\setmainfont` 和 `\fontspec` 临时切换。
  - 如果文档包含大量 CJK 字符，建议加载 `xeCJK` 并使用 `\setCJKmainfont` 以获得更好的 CJK 排版支持。

如有具体问题（例如字体设置报错或选项配置），请提供更多细节，我可以进一步协助！