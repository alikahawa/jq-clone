module Jq.Json where

data JSON = JNull
    | JString String 
    | JNumber Integer -- Double -- We still don't support floats
    | JObject [(String, JSON)] -- Instead of using map we use a list of pairs
    | JBool Bool 
    | JArray [JSON]
    deriving (Show, Eq) --Using SHow we can print things on terminal cause it implements Show

-- getInt (JNumber n) = Just (truncate n)
getInt (JNumber n) = Just n
getInt _           = Nothing

getDouble (JNumber n) = Just n
getDouble _           = Nothing

getBool (JBool b) = Just b
getBool _         = Nothing

getObject (JObject o) = Just o
getObject _           = Nothing

getArray (JArray a) = Just a
getArray _          = Nothing

isNull v            = v == JNull


renderJValue :: JSON -> String
renderJValue (JString s)   = show s
renderJValue (JNumber n)   = show n
renderJValue (JBool True)  = "true"
renderJValue (JBool False) = "false"
renderJValue JNull         = "null"

-- For some reason the method intercalate is not working!
-- renderJValue (JObject o) = "{" ++ pairs o ++ "}"
--   where pairs [] = ""
--         pairs ps = intercalate ", " (map renderPair ps)
--         renderPair (k,v)   = show k ++ ": " ++ renderJValue v

-- renderJValue (JArray a) = "[" ++ values a ++ "]"
--   where values [] = ""
--         values vs = intercalate ", " (map renderJValue vs)