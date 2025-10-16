# R script to load CSV file and print summary statistics

# Load required library (if needed for advanced summaries)
# library(summary)

# Load CSV file - replace 'data.csv' with your actual file name
# For this example, I'll use a placeholder filename
data_file <- "data.csv"
data <- read.csv(data_file)

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