# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: Replace 'your_file.csv' with the actual path to your CSV file
data <- read.csv("your_file.csv")

# Print the first few rows of the dataset
print("First 6 rows of the dataset:")
print(head(data))

# Print summary statistics for each column
print("Summary statistics:")
print(summary(data))

# Print the structure of the dataset
print("Dataset structure:")
print(str(data))

# Print dimensions of the dataset
print(paste("Dataset dimensions:", nrow(data), "rows and", ncol(data), "columns"))

# Print column names
print("Column names:")
print(names(data))