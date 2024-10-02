module FontParsing exposing(suite)

import BDF.Font
import TomThumb
import InvalidFont exposing (bogus)
import Test exposing (..)
import Expect

suite =
  describe "PDF.Font.fromString"
    [ test "parses valid font" <|
      \_ ->
        BDF.Font.fromString TomThumb.as_string
          |> Expect.ok
    , test "refuses invalid font" <|
      \_ ->
        BDF.Font.fromString bogus
          |> Expect.err
    ]



