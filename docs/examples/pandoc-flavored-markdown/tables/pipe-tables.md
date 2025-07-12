: Demonstration of pipe table syntax.

| Right | Left | Default | Center |
| ----: | :--- | ------- | :----: |
|    12 | 12   | 12      |   12   |
|   123 | 123  | 123     |  123   |
|     1 | 1    | 1       |   1    |

: 在 Markdown 代码中列垂直对齐的管道表格

| fruit  | price |
| ------ | ----: |
| apple  |  2.05 |
| pear   |  1.37 |
| orange |  3.09 |

: 在 Markdown 代码中没有列垂直对齐的管道表格

fruit| price
-----|-----:
apple|2.05
pear|1.37
orange|3.09

: 没有表头的管道表格

|
| ------ | ----: |
| apple  |  2.05 |
| pear   |  1.37 |
| orange |  3.09 |