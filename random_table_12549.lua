-- Create a table with methods using metatables
local Person = {}
Person.__index = Person  -- This allows us to access methods in the Person table

-- Constructor function
function Person:new(name, age)
    local obj = {
        name = name,
        age = age
    }
    setmetatable(obj, self)
    return obj
end

-- Method to get the person's name
function Person:get_name()
    return self.name
end

-- Method to get the person's age
function Person:get_age()
    return self.age
end

-- Method to set the person's age
function Person:set_age(age)
    self.age = age
end

-- Method to introduce the person
function Person:introduce()
    return "Hello, my name is " .. self.name .. " and I am " .. self.age .. " years old."
end

-- Metamethod to customize string representation
function Person.__tostring(self)
    return "Person[name: " .. self.name .. ", age: " .. self.age .. "]"
end

-- Metamethod to handle addition of two Person objects (concatenating names)
function Person.__add(self, other)
    return Person:new(self.name .. " & " .. other.name, math.floor((self.age + other.age) / 2))
end

-- Metamethod to handle equality comparison
function Person.__eq(self, other)
    return self.name == other.name and self.age == other.age
end

-- Create some example instances
local person1 = Person:new("Alice", 25)
local person2 = Person:new("Bob", 30)

-- Print the objects using the __tostring metamethod
print(person1)
print(person2)

-- Use the methods
print(person1:introduce())
print(person2:introduce())

-- Test the addition metamethod
local combined_person = person1 + person2
print("Combined person: " .. tostring(combined_person))

-- Test the equality metamethod
local person3 = Person:new("Alice", 25)
print("person1 == person3: " .. tostring(person1 == person3))

return Person