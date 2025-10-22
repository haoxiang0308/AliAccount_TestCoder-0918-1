# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: You'll need to specify the correct path to your CSV file
csv_file <- "your_data.csv"  # Replace with your actual CSV file path
data <- read.csv(csv_file)

# Print basic information about the dataset
cat("Dataset dimensions:", dim(data), "\n")
cat("Column names:", names(data), "\n\n")

# Print summary statistics
cat("Summary statistics:\n")
print(summary(data))

# Print structure of the dataset
cat("\nDataset structure:\n")
str(data)

# Print first few rows
cat("\nFirst 6 rows:\n")
print(head(data))