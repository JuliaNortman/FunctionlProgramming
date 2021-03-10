module Horse where

import Data.List (sortBy)

sortByLength :: Ord c => (a, b, c) -> (a, b, c) -> Ordering
sortByLength (a1, b1, c1) (a2, b2, c2)
    |c1 <= c2 = LT
    |otherwise = GT

--first element in the triple
frst :: (a, b, c) -> a
frst (a, b, c) = a

--list of all possible fields where horse can get from the given field i
possibleMoves :: [(Integer, Bool)] -> Integer -> [(Integer, Bool)]
possibleMoves matrix i =
    [(a,b) | (a, b) <- matrix,
            not b,
            let i' = abs (a-i),
            ((i' == 10) ||
            (i' == 6) ||
            (i'== 17) ||
            (i' == 15)) &&
            (a `div` n /= row) &&
            (a `mod` n /= col)  ]
    where n = 8
          row = i `div` n
          col = i `mod` n

--generate chess board and place the horse on the field i
generateBoard :: Integer -> [(Integer, Bool)]
generateBoard i = [if a /= i then (a, False) else (a, True) | a <- [0 .. 63]]


nextMoves :: [(Integer, Bool)] -> Integer -> [(Integer, Bool, Int)]
nextMoves matrix i = sortBy sortByLength [(a, b, length . possibleMoves matrix $ a)
    | (a, b) <- possibleMoves matrix i]


nextMove :: [(Integer, Bool)] -> Integer -> [Integer]
nextMove matrix i
     | null moves = i : res
     | otherwise = i : nextMove matrix' i'
     where moves = nextMoves matrix i
           i' = frst (head moves)
           matrix' = [if a == i' then (a, True) else (a, b) | (a, b) <- matrix]
           res = []