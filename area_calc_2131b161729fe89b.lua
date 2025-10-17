-- Function to calculate the area of a circle
function calculate_circle_area(radius)
    if radius < 0 then
        error("Radius cannot be negative")
    end
    return math.pi * radius * radius
end

-- Example usage:
-- print(calculate_circle_area(5))