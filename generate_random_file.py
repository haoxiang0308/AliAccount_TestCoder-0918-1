import random
import string

# Define a simple structure-like data for a point
point_data = {
    "x": 10.5,
    "y": 20.3
}

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
filename = f"{random_name}.txt"

# Write the point data to the file
with open(filename, 'w') as f:
    f.write(f"Point(x={point_data['x']}, y={point_data['y']})\n")

print(f"Created file: {filename} with point data: {point_data}")