-- | Function to merge two lists by concatenation
mergeLists :: [a] -> [a] -> [a]
mergeLists list1 list2 = list1 ++ list2

-- Example usage:
-- mergeLists [1, 2, 3] [4, 5, 6]  -- Result: [1, 2, 3, 4, 5, 6]
-- mergeLists "Hello" "World"        -- Result: "HelloWorld"