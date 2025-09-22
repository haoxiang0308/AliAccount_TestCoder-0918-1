import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [70000, 85000, 50000, 120000, 65000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., people older than 25 with salary > 60000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 60000)]

print("\nFiltered DataFrame (Age > 25 and Salary > 60000):")
print(filtered_df)

# Generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return random_name + '.py'

# Save the script to a randomly named .py file
random_filename = generate_random_filename()
print(f"\nSaving to file: {random_filename}")

# For demonstration, we'll just save this script itself to the random file
with open(__file__, 'r') as source_file:
    script_content = source_file.read()

with open(random_filename, 'w') as target_file:
    target_file.write(script_content)

print("Script saved successfully!")