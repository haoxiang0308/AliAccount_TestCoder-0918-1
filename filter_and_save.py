import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 32],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000]
}
df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 30)
filtered_df = df[df['Age'] > 30]

print("\nFiltered DataFrame (Age > 30):")
print(filtered_df)

# Generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for _ in range(length))
    return f"{random_name}.py"

# Save the filtered DataFrame to a randomly named .py file
filename = generate_random_filename()

# Create the content for the .py file
file_content = f"""
import pandas as pd

# Filtered DataFrame (Age > 30)
data = {filtered_df.to_dict('records')}
filtered_df = pd.DataFrame(data)

print("Filtered DataFrame from saved file:")
print(filtered_df)
"""

# Write to the randomly named .py file
with open(filename, 'w') as f:
    f.write(file_content)

print(f"\nFiltered DataFrame saved to {filename}")