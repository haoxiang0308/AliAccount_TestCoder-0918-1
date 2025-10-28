import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'age': [25, 30, 35, 28, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney'],
    'salary': [50000, 60000, 70000, 55000, 45000]
}
df = pd.DataFrame(data)

# Filter the DataFrame (for example, age > 25)
filtered_df = df[df['age'] > 25]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (age > 25):")
print(filtered_df)

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to the randomly named file in proper format
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n")
    f.write("import pandas as pd\n\n")
    
    # Convert DataFrame to a dictionary format that can be reconstructed
    f.write("data = " + str(filtered_df.to_dict('records')) + "\n")
    f.write("filtered_df = pd.DataFrame(data)\n")
    
    f.write("\n# Display the filtered DataFrame\n")
    f.write("print('Filtered DataFrame loaded from file:')\n")
    f.write("print(filtered_df)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")