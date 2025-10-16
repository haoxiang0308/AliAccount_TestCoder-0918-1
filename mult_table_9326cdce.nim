# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  echo "Таблица умножения:"
  for i in 1..9:
    for j in 1..9:
      let result = i * j
      stdout.write(result, "\t")
    echo ""

# Вызов процедуры
printMultiplicationTable()