module Jq.Parser (module Jq.JParser, module Jq.CParser, parse) where

import qualified Parsing.Parsing as P (Parser, parse)
import Jq.JParser
import Jq.CParser

-- parser :: String -> Either (Int, Int, String) {-This prints the error and the error place!-} (String, a)
parse :: P.Parser a -> String -> Maybe a
parse p s = case (P.parse p s) of
  [(v, "")] -> Just v
  _ -> Nothing

