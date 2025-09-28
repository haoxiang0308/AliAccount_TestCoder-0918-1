
# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  ## Выводит таблицу умножения (треугольник Пифагора) от 1 до 9.
  for i in 1..9:
    for j in 1..i:
      stdout.write($j & " * " & $i & " = " & $(i*j) & "\t")
    stdout.write("\n")

printMultiplicationTable()
