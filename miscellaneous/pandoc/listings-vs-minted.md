`listings` 和 `minted` 是 LaTeX 中常用的代码高亮宏包，它们在参数和功能上有显著差异。以下是它们的主要参数对比：

---

### **1. 基本参数差异**
| **功能**         | **`listings`**     | **`minted`**                                        |
| ---------------- | ------------------ | --------------------------------------------------- |
| **依赖**         | 仅需 LaTeX 编译    | 需要 Python 和 `pygments` 库                        |
| **编译命令**     | `pdflatex`         | `pdflatex -shell-escape` 或 `xelatex -shell-escape` |
| **语法高亮引擎** | 内置简单规则       | 使用 Pygments（支持 300+ 语言）                     |
| **性能**         | 更快（无外部调用） | 较慢（调用外部 Python）                             |

---

### **2. 常用参数对比**
#### **通用参数**
| **参数** | **`listings` 示例**                 | **`minted` 示例**                      |
| -------- | ----------------------------------- | -------------------------------------- |
| 语言     | `language=Python`                   | `language=python`                      |
| 行号     | `numbers=left`                      | `linenos=true`                         |
| 行号样式 | `numberstyle=\tiny\color{gray}`     | `numberstyle=\tiny\color{gray}`        |
| 背景色   | `backgroundcolor=\color{lightgray}` | `bgcolor=lightgray`                    |
| 字体     | `basicstyle=\ttfamily\small`        | `fontfamily=ttfamily, fontsize=\small` |

#### **`listings` 独有参数**
| **参数**       | **用途**                             | **示例**                 |
| -------------- | ------------------------------------ | ------------------------ |
| `frame`        | 边框样式（如 `single`, `shadowbox`） | `frame=single`           |
| `rulecolor`    | 边框颜色                             | `rulecolor=\color{blue}` |
| `escapeinside` | 嵌入 LaTeX 代码                      | `escapeinside={\%*}{*)`  |
| `breaklines`   | 自动换行                             | `breaklines=true`        |

#### **`minted` 独有参数**
| **参数**     | **用途**                         | **示例**          |
| ------------ | -------------------------------- | ----------------- |
| `style`      | Pygments 高亮主题（如 `autumn`） | `style=autumn`    |
| `autogobble` | 移除缩进空格                     | `autogobble=true` |
| `tabsize`    | 制表符宽度                       | `tabsize=4`       |
| `mathescape` | 允许数学模式                     | `mathescape=true` |

---

### **3. 功能对比**
- **`listings`**  
  - 优点：轻量、无需外部依赖，适合简单代码展示。  
  - 缺点：高亮规则有限，复杂语言（如 Rust）支持较差。

- **`minted`**  
  - 优点：高亮精准（基于 Pygments），支持更多语言和主题。  
  - 缺点：需要 Python 环境，编译速度慢。

---

### **4. 示例代码**
#### **`listings` 示例**
```latex
\usepackage{listings,xcolor}
\lstset{
    language=Python,
    basicstyle=\ttfamily\small,
    numbers=left,
    backgroundcolor=\color{lightgray},
    frame=single,
    breaklines=true
}
\begin{lstlisting}
def hello():
    print("Hello, LaTeX!")
\end{lstlisting}
```

#### **`minted` 示例**
```latex
\usepackage{minted}
\begin{minted}[
    language=python,
    linenos=true,
    bgcolor=lightgray,
    style=monokai
]{python}
def hello():
    print("Hello, LaTeX!")
\end{minted}
```

---

### **总结**
- 选择 `listings`：需要快速编译、简单代码展示。  
- 选择 `minted`：追求高质量高亮、支持复杂语言或主题。  

注意：`minted` 需在编译时添加 `-shell-escape` 参数（如 `pdflatex -shell-escape file.tex`）。

------

`listings` 和 `minted` 是 LaTeX 中常用的代码高亮宏包，它们在参数和功能上有显著差异。以下是它们的主要参数对比：

---

### **1. 基本参数差异**
| **功能**               | **`listings`**                          | **`minted`**                          |
|------------------------|----------------------------------------|---------------------------------------|
| **依赖**               | 仅需 LaTeX 编译                        | 需要 Python 和 `pygments` 库          |
| **编译命令**           | `pdflatex`                             | `pdflatex -shell-escape` 或 `xelatex -shell-escape` |
| **语法高亮引擎**       | 内置简单规则                           | 使用 Pygments（支持 300+ 语言）       |
| **性能**               | 更快（无外部调用）                     | 较慢（调用外部 Python）               |

---

### **2. 常用参数对比**
#### **通用参数**
| **参数**            | **`listings` 示例**                     | **`minted` 示例**                     |
|---------------------|----------------------------------------|---------------------------------------|
| 语言                | `language=Python`                      | `language=python`                     |
| 行号                | `numbers=left`                         | `linenos=true`                        |
| 行号样式            | `numberstyle=\tiny\color{gray}`        | `numberstyle=\tiny\color{gray}`       |
| 背景色              | `backgroundcolor=\color{lightgray}`    | `bgcolor=lightgray`                   |
| 字体                | `basicstyle=\ttfamily\small`           | `fontfamily=ttfamily, fontsize=\small`|

#### **`listings` 独有参数**
| **参数**            | **用途**                               | **示例**                              |
|---------------------|----------------------------------------|---------------------------------------|
| `frame`             | 边框样式（如 `single`, `shadowbox`）   | `frame=single`                        |
| `rulecolor`         | 边框颜色                               | `rulecolor=\color{blue}`              |
| `escapeinside`      | 嵌入 LaTeX 代码                        | `escapeinside={\%*}{*)`               |
| `breaklines`        | 自动换行                               | `breaklines=true`                     |

