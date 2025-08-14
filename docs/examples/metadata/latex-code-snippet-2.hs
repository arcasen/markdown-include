Pandoc
  Meta
    { unMeta =
        fromList
          [ ( "header-includes"
            , MetaBlocks
                [ RawBlock (Format "tex") "\\usepackage{titlesec}"
                , Para
                    [ Str "\\titleformat{\\chapter}[display]"
                    , SoftBreak
                    , Str "{"
                    , RawInline (Format "tex") "\\vspace*{\\fill}"
                    , RawInline (Format "tex") "\\centering"
                    , RawInline (Format "tex") "\\Huge"
                    , RawInline (Format "tex") "\\bfseries"
                    , Str "}"
                    , SoftBreak
                    , Str "{\31532"
                    , Space
                    , RawInline (Format "tex") "\\thechapter "
                    , Str "\31456}"
                    , SoftBreak
                    , Str "{20pt}"
                    , SoftBreak
                    , Str "{"
                    , RawInline (Format "tex") "\\centering"
                    , Str "}"
                    , SoftBreak
                    , Str "["
                    , RawInline (Format "tex") "\\vspace*{\\fill}"
                    , RawInline (Format "tex") "\\clearpage"
                    , Str "]"
                    ]
                ]
            )
          ]
    }
  [ Para [ Str "hello," , Space , Str "world" ] ]
