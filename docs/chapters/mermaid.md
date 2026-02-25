## 使用 Mermaid 图表

Mermaid 是一个用于生成图表和流程图的轻量级、基于文本的标记语言，它允许用户使用简洁、易读的代码来创建各种可视化图形。Mermaid 的最大特点是：你只需编写纯文本代码，它就能自动渲染出对应的图表，非常适合在 Markdown 文档、技术文档、Wiki 页面或支持 Mermaid 的编辑器（如 Typora、Obsidian、VS Code 插件、GitLab、GitHub（需插件）等）中使用。

### 主要特点

- 纯文本驱动：用类似代码的方式描述图表，便于版本控制（如 Git）。
- 易于学习：语法简单直观，接近自然语言。
- 支持多种图表类型：
  - 流程图（Flowchart）
  - 序列图（Sequence Diagram）
  - 甘特图（Gantt Chart）
  - 类图（Class Diagram）
  - 状态图（State Diagram）
  - 饼图（Pie Chart）
  - 用户旅程图（User Journey）
  - 实体关系图（ER Diagram）等
- 开源免费：基于 MIT 许可证，社区活跃。
- 响应式与可交互：生成的图表支持缩放、点击等交互（取决于渲染环境）。

### 在 Markdown 中使用

1. 通过过滤器处理 Mermaid 代码，如 `mermaid-filter` 或 `python-mermaid`；
2. 通过 Quarto 编译含 mermaid 代码的 Markdown 文件；
3. 直接使用 `mermaid-cli`(`mmdc`) 生成图片，再在 Markdown 中使用。
   
   ::: note
   为了确保图片的像素质量，可以先放大 4 倍，然后在 Makefile 中使用 `{width=50%}` 属性。
   
   ```makefile
   %.png: %.mmd
	    mmdc -i $< -o $@ -s 4
   ```
   :::

### 示例

1. 流程图

   ```mermaid
   ![[ ../images/mermaid/flowchart.mmd ]]
   ```

   ![流程图](../images/mermaid/flowchart.png){width=50%}

2. 序列图

   ```mermaid
   ![[ ../images/mermaid/sequence-diagram.mmd ]]
   ```

   ![序列图](../images/mermaid/sequence-diagram.png){width=100%}

3. 类图

   ```mermaid
   ![[ ../images/mermaid/class-diagram.mmd ]]
   ```

   ![类图](../images/mermaid/class-diagram.png){width=50%}