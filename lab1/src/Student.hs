module Student where

import Database.PostgreSQL.Simple.FromRow

data Student = Student {
    id :: Integer,
    name :: String
} deriving (Show)

instance FromRow Student where
  fromRow = Student <$> field <*> field
