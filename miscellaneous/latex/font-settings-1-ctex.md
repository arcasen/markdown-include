`ctex` 宏包（基于 `xeCJK` 或 `luatexja`）在检测系统字体时，会根据操作系统和用户配置自动选择合适的默认中文字体。以下是其检测逻辑的详细说明：

---

### **1. 检测机制**
`ctex` 的字体检测分为两个层面：

#### **(1) 操作系统识别**
- **Windows**：  
  调用 `ctex-fontset-windows.def` 或 `xeCJK-fontset-windows.def`，使用系统预装的字体（如宋体、黑体、楷体、仿宋）。
- **macOS**：  
  调用 `ctex-fontset-mac.def`，默认使用苹方（PingFang SC/TC）或华文系列字体（STHeiti、STKaiti 等）。
- **Linux**：  
  调用 `ctex-fontset-fandol.def`，默认使用 Fandol 字体（一种开源中文字体，通常无需额外安装）。若用户安装了思源（Source Han）或文泉驿（WenQuanYi）字体，可手动覆盖配置。

#### **(2) 字体优先级**
`ctex` 会按以下顺序尝试加载字体：
1. **用户显式指定的字体**（通过 `\setCJKmainfont` 等命令）。
2. **`ctex` 预设的字体集**（如 `fontset=fandol` 或 `fontset=windows`）。
3. **系统默认字体**（通过 `fontspec` 查询系统字体目录）。

---

### **2. 关键配置文件**
`ctex` 的字体检测依赖以下文件（以 `xeCJK` 为例）：
- **Windows**:  
  `texmf-dist/tex/latex/ctex/fontset/ctex-fontset-windows.def`
- **macOS**:  
  `texmf-dist/tex/latex/ctex/fontset/ctex-fontset-mac.def`
- **Linux**:  
  `texmf-dist/tex/latex/ctex/fontset/ctex-fontset-fandol.def`

这些文件定义了不同系统下的默认字体名称，例如：
```latex
% ctex-fontset-windows.def 示例
\setCJKmainfont{SimSun}[BoldFont={SimHei}, ItalicFont={KaiTi}]
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}
```

---

### **3. 手动干预检测**
#### **(1) 强制指定字体集**
在文档中通过 `fontset` 选项覆盖自动检测：
```latex
\documentclass[fontset=windows]{article} % 强制使用 Windows 字体
\usepackage{ctex}
```
可选值：`windows`, `mac`, `fandol`, `ubuntu`, `adobe` 等。

#### **(2) 完全自定义字体**
忽略 `ctex` 的检测逻辑，直接指定字体名：
```latex
\usepackage{ctex}
\setCJKmainfont{Source Han Serif SC} % 思源宋体
\setCJKsansfont{Source Han Sans SC}  % 思源黑体
```
> **注意**：字体名称需与系统内安装的名称一致（可通过 `fc-list :lang=zh` 命令查看）。

---

### **4. 调试字体检测**
如果字体未按预期加载，可通过以下方式排查：
1. **查看日志文件**：  
   编译时生成的 `.log` 文件会记录 `ctex` 实际加载的字体。
2. **检查系统字体列表**：  
   - Windows: 控制面板 → 字体  
   - macOS/Linux: 终端运行 `fc-list :lang=zh`  
3. **强制指定路径**：  
   若字体不在系统目录，可手动指定路径：
   ```latex
   \setCJKmainfont{MyFont}[Path=/path/to/font/, Extension=.ttf]
   ```

---

### **5. 常见问题**
- **字体缺失**：  
  若 `ctex` 检测失败，会回退到 `fandol` 或报错。解决方案：安装系统字体或显式指定字体名。
- **粗体/斜体不生效**：  
  确保字体家族包含对应的 `BoldFont` 和 `ItalicFont` 变体。
- **Linux 下无中文字体**：  
  安装开源字体包（如 `fonts-noto-cjk` 或 `wqy-microhei`）。

通过理解 `ctex` 的检测逻辑，用户可以更灵活地控制中文字体的选择。