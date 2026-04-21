
fibonacci :: Int -> Int


fibonacci n
  | n > 1 = fibonacci (n - 1) + fibonacci (n - 2)
  | n == 0 = 0
  | otherwise = 1

{-
otro forma

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-}


main :: IO ()
main = do

    print (fibonacci 1)    
    print (fibonacci 4)    