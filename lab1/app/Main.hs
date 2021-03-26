module Main where

import Connection

main :: IO ()
main = do
  putStrLn "Inserting new section..."
  res <- insertSection "Music"
  print res
  res2 <- getStudentSections (2 :: Int)
  print res2


  