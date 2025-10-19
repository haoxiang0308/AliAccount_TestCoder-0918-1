import random
import string
from dataclasses import dataclass
from typing import NamedTuple

# 使用dataclass模拟Scala的case class功能
@dataclass
class Point:
    x: float
    y: float
    
    def __str__(self):
        return f"Point({self.x}, {self.y})"
    
    def __repr__(self):
        return self.__str__()

def generate_random_filename(extension="txt"):
    """生成随机文件名"""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(8))
    return f"point_{random_string}.{extension}"

def save_point_to_file(point: Point):
    """将坐标点保存到随机命名的文件中"""
    filename = generate_random_filename()
    with open(filename, 'w') as f:
        f.write(str(point))
    return filename

# 创建一个示例坐标点
point = Point(3.5, 7.2)
print(f"创建的坐标点: {point}")

# 保存到随机命名的文件
filename = save_point_to_file(point)
print(f"坐标点已保存到文件: {filename}")

# 验证文件内容
with open(filename, 'r') as f:
    content = f.read()
    print(f"文件内容: {content}")