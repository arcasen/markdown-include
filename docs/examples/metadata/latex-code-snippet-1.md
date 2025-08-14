---
header-includes: |
  \renewcommand*{\thefootnote}{(\alph{footnote})}
  \newcommand{\smalltext}[1]{\small#1}
  \usepackage{etoolbox}
  \pretocmd{\section}{\clearpage}{}{}
  \preto{\section}{\setcounter{footnote}{0}} 
  \apptocmd{\toprule}{\rowcolor{cyan!40}}{}{}
---

hello, world