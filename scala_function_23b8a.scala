// Функция для суммирования списка чисел
def sumNumbers(numbers: List[Int]): Int = {
  numbers.sum
}

// Альтернативная реализация без использования встроенного метода .sum
def sumNumbersManual(numbers: List[Int]): Int = {
  var total = 0
  for (num <- numbers) {
    total += num
  }
  total
}