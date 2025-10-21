-- 生成随机命名的Lua文件并保存学生成绩

-- 生成随机文件名
local function generateRandomFileName()
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local filename = "student_data_"
    
    math.randomseed(os.time()) -- 设置随机种子
    
    for i = 1, 8 do  -- 生成8位随机字符
        local randomIndex = math.random(1, #chars)
        filename = filename .. chars:sub(randomIndex, randomIndex)
    end
    
    filename = filename .. ".lua"
    return filename
end

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

-- 获取随机文件名
local randomFileName = generateRandomFileName()

-- 计算平均分
local average = calculateAverage(studentGrades)

-- 创建内容字符串
local fileContent = "-- 学生成绩数据\n"
fileContent = fileContent .. "-- 生成时间: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n\n"

fileContent = fileContent .. "-- 学生成绩表\n"
fileContent = fileContent .. "local studentGrades = {\n"
for i, student in ipairs(studentGrades) do
    fileContent = fileContent .. "    {name = \"" .. student.name .. "\", grade = " .. student.grade .. "},\n"
end
fileContent = fileContent .. "}\n\n"

fileContent = fileContent .. "-- 平均分\n"
fileContent = fileContent .. "local average = " .. string.format("%.2f", average) .. "\n\n"

fileContent = fileContent .. "-- 输出信息\n"
fileContent = fileContent .. "print(\"学生成绩列表:\")\n"
fileContent = fileContent .. "for i, student in ipairs(studentGrades) do\n"
fileContent = fileContent .. "    print(\"姓名: \" .. student.name .. \", 成绩: \" .. student.grade)\n"
fileContent = fileContent .. "end\n\n"

fileContent = fileContent .. "print(\"\\n平均分: \" .. average)\n\n"

fileContent = fileContent .. "-- 返回数据\n"
fileContent = fileContent .. "return {\n"
fileContent = fileContent .. "    grades = studentGrades,\n"
fileContent = fileContent .. "    average = average\n"
fileContent = fileContent .. "}\n"

-- 写入文件
local file = io.open(randomFileName, "w")
if file then
    file:write(fileContent)
    file:close()
    print("学生成绩数据已保存到文件: " .. randomFileName)
else
    print("无法创建文件: " .. randomFileName)
end