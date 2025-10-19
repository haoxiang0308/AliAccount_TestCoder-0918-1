// 定义一个Scala样例类表示坐标点
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointDemo extends App {
  // 创建一个示例坐标点
  val point = Point(3.5, 7.2)
  println(s"创建的坐标点: $point")
  
  // 将坐标点信息保存到随机命名的文件中
  import java.io.PrintWriter
  import scala.util.Random
  
  val fileName = s"point_${Random.nextInt(10000)}.txt"
  val writer = new PrintWriter(fileName)
  writer.write(point.toString)
  writer.close()
  
  println(s"坐标点已保存到文件: $fileName")
}