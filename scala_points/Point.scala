case class Point(x: Double, y: Double)

object Point extends App {
  val p = Point(1.0, 2.5)
  println(s"Created point: $p")

  import java.io.PrintWriter
  import java.io.File
  import scala.util.Random

  val fileName = s"/workspace/scala_points/point_${Random.nextInt(10000)}.scala"
  val writer = new PrintWriter(new File(fileName))
  writer.write(p.toString)
  writer.close()
  println(s"Point saved to file: $fileName")
}