proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения n x n
  # Выводим заголовок
  stdout.write "    |"
  for j in 1..n:
    stdout.write align($j, 4)
  echo ""
  # Выводим разделитель
  stdout.write "----+"
  for j in 1..n:
    stdout.write "----"
  echo ""

  # Выводим строки таблицы
  for i in 1..n:
    stdout.write align($i, 4) & "|"
    for j in 1..n:
      stdout.write align($(i * j), 4)
    echo ""

# Пример вызова процедуры для таблицы 10x10
printMultiplicationTable(10)