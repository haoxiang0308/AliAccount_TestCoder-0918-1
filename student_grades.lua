-- Lua script to store student grades and calculate average

-- Define a table to store student data
local students = {
    { name = "Alice", grade = 85 },
    { name = "Bob", grade = 92 },
    { name = "Charlie", grade = 78 },
    { name = "Diana", grade = 96 },
    { name = "Eve", grade = 88 }
}

-- Function to calculate the average grade
local function calculate_average(student_table)
    local total = 0
    for i, student in ipairs(student_table) do
        total = total + student.grade
    end
    return total / #student_table
end

-- Calculate the average
local average_grade = calculate_average(students)

-- Print the results
print("Student Grades:")
for i, student in ipairs(students) do
    print("  " .. student.name .. ": " .. student.grade)
end
print("\nAverage Grade: " .. average_grade)

-- Return the data and average if this script is required by another
return {
    students = students,
    average = average_grade
}