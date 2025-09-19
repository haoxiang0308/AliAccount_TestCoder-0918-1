-- Function to calculate the area of a circle
function calculate_circle_area(radius)
    -- Check if the radius is a positive number
    if type(radius) ~= "number" or radius <= 0 then
        error("Radius must be a positive number")
    end

    -- Calculate the area using the formula: area = π * radius^2
    local area = math.pi * radius * radius

    return area
end

-- Example usage:
-- local area = calculate_circle_area(5)
-- print("Area of the circle:", area)