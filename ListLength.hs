module Main where

-- | Calculates the length of a list using recursion.
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

main :: IO ()
main = do
    let testList = [1, 2, 3, 4, 5]
    putStrLn $ "The length of " ++ show testList ++ " is: " ++ show (listLength testList)

