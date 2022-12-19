module Main where

import Control.Monad (foldM)
import Data.Array (Array, assocs, listArray, (!))
import Data.Maybe (fromMaybe)
import qualified Day01.Solution01 as D01 (part1, part2)
import qualified Day02.Solution02 as D02 (part1, part2)
import qualified Day03.Solution03 as D03 (part1, part2)
import qualified Day04.Solution04 as D04 (part1, part2)
import TextFileHelper (fileLinesToList)

type Part = [String] -> String

data Solution = Solution
  { inputFile :: String,
    part1 :: Part,
    part2 :: Part
  }

solutions :: Array Int Solution
solutions =
  listArray
    (1, 4)
    [ Solution {inputFile = "input01", part1 = D01.part1, part2 = D01.part2},
      Solution {inputFile = "input02", part1 = D02.part1, part2 = D02.part2},
      Solution {inputFile = "input03", part1 = D03.part1, part2 = D03.part2},
      Solution {inputFile = "input04", part1 = D04.part1, part2 = D04.part2}
    ]

getPartSolution :: (Int, Int) -> IO [String] -> Part -> IO ()
getPartSolution (dayNb, partNb) strLines part = do
  let msg = "Day " ++ show dayNb ++ "/part " ++ show partNb ++ " result: "
  let greenInConsole str = "\x1b[32m" ++ str ++ "\x1b[0m"
  let result = (++) msg . greenInConsole . part <$> strLines
  result >>= putStrLn

getDaySolution :: (Int, Solution) -> IO ()
getDaySolution (index, solution) = do
  let strLines = fileLinesToList ("./data/" ++ inputFile solution)
  getPartSolution (index, 1) strLines (part1 solution)
  getPartSolution (index, 2) strLines (part2 solution)

main :: IO ()
main = do
  foldM (\_ cur -> getDaySolution cur) () (assocs solutions)
