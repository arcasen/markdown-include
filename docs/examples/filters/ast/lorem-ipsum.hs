Pandoc
  Meta { unMeta = fromList [] }
  [ Header
      1
      ( "lorem-ipsum" , [] , [] )
      [ Str "Lorem" , Space , Str "ipsum" ]
  , Para
      [ Emph [ Str "Lorem" , Space , Str "ipsum" ]
      , Space
      , Str "dolor"
      , Space
      , Str "sit"
      , Space
      , Str "amet"
      ]
  ]
