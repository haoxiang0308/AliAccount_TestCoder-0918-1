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

# Filter the DataFrame (e.g., people older than 25)
filtered_df = df[df['Age'] > 25]

print("\nFiltered DataFrame (Age > 25):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save Python code to recreate the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# This Python file contains the filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write("# Recreating the filtered DataFrame\n")
    f.write("data = {\n")
    f.write(f"    'Name': {filtered_df['Name'].tolist()},\n")
    f.write(f"    'Age': {filtered_df['Age'].tolist()},\n")
    f.write(f"    'City': {filtered_df['City'].tolist()},\n")
    f.write(f"    'Salary': {filtered_df['Salary'].tolist()}\n")
    f.write("}\n\n")
    f.write("filtered_df = pd.DataFrame(data)\n")
    f.write("print(filtered_df)\n")

print(f"\nPython code to recreate filtered DataFrame saved to {random_filename}")