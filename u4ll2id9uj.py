# This Python file contains the filtered DataFrame
import pandas as pd

# Recreating the filtered DataFrame
data = {
    'Name': ['Bob', 'David'],
    'Age': [32, 47],
    'City': ['London', 'Tokyo'],
    'Salary': [65000, 80000]
}

filtered_df = pd.DataFrame(data)
print(filtered_df)
