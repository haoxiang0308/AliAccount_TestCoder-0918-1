-- 学生成绩数据
-- 生成时间: 2025-10-21 18:28:04

-- 学生成绩表
local studentGrades = {
    {name = "张三", grade = 85},
    {name = "李四", grade = 92},
    {name = "王五", grade = 78},
    {name = "赵六", grade = 88},
    {name = "钱七", grade = 95},
}

-- 平均分
local average = 87.60

-- 输出信息
print("学生成绩列表:")
for i, student in ipairs(studentGrades) do
    print("姓名: " .. student.name .. ", 成绩: " .. student.grade)
end

print("\n平均分: " .. average)

-- 返回数据
return {
    grades = studentGrades,
    average = average
}
