import random

# 学生成绩数据
students_grades = {
    "Alice": 85,
    "Bob": 92,
    "Charlie": 78,
    "Diana": 96,
    "Eve": 88
}

# 计算平均分
grades = list(students_grades.values())
average_grade = sum(grades) / len(grades)

# 生成随机文件名
random_num = random.randint(10000, 99999)
filename = f"grades_{random_num}.lua"

# 格式化为 Lua 代码
lua_content = f"""-- Lua Table for Student Grades
studentGrades = {{
{', '.join([f'    ["{name}"] = {grade}' for name, grade in students_grades.items()])}
}}

-- Calculated Average Grade
averageGrade = {average_grade}

print("Grades: ", studentGrades)
print("Average Grade: ", averageGrade)
"""

# 写入文件
with open(filename, 'w', encoding='utf-8') as f:
    f.write(lua_content)

print(f"Lua table created and saved to {filename}. Average grade is {average_grade:.2f}.")