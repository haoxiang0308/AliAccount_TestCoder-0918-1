
import pandas as pd

# Recreating the filtered DataFrame
data = {'name': ['Alice', 'Bob', 'David', 'Eve'], 'age': [25, 32, 47, 22], 'city': ['New York', 'London', 'Tokyo', 'Berlin']}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame saved in this file:")
print(filtered_df)
