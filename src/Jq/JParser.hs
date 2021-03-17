module Jq.JParser where

import Parsing.Parsing
import Jq.Json

-- -- This function will parse characters
-- parseChar :: Char -> Parser Char
-- parseChar x = Parser f
--     where
--         f (y : ys)
--             | y == x = Just (ys, x)
--             | otherwise = Nothing
--         f [] = Nothing


-- Parse Null
parseJNull :: Parser JSON
parseJNull = do _ <- string "null"
                return JNull
{-  
token $ parseJNull
Perhaps:
  token parseJNull
  -}
parseJSON :: Parser JSON
parseJSON = token $ parseJNull

-- 
-- parseJString :: Parser JSON
-- parseJString = do _ <- string s && s /= "null"
--                 return JString



-- parseJNum :: Parser JSON
-- parseJNum = fun <$> notNull (spanParser isDigit)
--     where fun digitVal = JNum $ read digitVal


parseJBool :: Parser JSON
parseJBool = fun <$> (string "true" <|> string "false")
    where
        fun "true" = JBool True
        fun "false" = JBool False
        f _ = undefined

-- parseJObject :: Parser JSON
-- parseJObject = do _ <- object o
--                 return JObject


