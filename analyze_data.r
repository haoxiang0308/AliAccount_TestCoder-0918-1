# Load the CSV file into a data frame
# Assumes the CSV file is named 'data.csv' and is in the current working directory
data <- read.csv("data.csv")

# Print the first few rows of the data frame
print("First 6 rows of the dataset:")
print(head(data))

# Print summary statistics for each column
print("Summary statistics:")
print(summary(data))

# Print the structure of the data frame
print("Data structure:")
print(str(data))