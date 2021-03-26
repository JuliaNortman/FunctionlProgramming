{-# LANGUAGE OverloadedStrings #-}

module Connection where

import Database.PostgreSQL.Simple
import Data.String

dbConnection :: IO Connection
dbConnection = connectPostgreSQL $ fromString "postgres://chpnweib:Mx7IPB1KjeBIjzFqV5Bv2jn5gbcgC4R6@hattie.db.elephantsql.com:5432/chpnweib"

getStudentSections sectionId = do
    c <- dbConnection
    let q = "SELECT section.name Section, section.days Days, teacher.name Teacher, student.name Student \
        \ FROM section INNER JOIN teacher ON section.teacher_id = teacher.id \
        \ INNER JOIN participants ON section.id = participants.section_id \
        \INNER JOIN student ON student.id = participants.student_id \
        \WHERE section.id = ?;"
    query c q $ Only (sectionId) :: IO [(String, String, String, String)]

insertSection name = do
    c <- dbConnection
    let q = "INSERT INTO section (name) VALUES (?) returning id;"
    query c q $ Only (name) :: IO [Only Int]
    
