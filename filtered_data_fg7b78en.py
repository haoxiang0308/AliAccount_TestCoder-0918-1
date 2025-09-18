import pandas as pd

# This script contains filtered data

# Original data
original_data = [{'name': 'Alice', 'age': 25, 'city': 'New York', 'salary': 50000}, {'name': 'Bob', 'age': 32, 'city': 'London', 'salary': 75000}, {'name': 'Charlie', 'age': 18, 'city': 'Paris', 'salary': 30000}, {'name': 'David', 'age': 47, 'city': 'Tokyo', 'salary': 90000}, {'name': 'Eva', 'age': 22, 'city': 'Berlin', 'salary': 45000}, {'name': 'Frank', 'age': 35, 'city': 'Sydney', 'salary': 80000}]

# Filtered data
filtered_data = [{'name': 'Bob', 'age': 32, 'city': 'London', 'salary': 75000}, {'name': 'David', 'age': 47, 'city': 'Tokyo', 'salary': 90000}, {'name': 'Frank', 'age': 35, 'city': 'Sydney', 'salary': 80000}]

# Create DataFrames
original_df = pd.DataFrame(original_data)
filtered_df = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(filtered_df)
