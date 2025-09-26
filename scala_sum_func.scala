object SumList extends App {
  def sumList(numbers: List[Int]): Int = numbers.sum

  val exampleList = List(1, 2, 3, 4, 5)
  println(s"Sum of $exampleList is ${sumList(exampleList)}")
}