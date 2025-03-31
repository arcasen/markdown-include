在 `awk` 中，`FILENAME` 变量会显示文件的完整路径。如果当前目录是 `./`，那么 `FILENAME` 可能会显示为 `./input.txt`，而你可能只想要 `input.txt`。以下是几种方法去除 `./` 前缀：

---

### **方法 1：使用 `sub()` 或 `gsub()` 去除 `./`**
直接在 `awk` 中替换掉 `./`：
```bash
awk '
  match($0, /\[include ([^]]+)\]/, a) {
    found = 1
    files = (files ? files " " : "") a[1]
  }
  END {
    if (found) {
      sub(/^\.\//, "", FILENAME)  # 去除 ./ 前缀
      print FILENAME ": " files
    }
  }
' input.txt
```

**示例输出：**
```
input.txt: file1.txt file2.txt
```

---

### **方法 2：使用 `basename` 命令预处理文件名**
如果文件名可能包含更复杂的路径（如 `../dir/input.txt`），可以使用 `basename`：
```bash
awk -v filename="$(basename input.txt)" '
  match($0, /\[include ([^]]+)\]/, a) {
    found = 1
    files = (files ? files " " : "") a[1]
  }
  END {
    if (found) print filename ": " files
  }
' input.txt
```

**适用场景：**
- 文件名可能是相对路径（如 `../data/input.txt`），但你只想保留 `input.txt`。

---

### **方法 3：多文件处理（自动去除 `./`）**
如果处理多个文件（如 `./input1.txt`、`./input2.txt`），可以在 `awk` 中统一处理：
```bash
awk '
  match($0, /\[include ([^]]+)\]/, a) {
    found[FILENAME] = 1
    files[FILENAME] = (files[FILENAME] ? files[FILENAME] " " : "") a[1]
  }
  END {
    for (f in found) {
      sub(/^\.\//, "", f)  # 去除 ./ 前缀
      print f ": " files[f]
    }
  }
' ./input1.txt ./input2.txt
```

**示例输出：**
```
input1.txt: file1.txt file3.txt
input2.txt: file2.txt file4.txt
```

---

### **方法 4：直接传递纯净文件名（推荐）**
如果文件名是固定的，可以直接通过 `-v` 传递纯净的文件名：
```bash
awk -v name="input.txt" '
  match($0, /\[include ([^]]+)\]/, a) {
    found = 1
    files = (files ? files " " : "") a[1]
  }
  END {
    if (found) print name ": " files
  }
' input.txt
```

**优点：**
- 完全可控，无需处理路径问题。

---

### **总结**
| 需求           | 方法                         | 示例命令                                                  |
| -------------- | ---------------------------- | --------------------------------------------------------- |
| 去除 `./` 前缀 | `sub(/^\.\//, "", FILENAME)` | `awk '...sub(/^\.\//, "", FILENAME)...' input.txt`        |
| 处理复杂路径   | `basename` + `-v` 传参       | `awk -v filename="$(basename input.txt)" '...' input.txt` |
| 多文件处理     | 循环中 `sub(/^\.\//, "", f)` | `awk '...for (f in found) {sub(...); print...}' *.txt`    |
| 固定文件名     | 直接 `-v name="..."`         | `awk -v name="input.txt" '...' input.txt`                 |

选择最适合你场景的方法即可！