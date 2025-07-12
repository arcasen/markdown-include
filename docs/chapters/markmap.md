## 使用 Markmap 制作思维导图

### 什么是 Markmap ？

[Markmap][^markmap] 是一个将 Markdown 文本转换为交互式思维导图的工具，简单易用，适合整理笔记、规划项目或可视化复杂信息。Markmap 是一个 JavaScript 库，能够解析 Markdown 文本的层级结构（如标题、列表等），并将其渲染为交互式思维导图。它支持：

- Markdown 语法（链接、粗体、斜体、代码块等）
- 数学公式（通过 KaTeX）
- 动态交互（缩放、拖动、折叠/展开节点）
- 导出为 HTML 或 SVG 文件

[Markmap]: <https://markmap.js.org/>
[^markmap]: <https://markmap.js.org/>

### 使用方法

#### 使用在线编辑器

访问 Markmap 官方在线编辑器：<https://markmap.js.org/repl>

#### 使用 markmap-cli

1. 确保系统安装 Node.js（版本 ≥ 10）。
2. 全局安装 Markmap[^markmap-version]：
   ```bash
   npm install -g markmap-cli@0.14
   ```
3. 运行命令将 Markdown 文件转换为思维导图：
   ```bash
   markmap sample.md
   ```
   - 输出为 `sample.html`，自动在浏览器打开。
   - 可选参数：
     - `-o output.html`：指定输出文件名
     - `--enable-mathjax`：启用 MathJax 渲染数学公式
     - `--enable-prism`：启用 PrismJS 代码高亮
     - `--no-open`：生成后不自动打开浏览器

[^markmap-version]: Node 14 兼容的版本为 markmap-cli 0.14，而 markmap-cli 0.15 到 0.18 需要 Node 18

#### 使用 VS Code 插件

1. 在 VS Code 中安装扩展：搜索 “Markmap” 并安装。
2. 创建以 `.mm.md` 结尾的 Markdown 文件（或普通 `.md` 文件）。
3. 编写 Markdown 文本，点击右上角的 “Markmap” 图标或使用快捷键（默认 `Ctrl+Alt+M`）预览思维导图。
4. 可点击 “Export” 按钮导出为 HTML。

