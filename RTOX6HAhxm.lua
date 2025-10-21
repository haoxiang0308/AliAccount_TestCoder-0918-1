-- Lua表存储学生成绩并计算平均分
local student_grades = {
    ["张三"] = 85,
    ["李四"] = 92,
    ["王五"] = 78,
    ["赵六"] = 88,
    ["孙七"] = 95
}

-- 计算平均分的函数
function calculate_average(grades)
    local total = 0
    local count = 0
    
    for name, score in pairs(grades) do
        total = total + score
        count = count + 1
    end
    
    if count > 0 then
        return total / count
    else
        return 0
    end
end

-- 输出学生成绩
print("学生成绩:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

-- 计算并输出平均分
local average = calculate_average(student_grades)
print("\n平均分: " .. string.format("%.2f", average))

-- 返回包含学生成绩和平均分的表，以便在其他地方使用
return {
    grades = student_grades,
    average = average
}