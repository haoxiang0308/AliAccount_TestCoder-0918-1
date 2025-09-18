import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'age': [25, 32, 18, 47, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., people older than 21)
filtered_df = df[df['age'] > 21]

# Function to generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(length))
    return random_string + ".py"

# Generate random filename
filename = generate_random_filename()

# Save filtered DataFrame to the random file
# We'll save it as Python code that recreates the filtered DataFrame
filtered_code = f'''
import pandas as pd

# Recreating the filtered DataFrame
data = {filtered_df.to_dict('list')}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame saved in this file:")
print(filtered_df)
'''

# Write to the randomly named file
with open(filename, 'w') as f:
    f.write(filtered_code)

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (age > 21):")
print(filtered_df)
print(f"\nFiltered DataFrame saved to: {filename}")