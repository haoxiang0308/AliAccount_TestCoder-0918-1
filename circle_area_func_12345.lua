-- Function to calculate the area of a circle
function calculateCircleArea(radius)
    if radius < 0 then
        error("Radius cannot be negative")
    end
    return math.pi * radius * radius
end

-- Example usage:
-- print(calculateCircleArea(5)) -- This would print the area of a circle with radius 5