#### **`minted` 独有参数**
| **参数**            | **用途**                               | **示例**                              |
|---------------------|----------------------------------------|---------------------------------------|
| `style`            | Pygments 高亮主题（如 `autumn`）       | `style=autumn`                        |
| `autogobble`       | 移除缩进空格                           | `autogobble=true`                     |
| `tabsize`          | 制表符宽度                             | `tabsize=4`                           |
| `mathescape`       | 允许数学模式                           | `mathescape=true`                     |

---

### **3. 功能对比**
- **`listings`**  
  - 优点：轻量、无需外部依赖，适合简单代码展示。  
  - 缺点：高亮规则有限，复杂语言（如 Rust）支持较差。

- **`minted`**  
  - 优点：高亮精准（基于 Pygments），支持更多语言和主题。  
  - 缺点：需要 Python 环境，编译速度慢。

---

### **4. 示例代码**
#### **`listings` 示例**
```latex
\usepackage{listings,xcolor}
\lstset{
    language=Python,
    basicstyle=\ttfamily\small,
    numbers=left,
    backgroundcolor=\color{lightgray},
    frame=single,
    breaklines=true
}
\begin{lstlisting}
def hello():
    print("Hello, LaTeX!")
\end{lstlisting}
```

#### **`minted` 示例**
```latex
\usepackage{minted}
\begin{minted}[
    language=python,
    linenos=true,
    bgcolor=lightgray,
    style=monokai
]{python}
def hello():
    print("Hello, LaTeX!")
\end{minted}
```

---

### **总结**
- 选择 `listings`：需要快速编译、简单代码展示。  
- 选择 `minted`：追求高质量高亮、支持复杂语言或主题。  

注意：`minted` 需在编译时添加 `-shell-escape` 参数（如 `pdflatex -shell-escape file.tex`）。

---------------------------------------
---------------------------------------
在 LaTeX 中，无论是使用 `listings` 还是 `minted` 宏包，都可以为代码块添加标题（caption）。以下是具体方法：

---

### **1. `listings` 添加标题**
使用 `caption` 参数直接为代码块添加标题，并可通过 `label` 设置标签以便交叉引用。

#### **示例代码**
```latex
\usepackage{listings,xcolor}

\lstset{
    language=Python,
    basicstyle=\ttfamily\small,
    numbers=left,
    backgroundcolor=\color{lightgray},
    frame=single,
    breaklines=true
}

\begin{lstlisting}[caption={Python 示例代码}, label=code:hello]
def hello():
    print("Hello, LaTeX!")
\end{lstlisting}

% 交叉引用
参见代码 \ref{code:hello}。
```

#### **参数说明**
- `caption={标题内容}`：设置代码块的标题。  
- `label=自定义标签`：用于交叉引用（需配合 `\ref`）。  
- 标题位置可通过 `captionpos` 调整（如 `captionpos=b` 将标题放在底部）。

---

### **2. `minted` 添加标题**
`minted` 通过 `float` 环境和 `captionof` 命令实现标题（需加载 `caption` 宏包），或直接使用 `listing` 浮动体。

#### **方法 1：使用 `listing` 浮动体（推荐）**
```latex
\usepackage{minted,caption}

\begin{listing}[htbp]
\centering
\begin{minted}[
    language=python,
    linenos=true,
    bgcolor=lightgray
]{python}
def hello():
    print("Hello, LaTeX!")
\end{minted}
\caption{Python 示例代码}
\label{code:hello}
\end{listing}

% 交叉引用
参见代码 \ref{code:hello}。
```

#### **方法 2：内联标题（非浮动）**
```latex
\usepackage{minted,caption}

\begin{minted}[
    language=python,
    linenos=true,
    bgcolor=lightgray
]{python}
def hello():
    print("Hello, LaTeX!")
\end{minted}
\captionof{listing}{Python 示例代码}
\label{code:hello}
```

#### **参数说明**
- `listing` 环境：将代码包裹在浮动体中，避免分页问题。  
- `\caption{标题}`：在浮动体内添加标题。  
- `\captionof{listing}{标题}`：在非浮动环境中强制生成标题（需 `caption` 宏包）。  

---

### **3. 标题样式自定义**
#### **修改标题前缀**
默认标题格式为 **"Listing 1:"**，可通过以下方式调整：
```latex
% 修改 listings 的标题前缀
\renewcommand{\lstlistingname}{代码} % 将 "Listing" 改为 "代码"

% 修改 minted 的标题前缀（需 caption 宏包）
\captionsetup[listing]{name=代码, labelsep=colon)
```

#### **标题字体和间距**
通过 `caption` 宏包统一设置：
```latex
\usepackage{caption}
\captionsetup{font=small, labelfont=bf, skip=5pt} % 控制标题字体和间距
```

---

### **4. 最终效果对比**
| **宏包**   | **标题样式**                        | **浮动支持** |
| ---------- | ----------------------------------- | ------------ |
| `listings` | 直接内联标题（或浮动体需额外配置）  | 可选         |
| `minted`   | 需借助 `listing` 环境或 `captionof` | 推荐浮动体   |

---

### **总结**
- **`listings`**：直接通过 `caption` 参数添加标题，简单快捷。  
- **`minted`**：推荐用 `listing` 浮动体包裹代码，支持自动编号和交叉引用。  
- **统一调整**：通过 `caption` 宏包自定义标题前缀和样式。  

**编译注意**：`minted` 需添加 `-shell-escape` 参数。

