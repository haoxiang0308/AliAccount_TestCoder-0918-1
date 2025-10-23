-- Student grades table
local student_grades = {
    ["Charlie"] = 78,
    ["Eve"] = 88,
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Diana"] = 96,
}

-- Average grade
local average_grade = 87.80

-- Print the table and average
print("Student Grades:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. average_grade)

-- Return the table and average for use in other scripts
return {
    grades = student_grades,
    average = average_grade
}
