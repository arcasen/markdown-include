---
title: "LaTeX/Source Code Listings - Wikibooks, open books for an open world"
source: "https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings"
author:
  - "[[Contributors to Wikimedia projects]]"
published: 2006-10-09
created: 2025-06-02
description:
tags:
  - "clippings"
---
\[dismiss\]

![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/OOjs_UI_icon_robot.svg/40px-OOjs_UI_icon_robot.svg.png) The Wikibooks community is developing a policy on the use of generative AI. Please review the [draft policy](https://en.wikibooks.org/wiki/Wikibooks:Artificial_Intelligence "Wikibooks:Artificial Intelligence") and provide feedback on [its talk page](https://en.wikibooks.org/wiki/Wikibooks_talk:Artificial_Intelligence "Wikibooks talk:Artificial Intelligence").

< [LaTeX](https://en.wikibooks.org/wiki/LaTeX "LaTeX")

There are many packages providing code listings and highlighting, below are most popular:

1. [listings](https://ctan.org/pkg/listings): It is very useful and rich in functionality. You can insert the code directly as well as provide the file name containing code. (It should not be confused with [Algorithms and Pseudocode](https://en.wikibooks.org/wiki/LaTeX/Algorithms_and_Pseudocode "LaTeX/Algorithms and Pseudocode")).
2. [minted](https://ctan.org/pkg/minted): It uses the external Python library [Pygments](http://pygments.org/) for code highlighting, which as of February 2021 boasts over 537 supported languages and text formats. As the package relies on external Python code, the setup require a few more steps than a usual LaTeX package, so please have a look at their [GitHub repo](https://github.com/gpoore/minted) and their [manual](https://ctan.org/pkg/minted).

The main use of the listings package is to include the source code of any programming language within your document in a well formatted fashion. The listings package supports highlighting of all the most common languages and it is highly customizable. If you just want to write code within your document the package provides the lstlisting environment:

To use the package, you need to include `\usepackage{listings}` in the preamble of the latex document and define (`\usepackge{listings}`). A complete example is shown as below.

```
% In preamble

\usepackage{listings}

% In body

\begin{document}

\begin{lstlisting}

Put your code here.

\end{lstlisting}

\end{document}
```

There are three ways to include the source in the tex file.

1. Inserting the source code in line `\lstinline` `{<code here>}`.
2. Writing the programming language code in `listing` environment as shown above.
3. Inputting the source code directly from the file itself using the following command `\lstinputlisting{source_filename.py}`. It is very useful if you created a program on several files and you are still editing it. This way, if you modify the source, you just have to recompile the LaTeX code and your document will be updated.

We include the above three example in single code for clarity.

```
\lstset{language=C}     % default language selection

\begin{document}

% usage type 1

The code can be inserted inline, e.g.  emphasizing on keywords \lstinline{while, for} in this manner.

% usage type 2

\begin{lstlisting}

This code is placed in listing environement.

\end{lstlisting}

% usage type 3

\lstinputlisting{source_filename.py}

\end{document}
```

As shown in the above example you can include any file by providing its full name. It will be considered **plain text** and it will be highlighted according to your default language. In above example the `\lstset{}` command is used for defining the default language as C. You may also define the language during inserting the code as shown in example below (language=python). You can also specify the lines to be include from the file. consider following example.

```
\lstinputlisting[language=Python,firstline=37,lastline=45]{source_filename.py}  

\lstinputlisting[language=Python, linerange={37-45,48-50}]{source_filename.py}
```

This comes in handy if you are sure that the file will not change (at least before the specified lines). You may also omit the firstline or lastline parameter: it means *everything up to or starting from this point*.

This is a basic example for some Pascal code:

```
\documentclass{article}

\usepackage{listings}             % Include the listings-package

\begin{document}

\lstset{language=Pascal}          % Set your language (you can change the language for each code-block optionally)

\begin{lstlisting}[frame=single]  % Start your code-block

for i:=maxint to 0 do

begin

{ do nothing }

end;

Write('Case insensitive ');

Write('Pascal keywords.');

\end{lstlisting}

\end{document}
```

![](https://upload.wikimedia.org/wikipedia/commons/3/3e/Latex_Pascal_Listing.png)

It supports the following programming languages:

ABAP <sup>2,4</sup>, ACSL, Ada <sup>4</sup>, Algol <sup>4</sup>, Ant, Assembler <sup>2,4</sup>, Awk <sup>4</sup>, bash, Basic <sup>2,4</sup>, C# <sup>5</sup>, C++ <sup>4</sup>, C <sup>4</sup>, Caml <sup>4</sup>, Clean, Cobol <sup>4</sup>, Comal, csh, Delphi, Eiffel, Elan, erlang, Euphoria, Fortran <sup>4</sup>, GCL, Go (golang), Gnuplot, Haskell, HTML, IDL <sup>4</sup>, inform, Java <sup>4</sup>, JVMIS, ksh, Lisp <sup>4</sup>, Logo, Lua <sup>2</sup>, make <sup>4</sup>, Mathematica <sup>1,4</sup>, Matlab, Mercury, MetaPost, Miranda, Mizar, ML, Modelica <sup>3</sup>, Modula-2, MuPAD, NASTRAN, Oberon-2, Objective C <sup>5</sup>, OCL <sup>4</sup>, Octave, Oz, Pascal <sup>4</sup>, Perl, PHP, PL/I, Plasm, POV, Prolog, Promela, Python, R, Reduce, Rexx, RSL, Ruby, S <sup>4</sup>, SAS, Scilab, sh, SHELXL, Simula <sup>4</sup>, SQL, tcl <sup>4</sup>, TeX <sup>4</sup>, VBScript, Verilog, VHDL <sup>4</sup>, VRML <sup>4</sup>, XML, XSLT.

For some of them, several dialects are supported. For more information, refer to the documentation that comes with the package, it should be within your distribution under the name listings-\*.dvi.

Notes

1. It supports Mathematica code only if you are typing in plain text format. You can't include \*.NB files `\lstinputlisting{...}` as you could with any other programming language, but Mathematica can export in a pretty-formatted LaTeX source.
2. Specification of the dialect is mandatory for these languages (e.g. `language={[x86masm]Assembler}`).
3. Modelica is supported via the dtsyntax package available [here](https://code.google.com/p/dtsyntax/).
4. For these languages, multiple dialects are supported. C, for example, has ANSI, Handel, Objective and Sharp. See p. 12 of the [listings manual](http://mirrors.ctan.org/macros/latex/contrib/listings/listings.pdf) for an overview.
5. Defined as a dialect of another language

You can modify several parameters (for details see [listing package developer guide](https://mirror.niser.ac.in/ctan/macros/latex/contrib/listings/listings-devel.pdf)) that will affect how the code is shown. You can put the following code anywhere in the document (it doesn't matter whether before or after `\begin{document}`), change it according to your needs. The meaning is explained next to any line.

```
\usepackage{listings}

\usepackage{color}

\definecolor{mygreen}{rgb}{0,0.6,0}

\definecolor{mygray}{rgb}{0.5,0.5,0.5}

\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{ 

  backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument

  basicstyle=\footnotesize,        % the size of the fonts that are used for the code

  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace

  breaklines=true,                 % sets automatic line breaking

  captionpos=b,                    % sets the caption-position to bottom

  commentstyle=\color{mygreen},    % comment style

  deletekeywords={...},            % if you want to delete keywords from the given language

  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code

  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8

  firstnumber=1000,                % start line enumeration with line 1000

  frame=single,                       % adds a frame around the code

  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)

  keywordstyle=\color{blue},       % keyword style

  language=Octave,                 % the language of the code

  morekeywords={*,...},            % if you want to add more keywords to the set

  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)

  numbersep=5pt,                   % how far the line-numbers are from the code

  numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers

  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))

  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'

  showstringspaces=false,          % underline spaces within strings only

  showtabs=false,                  % show tabs within strings adding particular underscores

  stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered

  stringstyle=\color{mymauve},     % string literal style

  tabsize=2,                       % sets default tabsize to 2 spaces

  title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title

}
```

It would be helpful to categorize the properties based upon their functions.

<table><tbody><tr><th></th><th>Keyword</th><th>Value</th><th>Explanation</th></tr><tr><td colspan="4"><b>General</b></td></tr><tr><td></td><td>language=Python,</td><td></td><td>The programming language in the listing, e.g., Python.</td></tr><tr><td></td><td>title=\lstname</td><td></td><td>If a file is inputted using command \lstinputlisting{FNAME.PY} then by default title is file name, i.e. FNAME.PY</td></tr><tr><td></td><td>captionpos=b,</td><td></td><td>The caption-position for the listing is set to bottom.</td></tr><tr><td></td><td>backgroundcolor=\color{white},</td><td></td><td>Background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument</td></tr><tr><td></td><td>basicstyle=\footnotesize,</td><td></td><td>The size of the fonts that are used for the code</td></tr><tr><td></td><td>breaklines=true,</td><td></td><td>Sets automatic line breaking</td></tr><tr><td colspan="4"><b>Tabs and Space settings</b></td></tr><tr><td></td><td>breakatwhitespace=false,</td><td></td><td>Sets if automatic breaks should only happen at whitespace</td></tr><tr><td></td><td>showspaces=false,</td><td></td><td>show spaces everywhere adding particular underscores; it overrides 'showstringspaces'</td></tr><tr><td></td><td>showtabs=false,</td><td></td><td>show tabs within strings adding particular underscores</td></tr><tr><td></td><td>keepspaces=true,</td><td></td><td>keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)</td></tr><tr><td></td><td>tabsize=2,</td><td></td><td>Sets default tabsize to 2 spaces</td></tr><tr><td colspan="4"><b>Frame setting</b></td></tr><tr><td></td><td>frame=single,</td><td></td><td>Adds a frame around the code</td></tr><tr><td></td><td>rulecolor=\color{black},</td><td></td><td>if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))</td></tr><tr><td colspan="4"><b>Numbering code line</b></td></tr><tr><td></td><td>firstnumber=1,</td><td></td><td>The counting for line number in each listing will start with this value.</td></tr><tr><td></td><td>stepnumber=2,</td><td></td><td>Interval at which the numbers should be printed.</td></tr><tr><td></td><td>numbers=left,</td><td></td><td>Place the numbering on left side of the code</td></tr><tr><td></td><td>numberstyle=\tiny\color{mygray},</td><td></td><td>Style for the line-numbers</td></tr><tr><td></td><td>numbersep=10pt</td><td></td><td>Space between the code and line numbering.</td></tr><tr><td colspan="4"><b>Keywords</b></td></tr><tr><td></td><td>otherkeywords={++, --}</td><td></td><td></td></tr><tr><td></td><td>morekeywords={self, __init__}</td><td></td><td></td></tr><tr><td></td><td>keywordstyle=\color{blue},</td><td></td><td>Keyword style</td></tr><tr><td></td><td>deletekeywords={...},</td><td></td><td>If you want to delete keywords from the given language</td></tr><tr><td colspan="4"><b>Strings</b></td></tr><tr><td></td><td>stringstyle=\color{mymauve},</td><td></td><td>String literal style</td></tr><tr><td></td><td>showstringspaces=false,</td><td></td><td>Underline spaces within strings only</td></tr><tr><td colspan="4"><b>Comments</b></td></tr><tr><td></td><td>commentstyle=\color{mygreen},</td><td></td><td>The comments in the code shall be shown in this color/formatting</td></tr><tr><td colspan="4"><b>Emphasize</b></td></tr><tr><td></td><td>emph={__init__,self,},</td><td></td><td>To emphasize on these extra words</td></tr><tr><td></td><td>emphstyle=\color{blue},</td><td></td><td>color, style for the words to be emphasize</td></tr><tr><td colspan="4"><b>Escape sequence</b></td></tr><tr><td></td><td>escapeinside={(*}{*)},</td><td></td><td>If you want to execute the latex commands within listing environment. The latex code shall be wrapped as following.<p>(* LATEX CODE *)| Here (* and *) are escape sequences marking the beginning and end of the latex code. You may define them as per your convenience as shown in the left coloumn.</p></td></tr><tr><td colspan="4"><b>Special</b></td></tr><tr><td></td><td>extendedchars=true,</td><td></td><td>It lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8</td></tr><tr><td></td><td>autogobble=true,</td><td></td><td></td></tr><tr><td></td><td>upquote=true,</td><td></td><td>Forces the quote symbol to be vertical.</td></tr></tbody></table>

escapeinside

The escapeinside line needs an explanation. The option `escapeinside={A}{B}` will define delimiters for escaping into LaTeX code, *i.e.* all the code between the string "A" and "B" will be parsed as LaTeX over the current *listings* style. In the example above, the comments for *Octave* start with `%`, and they are going to be printed in the document unless they start with `%*`, in which case they are read as LaTeX (with all LaTeX commands fulfilled) until they're closed with another `*)`.

If you add the above paragraph, the following can be used to alter the settings within the code:

```
\lstset{language=C,caption={Descriptive Caption Text},label=DescriptiveLabel}
```

There are many more options, check the [listing package developer guide](https://mirror.niser.ac.in/ctan/macros/latex/contrib/listings/listings-devel.pdf)).

The package lets you define styles, *i.e.* profiles specifying a set of settings.

Example

```
\lstdefinestyle{customc}{

  belowcaptionskip=1\baselineskip,

  breaklines=true,

  frame=L,

  xleftmargin=\parindent,

  language=C,

  showstringspaces=false,

  basicstyle=\footnotesize\ttfamily,

  keywordstyle=\bfseries\color{green!40!black},

  commentstyle=\itshape\color{purple!40!black},

  identifierstyle=\color{blue},

  stringstyle=\color{orange},

}

\lstdefinestyle{customasm}{

  belowcaptionskip=1\baselineskip,

  frame=L,

  xleftmargin=\parindent,

  language=[x86masm]Assembler,

  basicstyle=\footnotesize\ttfamily,

  commentstyle=\itshape\color{purple!40!black},

}

\lstset{escapechar=@,style=customc}
```

In our example, we only set two options globally: the default style and the escape character. Usage:

```
\begin{lstlisting}

#include <stdio.h>

#define N 10

/* Block

 * comment */

int main()

{

    int i;

    // Line comment.

    puts("Hello world!");

    

    for (i = 0; i < N; i++)

    {

        puts("LaTeX is also great for programmers!");

    }

    return 0;

}

\end{lstlisting}

\lstinputlisting[caption=Scheduler, style=customc]{hello.c}
```

The C part will print as

![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Listings_Example.svg/561px-Listings_Example.svg.png)

If you have a bunch of source files you want to include, you may find yourself doing the same thing over and over again. This is where macros show their real power.

```
\newcommand{\includecode}[2][c]{\lstinputlisting[caption=#2, escapechar=, style=custom#1]{#2}<!---->}

% ...

\includecode{sched.c}

\includecode[asm]{sched.s}

% ...

\lstlistoflistings
```

In this example, we create one command to ease source code inclusion. We set the default style to be *customc*. All listings will have their name as caption: we do not have to write the file name twice thanks to the macro. Finally we list all listings with this command from the listings package.

See [Macros](https://en.wikibooks.org/wiki/LaTeX/Macros "LaTeX/Macros") for more details.

By default, listings does not support multi-byte encoding for source code. The `extendedchar` option only works for 8-bits encodings such as latin1.

To handle UTF-8, you should tell listings how to interpret the special characters by defining them like so

```
\lstset{literate=

  {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1

  {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1

  {à}{{\\`a}}1 {è}{{\\`e}}1 {ì}{{\\`i}}1 {ò}{{\\`o}}1 {ù}{{\\`u}}1

  {À}{{\\`A}}1 {È}{{\\`E}}1 {Ì}{{\\`I}}1 {Ò}{{\\`O}}1 {Ù}{{\\`U}}1

  {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1

  {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1

  {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1

  {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1

  {ã}{{\~a}}1 {ẽ}{{\~e}}1 {ĩ}{{\~i}}1 {õ}{{\~o}}1 {ũ}{{\~u}}1

  {Ã}{{\~A}}1 {Ẽ}{{\~E}}1 {Ĩ}{{\~I}}1 {Õ}{{\~O}}1 {Ũ}{{\~U}}1

  {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1

  {ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1

  {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {Ø}{{\O}}1 {å}{{\r a}}1 {Å}{{\r A}}1

  {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1

  {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?\`}}1 {¡}{{!\`}}1 

}
```

The above table will cover most characters in latin languages. For a more detailed explanation of the usage of the `literate` option check section 5.4 in the [Listings Documentation](http://mirrors.ctan.org/macros/latex/contrib/listings/listings.pdf).

Another possibility is to replace `\usepackage{listings}` (in the preamble) with `\usepackage{listingsutf8}`, but this will only work for `\lstinputlisting{...}`.

You can have fancy captions (or titles) for your listings using the caption package. Here is an example for listings.

```
\usepackage{caption}

\usepackage{listings}

\DeclareCaptionFont{white}{ \color{white} }

\DeclareCaptionFormat{listing}{

  \colorbox[cmyk]{0.43, 0.35, 0.35,0.01 }{

    \parbox{\textwidth}{\hspace{15pt}#1#2#3}

  }

}

\captionsetup[lstlisting]{ format=listing, labelfont=white, textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize} }

% ...

\lstinputlisting[caption=My caption]{sourcefile.lang}
```

A lot more detailed information can be found in a [PDF by Carsten Heinz and Brooks Moses](http://mirrors.rit.edu/CTAN/macros/latex/contrib/listings/listings-devel.pdf).

Details and documentation about the Listings package can be found at [its CTAN website](http://www.ctan.org/tex-archive/macros/latex/contrib/listings/).