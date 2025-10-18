-- Haskell recursive function to calculate the length of a list
listLength :: [a] -> Int
listLength [] = 0                    -- Base case: empty list has length 0
listLength (x:xs) = 1 + listLength xs -- Recursive case: 1 + length of the rest of the list

-- Example usage
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    putStrLn $ "Length of " ++ show exampleList ++ " is: " ++ show (listLength exampleList)
    
    let emptyList = []
    putStrLn $ "Length of " ++ show emptyList ++ " is: " ++ show (listLength emptyList)
    
    let stringList = "hello"
    putStrLn $ "Length of " ++ show stringList ++ " is: " ++ show (listLength stringList)