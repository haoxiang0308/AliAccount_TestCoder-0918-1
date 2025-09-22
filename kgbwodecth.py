import pandas as pd

# Original data
data = {'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'], 'Age': [25, 32, 18, 47, 22], 'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'], 'Salary': [50000, 65000, 30000, 80000, 45000]}

df = pd.DataFrame(data)
print('Original DataFrame:')
print(df)

# Filtered data
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]
print('\nFiltered DataFrame (Age > 25 AND Salary > 40000):')
print(filtered_df)
