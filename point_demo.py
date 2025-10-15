import uuid
import json
from dataclasses import dataclass
from typing import Tuple

# 使用dataclass来模拟Scala的case class功能
@dataclass
class Point:
    x: float
    y: float
    
    def __str__(self):
        return f"Point({self.x}, {self.y})"
    
    def to_dict(self):
        return {"x": self.x, "y": self.y, "type": "Point"}

# 创建一个坐标点实例
point = Point(3.5, 7.2)

# 生成随机文件名
random_filename = f"point_{uuid.uuid4().hex}.txt"

# 将坐标点信息写入随机命名的文件
with open(random_filename, 'w') as file:
    file.write(str(point))
    file.write('\n')
    # 也可以写入JSON格式的数据
    json.dump(point.to_dict(), file, indent=2)

print(f"坐标点 {point} 已保存到文件: {random_filename}")

# 验证文件内容
with open(random_filename, 'r') as file:
    content = file.read()
    print(f"文件内容:\n{content}")