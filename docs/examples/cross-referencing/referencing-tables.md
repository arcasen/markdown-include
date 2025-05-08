---
tblPrefix: 表
---

Pandoc 表格有以下几种：

- 简单表格，见[@tbl:simple-table]
- 多行表格，见[@tbl:multiline-table]
- 网格表格，见[@tbl:grid-table]
- 管道表格，见[@tbl:pipe-table]

Table: 简单表格示例 {#tbl:simple-table}

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table: 多行表格示例 {#tbl:multiline-table}

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: 网格表格示例 {#tbl:grid-table}

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

Table: 管道表格示例 {#tbl:pipe-table}

| Right | Left | Default | Center |
| ----: | :--- | ------- | :----: |
|    12 | 12   | 12      |   12   |
|   123 | 123  | 123     |  123   |
|     1 | 1    | 1       |   1    |
