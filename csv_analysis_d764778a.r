# Load CSV file and print summary statistics
# This script loads a CSV file and displays summary statistics

# Load the CSV file
# Note: You'll need to specify the path to your CSV file
csv_file <- "your_data.csv"  # Replace with your actual file path
data <- read.csv(csv_file)

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 rows:")
print(head(data))

# Print dimensions
print(paste("Data Dimensions:", nrow(data), "rows and", ncol(data), "columns"))