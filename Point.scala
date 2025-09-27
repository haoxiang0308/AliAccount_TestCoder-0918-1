// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double)

// 定义一个包含 main 方法的对象来运行示例
object Main extends App {
  // 示例：创建一个 Point 实例并打印
  val myPoint = Point(3.5, 7.2)
  println(s"创建的点是: $myPoint")
}