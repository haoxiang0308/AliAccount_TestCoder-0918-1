
import pandas as pd

# Filtered DataFrame (Age > 30)
data = [{'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Eva', 'Age': 32, 'City': 'Berlin', 'Salary': 65000}]
filtered_df = pd.DataFrame(data)

print("Filtered DataFrame from saved file:")
print(filtered_df)
