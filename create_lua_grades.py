import random
import json

# 创建学生成绩的字典（模拟Lua表）
student_grades = {
    "Alice": 85,
    "Bob": 92,
    "Charlie": 78,
    "David": 96,
    "Eve": 88
}

# 计算平均分
total_score = sum(student_grades.values())
student_count = len(student_grades)
average_score = total_score / student_count

# 生成随机文件名
random_num = random.randint(10000, 99999)
filename = f"grades_{random_num}.lua"

# 将数据写入.lua文件
with open(filename, 'w') as lua_file:
    # 将字典转换为JSON字符串，然后用引号包围，模拟Lua中的表
    grades_json_str = json.dumps(student_grades)
    lua_file.write(f'local studentGrades = {json.dumps(grades_json_str)}\n')
    lua_file.write(f'local averageScore = {average_score}\n')
    lua_file.write('print("Average Score: " .. averageScore)\n')

print(f"Data saved to {filename}")