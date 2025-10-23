# Filtered DataFrame saved to this file

import pandas as pd

# Data for the filtered DataFrame
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}]

# Create DataFrame from the data
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
