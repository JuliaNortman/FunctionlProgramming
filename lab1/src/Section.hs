module Section where

import Database.PostgreSQL.Simple.FromRow

data Section = Section {
    id :: Integer,
    name :: String,
    teacher_id :: Integer,
    days :: String
} deriving (Show)

instance FromRow Section where
  fromRow = Section <$> field <*> field <*> field <*> field

