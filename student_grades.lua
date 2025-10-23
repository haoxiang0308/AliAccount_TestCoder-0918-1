-- Lua table to store student grades
local student_grades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88
}

-- Function to calculate average grade
local function calculate_average(grades)
    local total = 0
    local count = 0
    
    for name, grade in pairs(grades) do
        total = total + grade
        count = count + 1
    end
    
    if count == 0 then
        return 0
    else
        return total / count
    end
end

-- Calculate average
local average_grade = calculate_average(student_grades)

-- Print the table and average
print("Student Grades:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average_grade))

-- Return the table and average for use in other scripts
return {
    grades = student_grades,
    average = average_grade
}