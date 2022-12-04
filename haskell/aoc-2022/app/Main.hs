module Main where

import qualified Day01.Solution01 as D01 (part1, part2)
import qualified Day02.Solution02 as D02 (part1, part2)
import TextFileHelper (fileLinesToList)

main :: IO ()
main = do
  let data1 = fileLinesToList "./data/input01"
  let day01 = D01.part1 <$> data1
  day01 >>= putStrLn
  let day01' = D01.part2 <$> data1
  day01' >>= putStrLn

  let data2 = fileLinesToList "./data/input02"
  let day02 = D02.part1 <$> data2
  day02 >>= putStrLn
  let day02' = D02.part2 <$> data2
  day02' >>= putStrLn
