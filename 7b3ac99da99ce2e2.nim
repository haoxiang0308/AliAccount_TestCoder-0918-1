# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  echo "Таблица умножения:"
  for i in 1..10:
    for j in 1..10:
      let result = i * j
      stdout.write align($result, 6)
    echo ""

# Вызов процедуры
printMultiplicationTable()