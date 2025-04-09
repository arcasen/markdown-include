## Markdown Cheat Sheet

<!-- Thanks for visiting [The Markdown Guide](https://www.markdownguide.org)! -->

This Markdown cheat sheet provides a quick overview of all the Markdown syntax elements. It can’t cover every edge case, so if you need more information about any of these elements, refer to the reference guides for [basic syntax](https://www.markdownguide.org/basic-syntax/) and [extended syntax](https://www.markdownguide.org/extended-syntax/).

### 基本语法 Basic Syntax 

These are the elements outlined in John Gruber’s original design document. All Markdown applications support these elements.

#### Heading

Syntax:

```
# H1
## H2
### H3
```

#### Bold

Syntax:

```
**bold text**
```

#### Italic

Syntax:

```
*italicized text*
```

#### Blockquote

Syntax:

```
> blockquote
```

#### Ordered List

Syntax:

```
1. First item
2. Second item
3. Third item
```

#### Unordered List

Syntax:

```
- First item
- Second item
- Third item
```

#### Code

Syntax:

```
`code`
```

#### Horizontal Rule

Syntax:

```
---
```

#### Link

Syntax:

```
[Markdown Guide](https://www.markdownguide.org)
```

#### Image

Syntax:

```
![alt text](https://www.markdownguide.org/assets/images/tux.png)
```

### 扩展语法 Extended Syntax

Syntax:

These elements extend the basic syntax by adding additional features. Not all Markdown applications support these elements.

#### Table

Syntax:

```
| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |
```

#### Fenced Code Block

Syntax:

~~~
```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```
~~~

OR

```
~~~
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
~~~
```

#### Footnote

Syntax:

```
Here's a sentence with a footnote. [^1]

[^1]: This is the footnote.
```

#### Heading ID

Syntax:

```
### My Great Heading {#custom-id}
```

#### Definition List

Syntax:

```
term
: definition
```

#### Strikethrough

Syntax:

```
~~The world is flat.~~
```

#### Task List

Syntax:

```
- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media
```

#### Emoji

Syntax:

```
That is so funny! :joy:

(See also [Copying and Pasting Emoji](https://www.markdownguide.org/extended-syntax/#copying-and-pasting-emoji))
```

#### Highlight

Syntax:

```
I need to highlight these ==very important words==.
```

#### Subscript

Syntax:

```
H~2~O
```

#### Superscript

Syntax:

```
X^2^
```
