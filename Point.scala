case class Point(x: Double, y: Double)

object PointApp extends App {
  val origin = Point(0.0, 0.0)
  val pointA = Point(3.5, 7.2)
  println(s"Origin: $origin")
  println(s"Point A: $pointA")
}