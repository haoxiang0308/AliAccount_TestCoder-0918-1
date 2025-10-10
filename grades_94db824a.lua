-- Lua script to store student grades and calculate average

-- Table to store student names and their grades
local studentGrades = {
    Alice = 85,
    Bob = 92,
    Charlie = 78,
    David = 88,
    Eve = 95
}

-- Function to calculate the average grade
local function calculateAverage(grades)
    local sum = 0
    local count = 0
    for name, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    if count == 0 then
        return 0
    end
    return sum / count
end

-- Calculate the average
local averageGrade = calculateAverage(studentGrades)

-- Print the results
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", averageGrade))

-- Return the table and average for potential external use
return {
    grades = studentGrades,
    average = averageGrade
}