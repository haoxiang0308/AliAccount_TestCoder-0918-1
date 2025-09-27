# Метод для вычисления факториала числа
def factorial(n)
  # Проверяем, является ли число неотрицательным целым
  return nil if n < 0 || n != n.to_i

  # Базовые случаи
  return 1 if n == 0 || n == 1

  # Рекурсивное вычисление факториала
  n * factorial(n - 1)
end

# Примеры использования
puts factorial(5)  # Выведет: 120
puts factorial(0)  # Выведет: 1
puts factorial(-1) # Выведет: nil