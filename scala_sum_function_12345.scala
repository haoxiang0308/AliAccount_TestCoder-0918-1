object ScalaSum {
  /**
   * Функция для суммирования списка чисел.
   * @param numbers Список чисел типа Double.
   * @return Сумма всех чисел в списке.
   */
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }

  // Пример использования
  def main(args: Array[String]): Unit = {
    val myList = List(1.0, 2.0, 3.0, 4.0, 5.0)
    val result = sumList(myList)
    println(s"Сумма списка $myList равна $result")
  }
}