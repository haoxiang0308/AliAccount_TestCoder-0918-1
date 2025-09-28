-- Recursively calculate the length of a list
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Example usage
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    putStrLn $ "The length of " ++ show exampleList ++ " is: " ++ show (myLength exampleList)