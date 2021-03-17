module Jq.Filters where

data Filter = Identity

instance Show Filter where
  show Identity = "."

newtype Config = ConfigC {filters :: Filter}
{-
  data Config = ConfigC {filters :: Filter}
Perhaps:
  newtype Config = ConfigC {filters :: Filter}
Note: decreases laziness
-}