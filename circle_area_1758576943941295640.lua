-- Function to calculate the area of a circle
-- @param radius The radius of the circle
-- @return The area of the circle

function calculate_circle_area(radius)
    -- Use the formula: area = π * radius^2
    local pi = math.pi
    local area = pi * radius * radius
    return area
end

-- Example usage:
-- local area = calculate_circle_area(5)
-- print("Area of circle with radius 5 is: " .. area)