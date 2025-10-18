# Load CSV file and print summary statistics

# Specify the path to your CSV file
# For this example, we'll assume the file is named 'data.csv' and is in the current directory
# Replace 'data.csv' with the actual path to your CSV file
csv_file_path <- "data.csv"

# Load the CSV file into a data frame
data <- read.csv(csv_file_path)

# Print the first few rows of the data frame to verify it loaded correctly
print("First few rows of the data:")
print(head(data))

# Print summary statistics for each column
print("Summary statistics:")
print(summary(data))