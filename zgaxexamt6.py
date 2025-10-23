# Filtered DataFrame saved to this file

import pandas as pd

# Data for the filtered DataFrame
filtered_data = [{'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Frank', 'Age': 40, 'City': 'Berlin', 'Salary': 80000}, {'Name': 'Grace', 'Age': 33, 'City': 'Madrid', 'Salary': 65000}]

# Create DataFrame from the data
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
