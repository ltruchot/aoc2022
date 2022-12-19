module Day04.Solution04 (part1, part2) where

import Data.List.Split (splitOn)
import ListHelper (toIntList)

part1 :: [String] -> String
part1 = show . sum . map (fromEnum . checkRange . map splitToIntTuple . splitOn ",")

splitToIntTuple :: String -> (Int, Int)
splitToIntTuple = tuplify . toIntList . splitOn "-"

containsEachOtherRange :: (Int, Int) -> (Int, Int) -> Bool
containsEachOtherRange (start1, end1) (start2, end2) = start1 <= start2 && end1 >= end2 || start2 <= start1 && end2 >= end1

checkRange :: [(Int, Int)] -> Bool
checkRange [(start1, end1), (start2, end2)] = containsEachOtherRange (start1, end1) (start2, end2)

tuplify :: [a] -> (a, a)
tuplify [x, y] = (x, y)

part2 :: [String] -> String
part2 = const "not implemented yet"
