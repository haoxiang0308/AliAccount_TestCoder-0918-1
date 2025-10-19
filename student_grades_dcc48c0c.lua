-- 学生成绩表
local studentGrades = {
    {name = "张三", grade = 85},
    {name = "李四", grade = 92},
    {name = "王五", grade = 78},
    {name = "赵六", grade = 88},
    {name = "孙七", grade = 95}
}

-- 计算平均分的函数
function calculateAverage(grades)
    local total = 0
    for i = 1, #grades do
        total = total + grades[i].grade
    end
    return total / #grades
end

-- 输出学生成绩
print("学生成绩列表：")
for i = 1, #studentGrades do
    print(studentGrades[i].name .. ": " .. studentGrades[i].grade)
end

-- 计算并输出平均分
local average = calculateAverage(studentGrades)
print("\n平均分: " .. string.format("%.2f", average))

-- 返回成绩表和平均分（可选，用于其他脚本使用）
return {
    grades = studentGrades,
    average = average
}