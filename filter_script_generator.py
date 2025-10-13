import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Create the content for the new .py file
script_content = f"""# This script was generated automatically.
# It contains a filtered DataFrame.

import pandas as pd

# Filtered data
data = {filtered_df.to_dict('records')}

# Create the DataFrame
df_filtered = pd.DataFrame(data)

if __name__ == "__main__":
    print("Filtered DataFrame:")
    print(df_filtered)
"""

# Write the script content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved to {random_filename}")