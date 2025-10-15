// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // 创建一个坐标点实例
  val point = Point(3.5, 4.2)
  
  // 生成随机文件名
  import java.io.PrintWriter
  import java.io.File
  import scala.util.Random
  
  val randomFileName = s"point_${Random.nextInt(10000)}.txt"
  val file = new File(randomFileName)
  
  // 将坐标点信息写入文件
  val writer = new PrintWriter(file)
  writer.write(point.toString)
  writer.close()
  
  println(s"坐标点已保存到文件: $randomFileName")
  println(s"坐标点信息: $point")
}