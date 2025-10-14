-- Функция для объединения двух списков
mergeLists :: [a] -> [a] -> [a]
mergeLists = (++)

-- Пример использования
main :: IO ()
main = do
    let list1 = [1, 2, 3]
    let list2 = [4, 5, 6]
    let merged = mergeLists list1 list2
    print merged  -- Выведет: [1,2,3,4,5,6]
