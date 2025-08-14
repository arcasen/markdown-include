### 使用 Panflute

Pandoc 过滤器是一个程序，主要功能是：

1. 接收 Pandoc 文档的 JSON 表示
2. 修改文档
3. 输出修改后的 JSON 表示

Panflute 简化了这个过程，让你可以用 Python 轻松操作文档。

先运行以下命令安装 Panflute：

```bash
$ pip3 install panflute
```

::: caution

默认情况下， Pandoc 调用系统的 Python 解释器（如： macOS 是 python2），而上述过滤器需要调用 python3 解释器。解决方案如下（这里特意去掉了过滤器文件的后缀 .py。）：

方案 1： 建立虚拟环境，如：

```bash
mkvirtualenv pandoc
pip install panflute
workon pandoc
```

方案 2：设置过滤器为可执行文件

在 uppercase 开始加入：

```bash
#!/usr/bin/env python3
```

然后，设置过滤器为可执行文件：

```bash
chmod +x uppercase
```

:::

下面的实例中将将 Markdown 文本的字母转换为大写字母：

```python
![[ ../../examples/filters/uppercase ]]
```

```markdown
Hello, World

你好, 世界
```

```bash
pandoc helloworld.md --filter ./uppercase 
<p>HELLO, WORLD</p>
<p>你好, 世界</p>
```
