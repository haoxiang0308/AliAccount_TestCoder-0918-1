import random
import string
import os

# 定义Scala样例类内容
scala_code = '''// Scala样例类：坐标点
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($$x, $$y)"
}

// 示例实例
val examplePoint = Point(3.5, 4.2)
'''

# 生成随机文件名
random_filename = "point_data_" + ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + ".scala"

# 将样例类保存到随机命名的文件中
with open(random_filename, 'w') as file:
    file.write(scala_code)

print(f"坐标点样例类已保存到文件: {random_filename}")
print("文件内容:")
print(scala_code)