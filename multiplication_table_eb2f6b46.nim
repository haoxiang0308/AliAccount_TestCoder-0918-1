import strutils

# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int) =
  # Выводим заголовок таблицы
  stdout.write("   |")
  for i in 1..size:
    stdout.write(" " & align($i, 4))
  echo ""
  
  # Выводим разделитель
  stdout.write("---|")
  for i in 1..size:
    stdout.write("----")
  echo ""
  
  # Выводим строки таблицы
  for i in 1..size:
    stdout.write(align($i, 3) & "|")
    for j in 1..size:
      stdout.write(" " & align($((i * j)), 4))
    echo ""

# Пример использования
printMultiplicationTable(10)