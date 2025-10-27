// Scala样例类：坐标点
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($$x, $$y)"
}

// 示例实例
val examplePoint = Point(3.5, 4.2)
