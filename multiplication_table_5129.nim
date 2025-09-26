# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int) =
  # Вывод заголовка
  stdout.write "   |"
  for j in 1..size:
    stdout.write align($j, 4)
  stdout.write "\n"
  
  # Вывод разделителя
  stdout.write "---"
  for j in 1..size:
    stdout.write "----"
  stdout.write "\n"
  
  # Вывод строк таблицы
  for i in 1..size:
    stdout.write align($i, 3) & "|"
    for j in 1..size:
      stdout.write align($(i * j), 4)
    stdout.write "\n"

# Пример использования процедуры
printMultiplicationTable(10)