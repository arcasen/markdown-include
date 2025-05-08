### 前缀

单个引用：`[@sec:label]` 默认前缀是 `sec.`，显示如：sec. 1.5

合并引用：`[@sec:label1; @sec:label2]`，显示如： secs. 1.5, 1.6

去掉前缀：`[-@sec:label]`， 显示如：1.5

自定义前缀：

```
---
secPrefix: ["Sect.", "Sects."]
---
```

| 类型 | metadata |
| :--: | :--------: |
| 章节 | secPrefix |
| 图片 | figPrefix |
| 表格 | tblPrefix |
| 公式 | eqnPrefix |