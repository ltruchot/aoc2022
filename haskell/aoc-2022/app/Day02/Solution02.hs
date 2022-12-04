module Day02.Solution02 (part1, part2) where

import Data.List (sort)
import Data.List.Split (splitOn)
import Text.Read (readMaybe)

part1 :: [String] -> String
part1 = show . sum . toRpsScoreList . toTupleList

part2 :: [String] -> String
part2 = show . sum . toRpsScoreList . toRpsList . toTupleList

tuplify2 :: [String] -> (Char, Char)
tuplify2 [x, y] = (head x, head y)

toTupleList :: [String] -> [(Char, Char)]
toTupleList = map (tuplify2 . splitOn " ")

toRpsScoreList :: [(Char, Char)] -> [Int]
toRpsScoreList = map getRpsScore

getRpsScore :: (Char, Char) -> Int
{- rock -}
getRpsScore ('A', 'X') = 4
getRpsScore ('A', 'Y') = 8
getRpsScore ('A', 'Z') = 3
{- paper -}
getRpsScore ('B', 'X') = 1
getRpsScore ('B', 'Y') = 5
getRpsScore ('B', 'Z') = 9
{- scissors -}
getRpsScore ('C', 'X') = 7
getRpsScore ('C', 'Y') = 2
getRpsScore ('C', 'Z') = 6
{- else -}
getRpsScore (x, y) = 0

toRpsList :: [(Char, Char)] -> [(Char, Char)]
toRpsList = map toRpsScore

toRpsScore :: (Char, Char) -> (Char, Char)
{- rock -}
toRpsScore ('A', 'X') = ('A', 'Z')
toRpsScore ('A', 'Y') = ('A', 'X')
toRpsScore ('A', 'Z') = ('A', 'Y')
{- paper -}
toRpsScore ('B', x) = ('B', x)
{- scissors -}
toRpsScore ('C', 'X') = ('C', 'Y')
toRpsScore ('C', 'Y') = ('C', 'Z')
toRpsScore ('C', 'Z') = ('C', 'X')