# Load a CSV file and print summary statistics
# Assumes the CSV file is named 'data.csv' and is in the current working directory

# Load the data
data <- read.csv("data.csv")

# Print the first few rows
print("First 6 rows:")
print(head(data))

# Print summary statistics
print("Summary statistics:")
print(summary(data))

# Print the structure of the data
print("Data structure:")
print(str(data))