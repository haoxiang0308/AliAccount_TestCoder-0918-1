case class Point(x: Double, y: Double)

object PointApp extends App {
  val p1 = Point(1.0, 2.5)
  val p2 = Point(3.0, 4.0)
  println(s"Point 1: $p1")
  println(s"Point 2: $p2")

  // 将对象信息写入一个随机命名的文件
  val fileName = scala.util.Random.alphanumeric.take(10).mkString("", "", ".txt")
  val fileContent = s"Point 1: $p1\nPoint 2: $p2\n"
  scala.tools.nsc.io.File(fileName).writeAll(fileContent)
  println(s"Points saved to file: $fileName")
}