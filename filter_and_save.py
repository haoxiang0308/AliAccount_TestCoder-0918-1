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

# Filter the DataFrame (example: people older than 25 with salary > 40000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]

print("\nFiltered DataFrame (Age > 25 AND Salary > 40000):")
print(filtered_df)

# Generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return random_name + '.py'

# Generate random filename
filename = generate_random_filename()
print(f"\nSaving to file: {filename}")

# Save the script to the randomly named file
with open(filename, 'w') as f:
    f.write("import pandas as pd\n\n")
    f.write("# Original data\n")
    f.write(f"data = {data}\n\n")
    f.write("df = pd.DataFrame(data)\n")
    f.write("print('Original DataFrame:')\n")
    f.write("print(df)\n\n")
    f.write("# Filtered data\n")
    f.write("filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]\n")
    f.write("print('\\nFiltered DataFrame (Age > 25 AND Salary > 40000):')\n")
    f.write("print(filtered_df)\n")

print("Script saved successfully!")