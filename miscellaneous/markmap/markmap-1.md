Markmap 是一个将 Markdown 文本转换为交互式思维导图的工具，简单易用，适合整理笔记、规划项目或可视化复杂信息。以下是 Markmap 的使用教程，涵盖安装、基本使用和进阶技巧，基于官方文档和常见实践。[](https://ikerbit.com/markmap-como-crear-mapas-mentales-desde-markdown/)[](https://fenq.com/the-best-mind-map-generation-tool-markmap-tutorial/)

---

### 1. 什么是 Markmap？
Markmap 是一个 JavaScript 库，能够解析 Markdown 文本的层级结构（如标题、列表等），并将其渲染为交互式思维导图。它支持：
- Markdown 语法（链接、粗体、斜体、代码块等）
- 数学公式（通过 KaTeX）
- 动态交互（缩放、拖动、折叠/展开节点）
- 导出为 HTML 或 SVG 文件

官网：https://markmap.js.org/  
GitHub：https://github.com/markmap/markmap

---

### 2. 快速上手

#### 方法 1：在线使用（无需安装）
1. 访问 Markmap 官方在线编辑器：https://markmap.js.org/try
2. 在左侧输入 Markdown 文本，例如：
   ```markdown
   # 思维导图
   ## 分支1
   - 子项1
   - 子项2
   ## 分支2
   - 子项3
   ```
3. 右侧将实时显示思维导图。
4. 支持导出为 HTML 或 SVG 文件。

#### 方法 2：本地安装
Markmap 提供 CLI 工具和 VS Code 插件，适合本地使用。

**安装 CLI 工具**
1. 确保系统安装 Node.js（版本 ≥ 10）。
2. 全局安装 Markmap：
   ```bash
   npm install -g markmap-lib
   ```
3. 运行命令将 Markdown 文件转换为思维导图：
   ```bash
   markmap note.md
   ```
   - 输出为 `note.html`，自动在浏览器打开。
   - 可选参数：
     - `-o output.html`：指定输出文件名
     - `--enable-mathjax`：启用 MathJax 渲染数学公式
     - `--enable-prism`：启用 PrismJS 代码高亮
     - `--no-open`：生成后不自动打开浏览器

**VS Code 插件**
1. 在 VS Code 中安装扩展：搜索 “Markmap” 并安装。[](https://marketplace.visualstudio.com/items?itemName=gera2ld.markmap-vscode)
2. 创建以 `.mm.md` 结尾的 Markdown 文件（或普通 `.md` 文件）。
3. 编写 Markdown 文本，点击右上角的 “Markmap” 图标或使用快捷键（默认 `Ctrl+Alt+M`）预览思维导图。
4. 可点击 “Export” 按钮导出为 HTML。

---

### 3. Markdown 语法示例
Markmap 利用 Markdown 的层级结构（如 `#` 标题或 `-` 列表）生成思维导图。以下是常用语法：

#### 基本层级
```markdown
# 主题
## 子主题1
- 内容1
- 内容2
## 子主题2
- 内容3
  - 子内容3.1
```
- `#` 表示根节点，`##` 表示一级子节点，`-` 表示列表项。
- 缩进决定层级关系。

#### 富文本支持
```markdown
# 思维导图
## 格式
- **粗体**
- *斜体*
- ~~删除线~~
- `代码`
## 链接
- [GitHub](https://github.com)
## 代码块
```js
console.log("Hello, Markmap!");
```
## 数学公式
- $x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$
```
- 支持粗体、斜体、删除线、行内代码。
- 代码块和数学公式需启用 PrismJS 或 KaTeX 支持。

#### 复杂示例
```markdown
# 项目计划
## 准备阶段
- 需求分析
  - 客户访谈
  - 市场调研
- 技术选型
## 开发阶段
- 前端
  - React
  - TypeScript
- 后端
  - Node.js
  - MongoDB
## 测试与部署
- 单元测试
- 持续集成
  - GitHub Actions
```
生成后可交互：点击节点折叠/展开，鼠标滚轮缩放，拖动背景平移。

---

### 4. 进阶使用

#### 在 HTML 中嵌入 Markmap
若需在静态网站中使用 Markmap，可通过 `markmap-autoloader` 实现动态渲染。[](https://stackoverflow.com/questions/71910558/looking-for-an-example-for-using-markmap-in-html-file-with-markdown)
1. 创建 HTML 文件：
   ```html
   <html>
   <body>
     <style>
       .markmap > svg { width: 100%; height: 300px; }
     </style>
     <div class="markmap">
       # 思维导图
       ## 分支1
       - 子项1
       - 子项2
     </div>
     <script src="https://cdn.jsdelivr.net/npm/markmap-autoloader"></script>
   </body>
   </html>
   ```
2. 打开 HTML 文件，Markdown 内容将渲染为思维导图。

#### 与其他工具集成
- **JotterPad**：支持 Markmap 插件，在 Markdown 代码块中设置 `codeBlockRenderAs: markmap`。[](https://jotterpad.medium.com/jotterpad-updates-create-mind-maps-with-markdown-september-2022-84808c105841)
- **Joplin**：安装 Markmap 插件，点击笔记面板中的图标将笔记渲染为思维导图。[](https://discourse.joplinapp.org/t/plugin-markmap/30426)
- **Gatsby**：使用 `gatsby-remark-markmap` 插件，在 Gatsby 项目中渲染 Markdown 代码块为思维导图。[](https://www.gatsbyjs.com/plugins/gatsby-remark-markmap/)
- **React/Vue**：通过 `markmap-lib` 和 `markmap-view` 集成到前端项目。示例见：https://stackblitz.com/edit/markmap-react[](https://markmap.js.org/docs/markmap)

#### 自定义样式
- 修改 SVG 样式：通过 CSS 调整 `.markmap > svg` 的宽度、高度或节点颜色。
- 调整 MathJax/PrismJS 配置：参考 `markmap-lib` 文档自定义数学公式或代码高亮样式。[](https://reposhub.com/javascript/markdown-editor/gera2ld-markmap-lib.html)

---

### 5. 常见问题
- **如何导出静态图像？**
  - CLI 工具支持导出 SVG（需手动转换 PNG）。
  - VS Code 插件可导出 HTML，浏览器截图生成图像。
- **如何处理大型思维导图？**
  - 使用鼠标滚轮缩放，拖动背景平移。
  - 折叠子节点以聚焦关键内容。
- **支持哪些 Markdown 特性？**
  - 标题、列表、链接、粗体、斜体、代码块、数学公式。
  - 不支持表格、图片（可通过链接间接引用）。
- **如何调试？**
  - 检查 Markdown 语法是否正确（层级缩进一致）。
  - 参考 GitHub Discussions 或官方 FAQ。[](https://markmap.js.org/docs/markmap)

---

### 6. 学习资源
- **官方文档**：https://markmap.js.org/[](https://markmap.js.org/api/)
- **GitHub 仓库**：https://github.com/markmap/markmap[](https://github.com/markmap/markmap)
- **YouTube 教程**：搜索 “Markmap tutorial” 或查看 Codefarm 的视频介绍。[](https://www.youtube.com/watch?v=zizQpKLsoYU)
- **社区**：加入 Markdown 或 Markmap 的 Reddit 子版块、GitHub Discussions。[](https://ikerbit.com/markmap-como-crear-mapas-mentales-desde-markdown/)
- **中文教程**：参考 FENQ 的 Markmap 教程（https://java4u.cn/tools/1602.html）。[](https://fenq.com/the-best-mind-map-generation-tool-markmap-tutorial/)

---

### 7. 注意事项
- Markmap 依赖 Markdown 的层级结构，语法错误可能导致渲染失败。
- 大型文档可能影响性能，建议拆分为多个小文件。
- 部分功能（如数学公式）需额外配置 MathJax 或 KaTeX。

---

通过以上步骤，你可以快速上手 Markmap，创建直观、交互式的思维导图。如需更详细的配置或特定场景的帮助，请提供更多细节，我可以进一步指导！