import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 30, 22],
    'City': ['New York', 'London', 'Paris', 'New York', 'Tokyo']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., age greater than 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
# This saves the data itself, perhaps as a dictionary or list of dictionaries
with open(random_filename, 'w') as f:
    f.write(f"# Filtered data saved from filter_script.py\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n")

print(f"Original DataFrame:\n{df}")
print(f"\nFiltered DataFrame (Age > 25):\n{filtered_df}")
print(f"\nFiltered data saved to '{random_filename}'")
