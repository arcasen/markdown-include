明白了，你是想实现类似 Debian 系统中软件包构建或者某些大型项目中常见的 `makefile.d` 目录功能。

这种模式的核心逻辑是：**主 Makefile 不直接列出所有源文件，而是包含（include）一个目录下的所有子 Makefile 片段。**

这通常用于自动依赖生成或模块化配置。以下是几种实现方式：

### 1. 最标准的“makefile.d”模式

这是最接近你描述的用法。通常用于存放自动生成的依赖文件（`.d` 文件），但也可以用于手动编写的规则。

假设你的目录结构如下：
```bash
project/
├── Makefile
└── makefile.d/
    ├── module-a.mk
    ├── module-b.mk
    └── utils.mk
```

**Makefile 内容：**
```makefile
# 定义子文件目录
MK_DIR := makefile.d

# 1. 查找目录下所有的 .mk 文件
MK_FILES := $(wildcard $(MK_DIR)/*.mk)

# 2. 【可选】如果需要递归查找子目录，使用 ** (GNU Make 3.81+)
# MK_FILES := $(wildcard $(MK_DIR)/**/*.mk)

# 3. 关键步骤：包含这些文件
# 这会将 makefile.d 下的所有规则、变量引入到当前命名空间
include $(MK_FILES)

# 主目标
all:
@echo "主 Makefile 执行"
@echo "已加载配置文件: $(MK_FILES)"
```

**makefile.d/module-a.mk 内容：**
```makefile
# 这个文件会被主 Makefile 包含
MODULE_A_SRC = src/module_a/main.c
MODULE_A_OBJ = build/module_a/main.o

# 你可以在这里定义特定的规则
$(MODULE_A_OBJ): $(MODULE_A_SRC)
gcc -c $< -o $@

# 导出变量给主 Makefile 使用
EXTRA_OBJS += $(MODULE_A_OBJ)
```

---

### 2. 自动发现并包含（更自动化）

如果你希望完全不用在主 Makefile 里写死文件名，可以结合 `notdir` 和循环来处理，但这通常用于定义通用行为而不是直接包含（因为 `include` 本身支持通配符列表）。

**进阶技巧：检查文件是否存在再包含**
```makefile
MK_DIR := makefile.d

# 获取所有 .mk 文件
ALL_MK := $(wildcard $(MK_DIR)/*.mk)

# 检查是否有文件，防止 include 报错
ifneq ($(ALL_MK),)
include $(ALL_MK)
else
$(warning 警告: 在 $(MK_DIR) 中没有找到 .mk 文件)
endif
```

---

### 3. 常见变体：用于依赖管理 (-MMD)

在 C/C++ 项目中，`.d` 目录通常用来存放编译器生成的依赖文件，以实现头文件变动时自动重新编译。

**示例：**
```makefile
# 编译输出目录
BUILD_DIR := build
# 依赖文件存放目录
DEPS_DIR := $(BUILD_DIR)/.deps

# 查找所有的依赖文件
-include $(shell find $(DEPS_DIR) -name '*.d' -type f 2>/dev/null || echo '')
# 注：前面的 '-' 表示即使文件不存在也不要报错

%.o: %.c
@mkdir -p $(dir $(DEPS_DIR)/$*.d)
# 生成目标文件的同时生成依赖文件
gcc -MMD -MP -MF $(DEPS_DIR)/$*.d -c $< -o $@
```

### 总结

- **核心命令：** `include $(wildcard path/to/dir/*.mk)`
- **作用：** 将 `makefile.d` 目录下的所有 `.mk` 文件内容合并到主 Makefile 中。
- **优点：** 模块化，便于团队协作，新增模块只需往目录里丢文件，无需修改主 Makefile。

要同时查找 `.mak` 和 `.mk` 后缀的文件，你可以使用以下几种方法。推荐使用 `wildcard` 函数配合多个模式，或者利用 shell 命令。

以下是具体的实现方式：

### 方法一：使用 `$(wildcard ...)` 列出所有模式（推荐）

这是最标准、可读性最好的 GNU Make 写法。你只需要在 `wildcard` 函数中列出所有想要匹配的模式，用空格分隔。

```makefile
MK_DIR := makefile.d

# 查找 .mk 和 .mak 后缀的文件
# wildcard 支持多个参数，结果会合并成一个列表
MK_FILES := $(wildcard $(MK_DIR)/*.mk $(MK_DIR)/*.mak)

# 如果需要递归查找子目录 (GNU Make 3.81+)
# MK_FILES := $(wildcard $(MK_DIR)/**/*.mk $(MK_DIR)/**/*.mak)

# 包含找到的所有文件
include $(MK_FILES)
```

### 方法二：使用 `$(patsubst ...)` 动态生成文件名列表

如果你有很多后缀，或者想把后缀定义成变量以便复用，可以使用这种方法。

```makefile
MK_DIR := makefile.d
# 定义你想查找的后缀列表
EXTS := .mk .mak

# 使用 patsubst 为每个后缀生成对应的通配符路径
# $(foreach ...) 会遍历 EXTS 中的每一个元素
PATTERNS := $(foreach ext,$(EXTS),$(MK_DIR)/*$(ext))

# 查找文件
MK_FILES := $(wildcard $(PATTERNS))

include $(MK_FILES)
```

### 方法三：使用 Shell 的花括号展开

这种方法依赖于底层操作系统的 Shell（通常是 Bash），利用 `{}` 来展开后缀。

```makefile
MK_DIR := makefile.d

# 使用 shell 命令，利用 {} 展开 .mk 和 .mak
# 注意：这需要调用 shell，且依赖于 shell 的 brace expansion 功能
MK_FILES := $(shell echo $(MK_DIR)/*.{mk,mak})

# 或者使用 find 命令（更健壮，支持递归）
# MK_FILES := $(shell find $(MK_DIR) -type f $ -name "*.mk" -o -name "*.mak" $)

include $(MK_FILES)
```

---

### 💡 补充建议：如何处理找不到文件的情况

当你查找多种后缀时，如果某个后缀的文件不存在，`include` 指令可能会报错（“没有那个文件或目录”）。为了防止报错中断构建，建议加上 `-include` 或者检查逻辑。

**推荐写法（带静默忽略）：**
```makefile
MK_DIR := makefile.d
MK_FILES := $(wildcard $(MK_DIR)/*.mk $(MK_DIR)/*.mak)

# '-' 号表示：即使这里列出的文件不存在，也不要报错
-include $(MK_FILES)
```

**或者使用 ifneq 判断：**
```makefile
MK_DIR := makefile.d
MK_FILES := $(wildcard $(MK_DIR)/*.mk $(MK_DIR)/*.mak)

# 只有当列表不为空时才包含
ifneq ($(MK_FILES),)
include $(MK_FILES)
endif
```