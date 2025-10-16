import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 27, 32, 29, 31],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 52000, 65000, 58000, 62000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., people with age less than 30)
filtered_df = df[df['Age'] < 30]

print("\nFiltered DataFrame (Age < 30):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data as a dictionary\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n\n")
    f.write("# Convert to DataFrame\n")
    f.write("filtered_df = pd.DataFrame(filtered_data)\n\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(filtered_df)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")
print(f"File exists: {os.path.exists(random_filename)}")