module Day01.Solution01 (part1, part2) where

import Data.List (sort)
import Data.List.Split (splitWhen)
import ListHelper (toIntList)
import Text.Read (readMaybe)

part1 :: [String] -> String
part1 = show . maximum . sumBySubList . splitWhenEmpty

part2 :: [String] -> String
part2 = show . sum . lastN 3 . sort . sumBySubList . splitWhenEmpty

splitWhenEmpty :: [String] -> [[String]]
splitWhenEmpty = splitWhen (== "")

sumBySubList :: [[String]] -> [Int]
sumBySubList = map (sum . toIntList)

lastN :: Int -> [a] -> [a]
lastN n xs = drop (length xs - n) xs
