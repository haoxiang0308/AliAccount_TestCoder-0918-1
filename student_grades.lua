-- Lua表存储学生成绩并计算平均分

-- 学生成绩表
local studentGrades = {
    {name = "张三", grade = 85},
    {name = "李四", grade = 92},
    {name = "王五", grade = 78},
    {name = "赵六", grade = 88},
    {name = "钱七", grade = 95}
}

-- 计算平均分函数
local function calculateAverage(grades)
    local sum = 0
    local count = 0
    
    for i, student in ipairs(grades) do
        sum = sum + student.grade
        count = count + 1
    end
    
    if count > 0 then
        return sum / count
    else
        return 0
    end
end

-- 输出所有学生成绩
print("学生成绩列表:")
for i, student in ipairs(studentGrades) do
    print("姓名: " .. student.name .. ", 成绩: " .. student.grade)
end

-- 计算并输出平均分
local average = calculateAverage(studentGrades)
print("\n平均分: " .. string.format("%.2f", average))

-- 返回学生成绩表和平均分
return {
    grades = studentGrades,
    average = average
}