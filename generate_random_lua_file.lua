-- Script to generate a random-named Lua file with student grades
math.randomseed(os.time()) -- Initialize random seed

-- Function to generate a random string
local function random_string(length)
    local result = {}
    for i = 1, length do
        result[i] = string.char(math.random(97, 122)) -- ASCII codes for 'a' to 'z'
    end
    return table.concat(result)
end

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

-- Generate random filename
local random_name = random_string(10)
local filename = random_name .. ".lua"

-- Open file for writing
local file = io.open(filename, "w")

if file then
    -- Write the Lua table and average to the file
    file:write("-- Student grades table\n")
    file:write("local student_grades = {\n")
    for name, grade in pairs(student_grades) do
        file:write(string.format("    [\"%s\"] = %d,\n", name, grade))
    end
    file:write("}\n\n")
    
    file:write("-- Average grade\n")
    file:write(string.format("local average_grade = %.2f\n\n", average_grade))
    
    file:write("-- Print the table and average\n")
    file:write("print(\"Student Grades:\")\n")
    file:write("for name, grade in pairs(student_grades) do\n")
    file:write("    print(name .. \": \" .. grade)\n")
    file:write("end\n\n")
    
    file:write("print(\"\\nAverage Grade: \" .. average_grade)\n\n")
    
    file:write("-- Return the table and average for use in other scripts\n")
    file:write("return {\n")
    file:write("    grades = student_grades,\n")
    file:write("    average = average_grade\n")
    file:write("}\n")
    
    file:close()
    print("Successfully created file: " .. filename)
else
    print("Error: Could not create file " .. filename)
end