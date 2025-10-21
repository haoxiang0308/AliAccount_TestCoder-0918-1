// Function to sum a list of numbers
def sumList(numbers: List[Int]): Int = {
  var total = 0
  for (num <- numbers) {
    total += num
  }
  total
}

// Alternative implementation using fold
def sumListFold(numbers: List[Int]): Int = {
  numbers.foldLeft(0)(_ + _)
}

// Example usage
val numbers = List(1, 2, 3, 4, 5)
println("Sum using for loop: " + sumList(numbers))
println("Sum using fold: " + sumListFold(numbers))
