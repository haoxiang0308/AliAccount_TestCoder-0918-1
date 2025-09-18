import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 65000, 30000, 80000, 45000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., people older than 25 with salary > 40000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]

print("\nFiltered DataFrame (Age > 25 and Salary > 40000):")
print(filtered_df)

# Generate a random filename
def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_string}.py"

# Save this script to a randomly named .py file
filename = generate_random_filename()

# Read the current script content
with open(__file__, 'r') as f:
    script_content = f.read()

# Write to the new file
with open(filename, 'w') as f:
    f.write(script_content)

print(f"\nThis script has been saved as: {filename}")