object SumFunction {
  def sumNumbers(numbers: List[Int]): Int = {
    numbers.sum
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1, 2, 3, 4, 5)
    println(s"Сумма $testList равна ${sumNumbers(testList)}")
  }
}