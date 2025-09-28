-- Функция для объединения двух списков
mergeLists :: [a] -> [a] -> [a]
mergeLists list1 list2 = list1 ++ list2

-- Пример использования
main :: IO ()
main = do
    let listA = [1, 2, 3]
    let listB = [4, 5, 6]
    let mergedList = mergeLists listA listB
    print mergedList  -- Выведет: [1,2,3,4,5,6]