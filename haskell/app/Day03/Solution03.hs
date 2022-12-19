module Day03.Solution03 (part1, part2) where

import Data.List (elemIndex, find, head, splitAt, sum)
import Data.List.Split (chunksOf)
import Data.Maybe (fromMaybe)

part1 :: [String] -> String
part1 = show . sum . map (getLetterWeight . findCommonLetter . splitCenter)

part2 :: [String] -> String
part2 = show . sum . map (getLetterWeight . findCommonLetter3 . toTupleOf3) . chunksOf 3

splitCenter :: String -> (String, String)
splitCenter str =
  let center = length str `div` 2
   in splitAt center str

findCommonLetter :: (String, String) -> Char
findCommonLetter (str1, str2) = fromMaybe '0' (find (`elem` str2) str1)

getLetterWeight :: Char -> Int
getLetterWeight letter =
  let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
   in increment $ fromMaybe (-1) (elemIndex letter alphabet)

toTupleOf3 :: [String] -> (String, String, String)
toTupleOf3 strs = (strs !! 0, strs !! 1, strs !! 2)

increment :: Int -> Int
increment = (+) 1

findCommonLetter3 :: (String, String, String) -> Char
findCommonLetter3 (str1, str2, str3) = fromMaybe '0' (find (\str -> str `elem` str2 && str `elem` str3) str1)
