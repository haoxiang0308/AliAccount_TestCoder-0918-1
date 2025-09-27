# frozen_string_literal: true

# Метод для вычисления факториала числа
def factorial(n)
  # Проверка на неотрицательное целое число
  raise ArgumentError, "Число должно быть неотрицательным целым числом" if n < 0 || n != n.to_i

  # Базовые случаи
  return 1 if n == 0 || n == 1

  # Рекурсивное вычисление факториала
  n * factorial(n - 1)
end

# Пример использования
puts factorial(5) # Выведет 120