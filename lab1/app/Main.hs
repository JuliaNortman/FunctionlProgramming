module Main where


main :: IO ()
main = do
  conn <- connect defaultConnectInfo { connectHost = "localhost"
                                    , connectDatabase = "sport"
                                    , connectUser = "postgres"
                                    , connectPassword = ""
                                    }
  mapM_ print =<<
    (query
       conn
       "SELECT id, name FROM student WHERE title like ? AND authors LIKE ?"
       ("Haskell" :: String, "Hutton" :: String) :: IO [Book])