module Day03.Solution03 (part1, part2) where

import Data.List (elemIndex, find, head, splitAt, sum)
import Data.Maybe (fromMaybe)

part1 :: [String] -> String
part1 = show . sum . map (getLetterWeight . findCommonLetter . splitCenter)

part2 :: [String] -> String
part2 = const "not implemented yet"

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

increment :: Int -> Int
increment = (+) 1