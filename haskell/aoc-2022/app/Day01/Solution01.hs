module Day01.Solution01 (part1, part2) where

import Data.List (sort)
import Data.List.Split (splitWhen)
import Text.Read (readMaybe)

part1 :: [String] -> String
part1 = show . maximum . sumBySubList . splitWhenEmpty

splitWhenEmpty :: [String] -> [[String]]
splitWhenEmpty = splitWhen (== "")

toIntList :: [String] -> [Int]
toIntList = map read

sumBySubList :: [[String]] -> [Int]
sumBySubList = map (sum . toIntList)

toStringList :: [Int] -> [String]
toStringList = map show

part2 :: [String] -> String
part2 = show . sum . lastN 3 . sort . sumBySubList . splitWhenEmpty

lastN :: Int -> [a] -> [a]
lastN n xs = drop (length xs - n) xs
