proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения n x n
  # Вывод заголовка
  stdout.write "    "
  for j in 1..n:
    stdout.write align($j, 4)
  stdout.write "\n"

  # Вывод разделителя
  stdout.write "    "
  for j in 1..n:
    stdout.write "----"
  stdout.write "\n"

  # Вывод строк таблицы
  for i in 1..n:
    stdout.write align($i, 4)
    for j in 1..n:
      stdout.write align($(i * j), 4)
    stdout.write "\n"

# Пример использования
printMultiplicationTable(9)