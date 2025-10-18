# Load CSV file and print summary statistics
# Read the CSV file (assuming it's in the current directory)
data <- read.csv("data.csv")

# Print the first few rows of the dataset
print("First 6 rows of the dataset:")
print(head(data))

# Print summary statistics for each column
print("Summary statistics:")
print(summary(data))

# Print the structure of the dataset
print("Dataset structure:")
print(str(data))