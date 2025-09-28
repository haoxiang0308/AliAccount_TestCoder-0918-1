object ScalaSumFunction {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }

  // Альтернативная реализация с использованием foldLeft
  def sumListFold(numbers: List[Double]): Double = {
    numbers.foldLeft(0.0)(_ + _)
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1.0, 2.0, 3.0, 4.0, 5.0)
    println(s"Сумма элементов списка (sum): ${sumList(testList)}")
    println(s"Сумма элементов списка (fold): ${sumListFold(testList)}")
  }
}