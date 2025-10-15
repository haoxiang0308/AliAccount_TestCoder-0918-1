import random
import string
from dataclasses import dataclass
from typing import Tuple

# 使用dataclass模拟Scala样例类的功能
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
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"point_{random_string}.{extension}"

def save_point_to_file(point: Point, filename: str):
    """将坐标点保存到文件"""
    with open(filename, 'w') as file:
        file.write(str(point))
    print(f"坐标点 {point} 已保存到文件: {filename}")

# 创建坐标点实例
point = Point(3.5, 7.2)

# 生成随机文件名并保存
random_filename = generate_random_filename()
save_point_to_file(point, random_filename)

# 验证文件内容
print(f"\n验证文件内容:")
with open(random_filename, 'r') as file:
    content = file.read()
    print(f"文件 {random_filename} 的内容: {content}")