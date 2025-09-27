-- Lua script to store student grades and calculate average

-- Define a table to store student data
local student_grades = {
    { name = "Alice", score = 95 },
    { name = "Bob", score = 87 },
    { name = "Charlie", score = 92 },
    { name = "Diana", score = 88 },
    { name = "Eve", score = 90 }
}

-- Function to calculate the average score
local function calculate_average(grades)
    local total = 0
    for i, student in ipairs(grades) do
        total = total + student.score
    end
    return total / #grades
end

-- Calculate the average
local average_score = calculate_average(student_grades)

-- Print the table and the average
print("Student Grades:")
for i, student in ipairs(student_grades) do
    print(i .. ". " .. student.name .. ": " .. student.score)
end

print("\nAverage Score: " .. average_score)

-- Return the data for potential external use (optional)
return {
    grades = student_grades,
    average = average_score
}