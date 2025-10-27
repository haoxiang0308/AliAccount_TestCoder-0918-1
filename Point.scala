// 定义一个Scala样例类表示坐标点
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // 创建一个坐标点实例
  val point = Point(3.5, 4.2)
  
  // 生成随机文件名
  val randomFileName = s"point_data_${System.currentTimeMillis()}.scala"
  
  // 将样例类定义保存到随机命名的文件中
  import java.io.PrintWriter
  val writer = new PrintWriter(randomFileName)
  writer.write(
    s"""// Scala样例类：坐标点
       |case class Point(x: Double, y: Double) {
       |  override def toString: String = s"Point($$x, $$y)"
       |}
       |
       |// 示例实例
       |val examplePoint = Point(${point.x}, ${point.y})
       |""".stripMargin
  )
  writer.close()
  
  println(s"坐标点样例类已保存到文件: $randomFileName")
  println(s"坐标点实例: $point")
}