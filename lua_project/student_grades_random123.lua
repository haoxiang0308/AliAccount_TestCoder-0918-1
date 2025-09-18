-- 学生成绩表
local student_scores = {
    ["Alice"] = { math = 95, english = 87, science = 92 },
    ["Bob"] = { math = 78, english = 82, science = 85 },
    ["Charlie"] = { math = 90, english = 93, science = 88 },
    ["David"] = { math = 85, english = 80, science = 91 }
}

-- 计算单个学生的平均分
local function calculate_average(scores)
    local total = 0
    local count = 0
    for _, score in pairs(scores) do
        total = total + score
        count = count + 1
    end
    return total / count
end

-- 为主表添加平均分
for student, scores in pairs(student_scores) do
    student_scores[student]["average"] = calculate_average(scores)
end

-- 打印结果
for student, scores in pairs(student_scores) do
    print(student .. ":")
    for subject, score in pairs(scores) do
        print("  " .. subject .. ": " .. score)
    end
end