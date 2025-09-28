# frozen_string_literal: true

module FactorialCalculator
  # Вычисляет факториал числа n (n!).
  # @param n [Integer] Неотрицательное целое число
  # @return [Integer] Факториал числа n
  def self.factorial(n)
    raise ArgumentError, "Число должно быть неотрицательным" if n < 0
    return 1 if n <= 1
    n * factorial(n - 1)
  end
end

# Пример использования:
# puts FactorialCalculator.factorial(5) # => 120