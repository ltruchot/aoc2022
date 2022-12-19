module TextFileHelper
  ( fileLinesToList,
  )
where

import Prelude (IO, String, fmap, lines, readFile, ($), (.))

---- public ----
fileLinesToList :: String -> IO [String]
fileLinesToList filepath = do
  fmap lines . readFile $ filepath
