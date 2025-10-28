# Filtered DataFrame saved to this file
import pandas as pd

data = [{'name': 'Bob', 'age': 30, 'city': 'London', 'salary': 60000}, {'name': 'Charlie', 'age': 35, 'city': 'Paris', 'salary': 70000}, {'name': 'David', 'age': 28, 'city': 'Tokyo', 'salary': 55000}]
filtered_df = pd.DataFrame(data)

# Display the filtered DataFrame
print('Filtered DataFrame loaded from file:')
print(filtered_df)
