Pandoc
  Meta
    { unMeta =
        fromList
          [ ( "header-includes"
            , MetaBlocks
                [ RawBlock
                    (Format "tex")
                    "\\renewcommand*{\\thefootnote}{(\\alph{footnote})}\n\\newcommand{\\smalltext}[1]{\\small#1}\n\\usepackage{etoolbox}\n\\pretocmd{\\section}{\\clearpage}{}{}\n\\preto{\\section}{\\setcounter{footnote}{0}} \n\\apptocmd{\\toprule}{\\rowcolor{cyan!40}}{}{}"
                ]
            )
          ]
    }
  [ Para [ Str "hello," , Space , Str "world" ] ]
