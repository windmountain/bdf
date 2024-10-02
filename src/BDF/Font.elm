module BDF.Font exposing (fromString)

import Parser exposing (Parser, (|.), (|=), succeed, symbol, spaces, lineComment)

type BdfNumber
  = Int Int
  | Float Float

bdfNumber : Parser BdfNumber
bdfNumber =
  Parser.number
    { int = Just Int
    , float = Just Float
    , binary = Nothing
    , hex = Nothing
    , octal = Nothing
    }

type alias Font = {
  formatVersion : BdfNumber
  -- , fontName: String
  }

fontParser : Parser Font
fontParser =
  succeed Font
    |. spaces -- allowing for convenience with test fixture
    |. symbol "STARTFONT"
    |. spaces
    |= bdfNumber

fromString : String -> Result (List Parser.DeadEnd) Font
fromString fontString =
  Parser.run fontParser fontString
