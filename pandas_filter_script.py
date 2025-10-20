import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 32, 27, 31, 29],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Rome', 'Madrid'],
    'Salary': [50000, 60000, 75000, 55000, 68000, 52000, 70000, 62000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print()

# Filter the DataFrame (e.g., people older than 29)
filtered_df = df[df['Age'] > 29]

print("Filtered DataFrame (Age > 29):")
print(filtered_df)
print()

# Generate a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Generate a random filename for the output
random_filename = generate_random_filename()

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data as dictionary\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n\n")
    f.write("# Convert to DataFrame\n")
    f.write("df_filtered = pd.DataFrame(filtered_data)\n\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(df_filtered)\n")

print(f"Filtered DataFrame saved to: {random_filename}")
print(f"File exists: {os.path.exists(random_filename)}")