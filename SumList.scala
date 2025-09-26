object SumList {
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  def main(args: Array[String]): Unit = {
    val myList = List(1, 2, 3, 4, 5)
    println(s"Сумма списка $myList равна ${sumList(myList)}")
  }
}