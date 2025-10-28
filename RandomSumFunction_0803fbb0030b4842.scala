object ListSum {
  // Function to sum a list of numbers
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }

  // Alternative implementation using fold
  def sumListWithFold(numbers: List[Double]): Double = {
    numbers.foldLeft(0.0)(_ + _)
  }

  // Function that works with integers as well
  def sumIntList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Example usage
  def main(args: Array[String]): Unit = {
    val doubleList = List(1.5, 2.3, 3.7, 4.1, 5.9)
    val intList = List(1, 2, 3, 4, 5)
    
    println(s"Sum of double list: ${sumList(doubleList)}")
    println(s"Sum of int list: ${sumIntList(intList)}")
    println(s"Sum using fold: ${sumListWithFold(doubleList)}")
  }
}