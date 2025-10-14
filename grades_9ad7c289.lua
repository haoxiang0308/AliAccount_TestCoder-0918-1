-- Lua script to store student grades and calculate average

-- Define a table to store student names and their grades
local student_grades = {
    Alice = 85,
    Bob = 92,
    Charlie = 78,
    David = 96,
    Eve = 88
}

-- Calculate the average grade
local total = 0
local count = 0
for name, grade in pairs(student_grades) do
    total = total + grade
    count = count + 1
end

local average = total / count

-- Print the results
print("Student Grades:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average))

-- Return the table and average for potential use by other scripts
return {
    grades = student_grades,
    average = average
}