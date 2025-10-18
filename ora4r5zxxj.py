import pandas as pd

# Original DataFrame
original_data = {'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'], 'Age': [25, 30, 35, 28, 22, 40, 33, 27], 'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Rome', 'Madrid'], 'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]}

# Filtered DataFrame
filtered_data = {'Name': ['Bob', 'Charlie', 'David', 'Frank', 'Grace', 'Henry'], 'Age': [30, 35, 28, 40, 33, 27], 'City': ['London', 'Paris', 'Tokyo', 'Berlin', 'Rome', 'Madrid'], 'Salary': [60000, 70000, 55000, 80000, 65000, 58000]}

original_df = pd.DataFrame(original_data)
filtered_df = pd.DataFrame(filtered_data)

print("Original DataFrame:")
print(original_df)
print("\nFiltered DataFrame (Age > 25 and Salary > 50000):")
print(filtered_df)
