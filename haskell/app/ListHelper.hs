module ListHelper
  ( toIntList,
  )
where

---- public ----
toIntList :: [String] -> [Int]
toIntList = map read