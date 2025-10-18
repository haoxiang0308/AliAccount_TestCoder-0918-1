import java.io.PrintWriter
import scala.util.Random

object Main extends App {
  // Create an instance of Point
  val point = Point(3.5, 7.2)
  
  // Generate a random filename
  val random = new Random()
  val randomFileName = s"point_${random.nextInt(10000)}.txt"
  
  // Save the point to the randomly named file
  val writer = new PrintWriter(randomFileName)
  writer.write(point.toString)
  writer.close()
  
  println(s"Point $point saved to file: $randomFileName")
}