# Filtered DataFrame saved to this file

import pandas as pd

# Data as a dictionary
filtered_data = [{'Name': 'Alice', 'Age': 25, 'City': 'New York', 'Salary': 50000}, {'Name': 'David', 'Age': 28, 'City': 'Tokyo', 'Salary': 55000}, {'Name': 'Eva', 'Age': 27, 'City': 'Sydney', 'Salary': 52000}, {'Name': 'Grace', 'Age': 29, 'City': 'Madrid', 'Salary': 58000}]

# Convert to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(filtered_df)
