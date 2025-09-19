import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'age': [25, 30, 35, 28, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'salary': [50000, 60000, 70000, 55000, 45000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., people older than 25)
filtered_df = df[df['age'] > 25]
print("\nFiltered DataFrame (age > 25):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data\n")
    f.write(f"data = {filtered_df.to_dict('records')}\n\n")
    f.write("# Create DataFrame\n")
    f.write("df = pd.DataFrame(data)\n")
    f.write("print(df)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")