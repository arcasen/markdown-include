# 文件地址解析

## 图片地址

绝对位置、URL 不做变换；相对路径将被替换为相对于主文档的路径

### 绝对位置

以 `/` 开始的路径

![octcat]( /images/goretocat.png)

以 `~` 开始的路径

![octcat]( ~/images/goretocat.png)

### URL 地址

![octcat]( https://octodex.github.com/images/collabocats.jpg)

### 相对位置

以非 `/` 和 `~` 字符开始的路径

[![octcat]( images/goretocat.png)dd](http://)

### 图片链接

[![octcat]( images/goretocat.png)]( https://octodex.github.com/images/collabocats.jpg)

## Markdown 包含路径的解析

绝对位置、URL 不做变换；相对路径将被替换为相对于主文档的路径

### 绝对路径

![[ ~/chapters/ch01.md ]]

![[  /path/to/chapters/ch02.md ]]

### 相对路径

![[ chapters/ch01.md ]]

![[ chapters/ch02.md ]]
