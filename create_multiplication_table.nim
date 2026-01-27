import random
import strutils

randomize()

# Генерируем случайное имя файла
let fileName = "multiplication_table_" & $random(100000) & ".nim"

# Создаем содержимое программы с процедурой умножения
let content = """
# Программа для вывода таблицы умножения

proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения от 1 до n
  for i in 1..n:
    for j in 1..n:
      stdout.write fmt"{i * j:4}"
      if j < n: stdout.write " "
    echo ""

# Тестовый вызов процедуры
echo "Таблица умножения 9x9:"
printMultiplicationTable(9)
"""

# Записываем содержимое в файл
 writeFile(fileName, content)

echo "Файл успешно создан: ", fileName
echo "Содержимое:"
echo content