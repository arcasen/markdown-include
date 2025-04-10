Helloworld in Python:

```{#helloworld .python .numberLines startFrom="100"}
print('hello,world')
```

The `numberLines` (or `number-lines`) class will cause the lines of the code block to be numbered, starting with 1 or the value of the `startFrom` attribute. The `lineAnchors` (or `line-anchors`) class will cause the lines to be clickable anchors in HTML output.

```{#hello .c .numberLines startFrom="101" .lineAnchors}
#include <stdio.h>

int main(int argc, const char * argv[]) {
  printf("Hello, World!\n");
  return 0;
}
```