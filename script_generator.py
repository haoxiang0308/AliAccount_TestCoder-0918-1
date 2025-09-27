import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 40, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data\n")
    f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n\n")
    f.write("# Convert to DataFrame\n")
    f.write("df_from_file = pd.DataFrame(filtered_data)\n")

print(f"Script saved to {random_filename}")