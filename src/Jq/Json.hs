module Jq.Json where

data JSON = JNull
    | JString String 
    | JNum Integer -- We still don't support floats
    | JObject [(String, JSON)] -- Instead of using map we use a list of pairs
    | JBool Bool 
    | JArray [JSON]
    deriving (Show, Eq) --Using SHow we can print things on terminal cause it implements Show

-- instance Show JSON where
--   show (JNull) = "null"
--   show (JString) = ""
--   show (JNum) = Number
--   show (JObject) = someObject
--   show (JBool) = Bool
