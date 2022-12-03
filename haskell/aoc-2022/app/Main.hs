module Main where

import Day01.Solution01 (part1, part2)
import TextFileHelper (fileLinesToList)

main :: IO ()
main = do
  let data1 = fileLinesToList "./data/input01"
  let day01 = part1 <$> data1
  day01 >>= putStrLn
  let day01' = part2 <$> data1
  day01' >>= putStrLn
