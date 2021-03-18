module Participants where

import Database.PostgreSQL.Simple.FromRow

data Participants = Participants {
    section_id :: Integer,
    student_id :: Integer
} deriving (Show)

instance FromRow Participants where
  fromRow = Participants <$> field <*> field
