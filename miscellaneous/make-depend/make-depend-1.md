
你可以使用 `awk` 命令来提取 `[include filename]` 中的 `filename`。假设你的输入是一个文本文件或字符串，其中包含类似 `[include filename]` 的模式，你可以使用以下 `awk` 命令：

```bash
awk 'match($0, /\[include ([^]]+)\]/, a) {print a[1]}' input.txt
```

### 解释：
1. `match($0, /\[include ([^]]+)\]/, a)`：使用 `match` 函数在每一行中查找匹配 `[include filename]` 的模式。
   - `\[include ` 匹配字面字符串 `[include `（注意 `[` 需要转义）。
   - `([^]]+)` 是一个捕获组，匹配 `]` 之前的一个或多个字符（即 `filename`）。
   - `\]` 匹配字面的 `]`。
   - 匹配结果存储在数组 `a` 中，`a[1]` 是第一个捕获组的内容（即 `filename`）。
2. `{print a[1]}`：如果匹配成功，打印捕获的 `filename`。

### 示例：
如果 `input.txt` 内容如下：
```
This is a line [include file1.txt] and some text.
Another [include file2.txt] here.
```
运行命令后输出：
```
file1.txt
file2.txt
```

### 注意：
- 如果你的 `awk` 版本不支持 `match` 的第三个参数（如较旧的 `awk`），可以使用以下替代方法：
  ```bash
  awk 'match($0, /\[include [^]]+\]/) {print substr($0, RSTART+9, RLENGTH-10)}' input.txt
  ```
  这里 `RSTART` 是匹配的起始位置，`RLENGTH` 是匹配的长度，`+9` 和 `-10` 是为了跳过 `[include ` 和 `]`。

希望这能解决你的问题！