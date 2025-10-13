object ScalaSum {
  /**
   * Функция для суммирования списка чисел.
   *
   * @param numbers Список чисел типа Double.
   * @return Сумма всех чисел в списке.
   */
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }

  // Пример использования
  def main(args: Array[String]): Unit = {
    val exampleList = List(1.0, 2.0, 3.0, 4.0, 5.0)
    val result = sumList(exampleList)
    println(s"Сумма списка $exampleList равна $result")
  }
}