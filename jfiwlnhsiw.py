import pandas as pd

# Sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., Age > 30)
filtered_df = df[df['Age'] > 30]

# Save the filtered DataFrame to a new CSV file
filtered_df.to_csv('filtered_data.csv', index=False)

print("Filtered DataFrame saved to \'{random_filename.replace('.py', '.csv')}\'")
print(filtered_df)
