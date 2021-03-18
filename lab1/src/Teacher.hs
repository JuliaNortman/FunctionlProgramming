module Teacher where

import Database.PostgreSQL.Simple.FromRow

data Teacher = Teacher {
    id :: Integer,
    name :: String
} deriving (Show)

instance FromRow Teacher where
  fromRow = Teacher <$> field <*> field