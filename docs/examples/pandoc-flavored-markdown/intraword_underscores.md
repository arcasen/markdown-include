To emphasize some text, surround it with `*`s or `_`, like this:

This text is _emphasized with underscores_, and this
is *emphasized with asterisks*.

Double `*` or `_` produces strong emphasis:

This is **strong emphasis** and __with underscores__.

A `*` or `_`  character surrounded by spaces, or backslash-escaped, will not trigger emphasis:

This is * not emphasized *, and \*neither is this\*.

Because _ is sometimes used inside words and identifiers, pandoc does not interpret a _ surrounded by alphanumeric characters as an emphasis marker. If you want to emphasize just part of a word, use *:

feas*ible*, not feas*able*.

feas_ible_, not feas_able_.