### HTML 代码

#### 扩展：`raw_html`

可以直接在文档中插入 HTML 代码（除了代码块等，其中 `<`, `>` 和 `&` 符不会被翻译）。因为标准 Markdown 允许插入 HTML，但是 Pandoc 为了可以根据需要禁用 HTML，将其设计成一个扩展。

#### 扩展：`markdown_in_html_blocks`

使用 `markdown_strict` 格式的时候，HTML 代码中的 Markdown 语法不会被翻译，
但是使用 Pandoc 的 Markdown 格式 markdown 格式时，HTML 代码中的 Markdown 语法也会被翻译，但是有一个例外，HTML 代码 `<script>` 和 `<style>` 标签中的Markdown 语法也不会被翻译。

例如，Pandoc 会将

```
<table>
<tr>
<td>*one*</td>
<td>[a link](https://google.com)</td>
</tr>
</table>
```

转换成：

```
<table>
<tr>
<td><em>one</em></td>
<td><a href="https://google.com">a link</a></td>
</tr>
</table>
```