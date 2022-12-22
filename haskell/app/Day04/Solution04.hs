module Day04.Solution04 (part1, part2) where

import Data.List.Split (splitOn)
import ListHelper (toIntList)

part1 :: [String] -> String
part1 = show . sum . map (fromEnum . checkInRange . map splitToIntTuple . splitOn ",")

part2 :: [String] -> String
part2 = show . sum . map (fromEnum . checkOverlapRange . map splitToIntTuple . splitOn ",")

splitToIntTuple :: String -> (Int, Int)
splitToIntTuple = tuplify . toIntList . splitOn "-"

containsEachOtherRange :: (Int, Int) -> (Int, Int) -> Bool
containsEachOtherRange (start1, end1) (start2, end2) = start1 <= start2 && end1 >= end2 || start2 <= start1 && end2 >= end1

checkInRange :: [(Int, Int)] -> Bool
checkInRange [(start1, end1), (start2, end2)] = containsEachOtherRange (start1, end1) (start2, end2)

overlapEachOtherRange :: (Int, Int) -> (Int, Int) -> Bool
overlapEachOtherRange (start1, end1) (start2, end2) = start2 <= end1 && end2 >= start1 || start1 <= end2 && end1 >= start2

checkOverlapRange :: [(Int, Int)] -> Bool
checkOverlapRange [(start1, end1), (start2, end2)] = overlapEachOtherRange (start1, end1) (start2, end2)

tuplify :: [a] -> (a, a)
tuplify [x, y] = (x, y)
