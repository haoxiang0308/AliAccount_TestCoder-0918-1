-- Lua script to store student grades and calculate average

local grades = {
    Alice = 85,
    Bob = 92,
    Charlie = 78,
    David = 96,
    Eve = 88
}

-- Calculate the sum and count
local sum = 0
local count = 0
for name, grade in pairs(grades) do
    sum = sum + grade
    count = count + 1
end

-- Calculate the average
local average = sum / count

-- Print the results
print("Student Grades:")
for name, grade in pairs(grades) do
    print(name .. ": " .. grade)
end
print("Average Grade: " .. average)

-- Return the data for potential external use
return {
    grades = grades,
    average = average
}