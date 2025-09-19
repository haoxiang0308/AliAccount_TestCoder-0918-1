# This is the filtered DataFrame result
import pandas as pd

# Filtered data
filtered_data = [{'Name': 'Bob', 'Age': 32, 'City': 'London', 'Salary': 75000}, {'Name': 'David', 'Age': 47, 'City': 'Tokyo', 'Salary': 90000}]
filtered_df = pd.DataFrame(filtered_data)
print('Filtered DataFrame:')
print(filtered_df)
